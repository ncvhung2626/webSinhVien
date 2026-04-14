"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PaymentService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const crypto = require("crypto");
const qs = require("qs");
const giao_dich_thanh_toan_entity_1 = require("./entities/giao-dich-thanh-toan.entity");
const chi_tiet_thanh_toan_entity_1 = require("./entities/chi-tiet-thanh-toan.entity");
const dang_ky_hoc_service_1 = require("../dang-ky-hoc/dang-ky-hoc.service");
let PaymentService = class PaymentService {
    constructor(giaoDichRepo, chiTietRepo, dangKyHocService) {
        this.giaoDichRepo = giaoDichRepo;
        this.chiTietRepo = chiTietRepo;
        this.dangKyHocService = dangKyHocService;
        this.vnp_TmnCode = 'ONPNUHYN';
        this.vnp_HashSecret = 'KFTXA4QKGLD763WCNQSSQE6RJ84656LB';
        this.vnp_Url = 'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html';
        this.vnp_ReturnUrl = process.env.VNP_RETURN_URL || 'http://localhost:3000/api/payment/vnpay-callback';
    }
    async taoUrlThanhToan(dto, ipAddr) {
        const soTien = Number(dto.soTien);
        if (!soTien || isNaN(soTien) || soTien <= 0) {
            throw new common_1.BadRequestException('Số tiền không hợp lệ');
        }
        const ip = (ipAddr === '::1' || ipAddr === '::ffff:127.0.0.1') ? '127.0.0.1' : ipAddr;
        const maGiaoDich = `${dto.sinhVienId}_${Date.now()}`;
        const giaoDich = this.giaoDichRepo.create({
            sinhVienId: dto.sinhVienId,
            maGiaoDich,
            soTien,
            noiDung: JSON.stringify({
                sinhVienId: dto.sinhVienId,
                lopHocPhanIds: dto.lopHocPhanIds,
                noiDung: dto.noiDung,
            }),
            trangThai: 'cho_thanh_toan',
        });
        const saved = await this.giaoDichRepo.save(giaoDich);
        for (const item of dto.chiTiet) {
            const ct = this.chiTietRepo.create({
                giaoDichId: saved.id,
                dangKyHocId: item.dangKyHocId,
                lopHocPhanId: item.lopHocPhanId,
                soTinChi: item.soTinChi,
                donGiaTinChi: 450000,
                thanhTien: item.soTinChi * 450000,
            });
            await this.chiTietRepo.save(ct);
        }
        const payUrl = this.buildVnpayUrl(maGiaoDich, soTien, ip);
        return { payUrl, maGiaoDich, giaoDichId: saved.id };
    }
    async xuLyCallback(query) {
        const secureHash = query['vnp_SecureHash'];
        if (!secureHash) {
            throw new common_1.BadRequestException('Thiếu vnp_SecureHash trong callback');
        }
        let vnp_Params = { ...query };
        delete vnp_Params['vnp_SecureHash'];
        delete vnp_Params['vnp_SecureHashType'];
        vnp_Params = this.sortObject(vnp_Params);
        const signData = qs.stringify(vnp_Params, { encode: false });
        const checkHash = crypto
            .createHmac('sha512', this.vnp_HashSecret)
            .update(Buffer.from(signData, 'utf-8'))
            .digest('hex');
        if (checkHash.toLowerCase() !== secureHash.toLowerCase()) {
            console.error('[VNPAY] Chữ ký KHÔNG khớp!');
            console.error('  signData :', signData);
            console.error('  expected :', checkHash);
            console.error('  received :', secureHash);
            throw new common_1.BadRequestException('Chữ ký không hợp lệ');
        }
        const txnRef = query['vnp_TxnRef'];
        const resCode = query['vnp_ResponseCode'];
        const giaoDich = await this.giaoDichRepo.findOne({ where: { maGiaoDich: txnRef } });
        if (!giaoDich)
            throw new common_1.NotFoundException('Không tìm thấy giao dịch');
        if (resCode === '00') {
            await this.giaoDichRepo.update(giaoDich.id, {
                trangThai: 'thanh_cong',
                maPhanHoi: resCode,
                maGiaoDichVnpay: query['vnp_TransactionNo'],
                maNganHang: query['vnp_BankCode'],
            });
            try {
                const info = JSON.parse(giaoDich.noiDung || '{}');
                if (info.sinhVienId && info.lopHocPhanIds?.length > 0) {
                    await this.dangKyHocService.capNhatThanhToan(info.sinhVienId, info.lopHocPhanIds);
                }
            }
            catch { }
            return { code: '00', message: 'Thanh toán thành công' };
        }
        await this.giaoDichRepo.update(giaoDich.id, {
            trangThai: 'that_bai',
            maPhanHoi: resCode,
        });
        return { code: resCode, message: 'Thanh toán thất bại' };
    }
    findBySinhVien(sinhVienId) {
        return this.giaoDichRepo.find({
            where: { sinhVienId },
            order: { thoiGianTao: 'DESC' },
        });
    }
    async findOne(id) {
        const gd = await this.giaoDichRepo.findOne({ where: { id } });
        if (!gd)
            throw new common_1.NotFoundException(`Không tìm thấy giao dịch id=${id}`);
        return gd;
    }
    buildVnpayUrl(txnRef, soTien, ipAddr) {
        const now = new Date();
        const expire = new Date(now.getTime() + 15 * 60 * 1000);
        const params = {
            vnp_Amount: String(soTien * 100),
            vnp_Command: 'pay',
            vnp_CreateDate: this.formatDate(now),
            vnp_CurrCode: 'VND',
            vnp_ExpireDate: this.formatDate(expire),
            vnp_IpAddr: ipAddr,
            vnp_Locale: 'vn',
            vnp_OrderInfo: 'Thanh+toan+hoc+phi',
            vnp_OrderType: 'other',
            vnp_ReturnUrl: this.vnp_ReturnUrl,
            vnp_TmnCode: this.vnp_TmnCode,
            vnp_TxnRef: txnRef,
            vnp_Version: '2.1.0',
        };
        let vnp_Params = { ...params };
        vnp_Params = this.sortObject(vnp_Params);
        const signData = qs.stringify(vnp_Params, { encode: false });
        const signed = crypto
            .createHmac('sha512', this.vnp_HashSecret)
            .update(Buffer.from(signData, 'utf-8'))
            .digest('hex');
        vnp_Params['vnp_SecureHash'] = signed;
        return `${this.vnp_Url}?${qs.stringify(vnp_Params, { encode: false })}`;
    }
    sortObject(obj) {
        return Object.keys(obj)
            .sort()
            .reduce((sorted, key) => {
            sorted[key] = String(obj[key]);
            return sorted;
        }, {});
    }
    formatDate(date) {
        const pad = (n) => String(n).padStart(2, '0');
        return (date.getFullYear() +
            pad(date.getMonth() + 1) +
            pad(date.getDate()) +
            pad(date.getHours()) +
            pad(date.getMinutes()) +
            pad(date.getSeconds()));
    }
};
exports.PaymentService = PaymentService;
exports.PaymentService = PaymentService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(giao_dich_thanh_toan_entity_1.GiaoDichThanhToan)),
    __param(1, (0, typeorm_1.InjectRepository)(chi_tiet_thanh_toan_entity_1.ChiTietThanhToan)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository,
        dang_ky_hoc_service_1.DangKyHocService])
], PaymentService);
//# sourceMappingURL=payment.service.js.map