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
exports.DiemDanhService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const uuid_1 = require("uuid");
const diem_danh_entity_1 = require("./entities/diem-danh.entity");
const phien_diem_danh_entity_1 = require("./entities/phien-diem-danh.entity");
let DiemDanhService = class DiemDanhService {
    constructor(diemDanhRepo, phienRepo) {
        this.diemDanhRepo = diemDanhRepo;
        this.phienRepo = phienRepo;
    }
    async taoPhien(dto) {
        const phut = dto.thoiGianPhut || 10;
        const now = new Date();
        const phien = this.phienRepo.create({
            lopHocPhanId: dto.lopHocPhanId,
            maQrSession: (0, uuid_1.v4)(),
            batDau: now,
            thoiGianHetHan: new Date(now.getTime() + phut * 60 * 1000),
            daDong: false,
        });
        return this.phienRepo.save(phien);
    }
    async dongPhien(phienId) {
        await this.phienRepo.update(phienId, { daDong: true, thoiGianHetHan: new Date() });
        return { message: 'Đã đóng phiên điểm danh' };
    }
    async quetQr(dto) {
        const phien = await this.phienRepo.findOne({ where: { maQrSession: dto.maQrSession } });
        if (!phien)
            throw new common_1.NotFoundException('Mã QR không hợp lệ');
        const hetHan = phien.thoiGianHetHan && new Date() > phien.thoiGianHetHan;
        if (phien.daDong || hetHan)
            throw new common_1.BadRequestException('Phiên điểm danh đã đóng hoặc hết hạn');
        const exists = await this.diemDanhRepo.findOne({
            where: { sinhVienId: dto.sinhVienId, buoiHocId: phien.id },
        });
        if (exists)
            throw new common_1.BadRequestException('Bạn đã điểm danh phiên này rồi');
        const dd = this.diemDanhRepo.create({
            buoiHocId: phien.id,
            sinhVienId: dto.sinhVienId,
            trangThai: 'co_mat',
            hinhThuc: 'qr_code',
        });
        await this.diemDanhRepo.save(dd);
        return { message: 'Điểm danh thành công!', thoiGian: dd.thoiGian };
    }
    findBySinhVien(sinhVienId) {
        return this.diemDanhRepo.find({
            where: { sinhVienId },
            order: { thoiGian: 'DESC' },
        });
    }
    findByBuoiHoc(buoiHocId) {
        return this.diemDanhRepo.find({
            where: { buoiHocId },
            relations: ['sinhVien'],
        });
    }
    async suaTrangThai(id, trangThai) {
        const dd = await this.diemDanhRepo.findOne({ where: { id } });
        if (!dd)
            throw new common_1.NotFoundException(`Không tìm thấy bản ghi điểm danh id=${id}`);
        await this.diemDanhRepo.update(id, { trangThai, hinhThuc: 'thu_cong' });
        return this.diemDanhRepo.findOne({ where: { id } });
    }
};
exports.DiemDanhService = DiemDanhService;
exports.DiemDanhService = DiemDanhService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(diem_danh_entity_1.DiemDanh)),
    __param(1, (0, typeorm_1.InjectRepository)(phien_diem_danh_entity_1.PhienDiemDanh)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], DiemDanhService);
//# sourceMappingURL=diem-danh.service.js.map