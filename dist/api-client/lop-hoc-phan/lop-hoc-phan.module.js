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
exports.LopHocPhanModule = exports.LopHocPhanController = exports.LopHocPhanService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("@nestjs/common");
const typeorm_2 = require("@nestjs/typeorm");
const typeorm_3 = require("typeorm");
const common_3 = require("@nestjs/common");
const entities_1 = require("../entities");
const jwt_guard_1 = require("../auth/jwt.guard");
const QRCode = require("qrcode");
const uuid_1 = require("uuid");
let LopHocPhanService = class LopHocPhanService {
    constructor(lopRepo, buoiHocRepo, phienRepo, dangKyRepo) {
        this.lopRepo = lopRepo;
        this.buoiHocRepo = buoiHocRepo;
        this.phienRepo = phienRepo;
        this.dangKyRepo = dangKyRepo;
    }
    async getLopCuaGiangVien(giangVienId) {
        return this.lopRepo
            .createQueryBuilder('lhp')
            .leftJoinAndSelect('lhp.hocPhan', 'hp')
            .leftJoinAndSelect('lhp.giangVien', 'gv')
            .where('lhp.giang_vien_id = :id', { id: giangVienId })
            .getMany();
    }
    async getLopCuaSinhVien(sinhVienId) {
        return this.lopRepo
            .createQueryBuilder('lhp')
            .leftJoinAndSelect('lhp.hocPhan', 'hp')
            .innerJoin(entities_1.DangKyHoc, 'dkh', 'dkh.lop_hoc_phan_id = lhp.id AND dkh.sinh_vien_id = :id', { id: sinhVienId })
            .getMany();
    }
    async getChiTiet(lopId) {
        const lop = await this.lopRepo
            .createQueryBuilder('lhp')
            .leftJoinAndSelect('lhp.hocPhan', 'hp')
            .leftJoinAndSelect('lhp.giangVien', 'gv')
            .where('lhp.id = :id', { id: lopId })
            .getOne();
        const tongSV = await this.dangKyRepo.count({ where: { lop_hoc_phan_id: lopId } });
        const buoiHocs = await this.buoiHocRepo.find({ where: { lop_hoc_phan_id: lopId }, order: { ngay_hoc: 'DESC' } });
        const lichHoc = await this.lopRepo.manager.query(`SELECT * FROM lich_hoc WHERE lop_hoc_phan_id = $1`, [lopId]);
        return { lop, tongSinhVien: tongSV, buoiHocs, lichHoc };
    }
    async getThongKeBuoiHoc(lopId) {
        return this.lopRepo.manager.query(`
      SELECT bh.id, bh.ngay_hoc, bh.trang_thai,
        COUNT(CASE WHEN dd.trang_thai = 'co_mat' THEN 1 END)::int as so_co_mat,
        COUNT(CASE WHEN dd.trang_thai != 'co_mat' OR dd.id IS NULL THEN 1 END)::int as so_vang,
        (SELECT COUNT(*) FROM dang_ky_hoc WHERE lop_hoc_phan_id = $1)::int as tong_sv
      FROM buoi_hoc bh
      LEFT JOIN diem_danh dd ON dd.buoi_hoc_id = bh.id
      WHERE bh.lop_hoc_phan_id = $1
      GROUP BY bh.id, bh.ngay_hoc, bh.trang_thai
      ORDER BY bh.ngay_hoc DESC
    `, [lopId]);
    }
    async taoBuoiHoc(lopId, ngayHoc, trangThai = 'hoc') {
        const buoi = this.buoiHocRepo.create({ lop_hoc_phan_id: lopId, ngay_hoc: new Date(ngayHoc), trang_thai: trangThai });
        return this.buoiHocRepo.save(buoi);
    }
    async taoPhienDiemDanh(buoiHocId, thoiGianPhut = 15) {
        const buoi = await this.buoiHocRepo.findOne({ where: { id: buoiHocId } });
        if (!buoi)
            throw new common_2.BadRequestException('Buổi học không tồn tại');
        const maQR = (0, uuid_1.v4)();
        const batDau = new Date();
        const ketThuc = new Date(batDau.getTime() + thoiGianPhut * 60000);
        const phien = this.phienRepo.create({ buoi_hoc_id: buoiHocId, ma_qr_phien: maQR, bat_dau: batDau, ket_thuc: ketThuc });
        const saved = await this.phienRepo.save(phien);
        const qrImage = await QRCode.toDataURL(maQR);
        return { phien: saved, qrImage, maQR, ketThuc };
    }
    async getDiemHocPhan(lopId) {
        return this.lopRepo.manager.query(`
      SELECT
        sv.id, sv.mssv, sv.ho_ten, sv.lop,
        COUNT(DISTINCT bh.id)::int as tong_buoi,
        COUNT(DISTINCT CASE WHEN dd.trang_thai = 'co_mat' THEN dd.id END)::int as so_co_mat,
        CASE WHEN COUNT(DISTINCT bh.id) > 0
          THEN ROUND(COUNT(DISTINCT CASE WHEN dd.trang_thai = 'co_mat' THEN dd.id END)::numeric
               / COUNT(DISTINCT bh.id)::numeric * 10, 1)
          ELSE 0 END as diem_chuyen_can,
        COUNT(DISTINCT bt.id)::int as tong_bai_tap,
        COUNT(DISTINCT nb.id)::int as so_bai_da_nop
      FROM dang_ky_hoc dkh
      JOIN sinh_vien sv ON sv.id = dkh.sinh_vien_id
      LEFT JOIN buoi_hoc bh ON bh.lop_hoc_phan_id = $1
      LEFT JOIN diem_danh dd ON dd.buoi_hoc_id = bh.id AND dd.sinh_vien_id = sv.id
      LEFT JOIN bai_tap bt ON bt.lop_hoc_phan_id = $1
      LEFT JOIN nop_bai nb ON nb.bai_tap_id = bt.id AND nb.sinh_vien_id = sv.id
      WHERE dkh.lop_hoc_phan_id = $1
      GROUP BY sv.id, sv.mssv, sv.ho_ten, sv.lop
      ORDER BY sv.ho_ten ASC
    `, [lopId]);
    }
    async getDiemCaNhanSV(sinhVienId) {
        return this.lopRepo.manager.query(`
      SELECT
        hp.ten_hoc_phan, hp.so_tin_chi, lhp.ma_lop, lhp.hoc_ky,
        COUNT(DISTINCT bh.id)::int as tong_buoi,
        COUNT(DISTINCT CASE WHEN dd.trang_thai = 'co_mat' THEN dd.id END)::int as so_co_mat,
        CASE WHEN COUNT(DISTINCT bh.id) > 0
          THEN ROUND(COUNT(DISTINCT CASE WHEN dd.trang_thai = 'co_mat' THEN dd.id END)::numeric
               / COUNT(DISTINCT bh.id)::numeric * 10, 1)
          ELSE 0 END as diem_chuyen_can,
        COUNT(DISTINCT bt.id)::int as tong_bai_tap,
        COUNT(DISTINCT nb.id)::int as so_bai_da_nop
      FROM dang_ky_hoc dkh
      JOIN lop_hoc_phan lhp ON lhp.id = dkh.lop_hoc_phan_id
      JOIN hoc_phan hp ON hp.id = lhp.hoc_phan_id
      LEFT JOIN buoi_hoc bh ON bh.lop_hoc_phan_id = lhp.id
      LEFT JOIN diem_danh dd ON dd.buoi_hoc_id = bh.id AND dd.sinh_vien_id = $1
      LEFT JOIN bai_tap bt ON bt.lop_hoc_phan_id = lhp.id
      LEFT JOIN nop_bai nb ON nb.bai_tap_id = bt.id AND nb.sinh_vien_id = $1
      WHERE dkh.sinh_vien_id = $1
      GROUP BY hp.ten_hoc_phan, hp.so_tin_chi, lhp.ma_lop, lhp.hoc_ky
      ORDER BY lhp.hoc_ky DESC, hp.ten_hoc_phan ASC
    `, [sinhVienId]);
    }
    async getPhienHienTai(buoiHocId) {
        const phien = await this.phienRepo
            .createQueryBuilder('p')
            .where('p.buoi_hoc_id = :id AND p.ket_thuc > NOW()', { id: buoiHocId })
            .orderBy('p.bat_dau', 'DESC')
            .getOne();
        if (!phien)
            return { active: false };
        const qrImage = await QRCode.toDataURL(phien.ma_qr_phien);
        return { active: true, phien, qrImage };
    }
};
exports.LopHocPhanService = LopHocPhanService;
exports.LopHocPhanService = LopHocPhanService = __decorate([
    (0, common_2.Injectable)(),
    __param(0, (0, typeorm_2.InjectRepository)(entities_1.LopHocPhan)),
    __param(1, (0, typeorm_2.InjectRepository)(entities_1.BuoiHoc)),
    __param(2, (0, typeorm_2.InjectRepository)(entities_1.PhienDiemDanh)),
    __param(3, (0, typeorm_2.InjectRepository)(entities_1.DangKyHoc)),
    __metadata("design:paramtypes", [typeorm_3.Repository,
        typeorm_3.Repository,
        typeorm_3.Repository,
        typeorm_3.Repository])
], LopHocPhanService);
let LopHocPhanController = class LopHocPhanController {
    constructor(service) {
        this.service = service;
    }
    getLopGV(req) { return this.service.getLopCuaGiangVien(req.user.profileId); }
    getLopSV(req) { return this.service.getLopCuaSinhVien(req.user.profileId); }
    getChiTiet(id) { return this.service.getChiTiet(id); }
    getThongKe(id) { return this.service.getThongKeBuoiHoc(id); }
    taoBuoiHoc(id, body) {
        return this.service.taoBuoiHoc(id, body.ngay_hoc, body.trang_thai);
    }
    taoPhien(buoiId, body) {
        return this.service.taoPhienDiemDanh(buoiId, body.thoi_gian_phut || 15);
    }
    getPhienHienTai(buoiId) {
        return this.service.getPhienHienTai(buoiId);
    }
    getDiemHP(id) { return this.service.getDiemHocPhan(id); }
    getDiemCaNhan(req) { return this.service.getDiemCaNhanSV(req.user.profileId); }
};
exports.LopHocPhanController = LopHocPhanController;
__decorate([
    (0, common_3.Get)('giang-vien'),
    __param(0, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], LopHocPhanController.prototype, "getLopGV", null);
__decorate([
    (0, common_3.Get)('sinh-vien'),
    __param(0, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], LopHocPhanController.prototype, "getLopSV", null);
__decorate([
    (0, common_3.Get)(':id/chi-tiet'),
    __param(0, (0, common_3.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], LopHocPhanController.prototype, "getChiTiet", null);
__decorate([
    (0, common_3.Get)(':id/thong-ke'),
    __param(0, (0, common_3.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], LopHocPhanController.prototype, "getThongKe", null);
__decorate([
    (0, common_3.Post)(':id/buoi-hoc'),
    __param(0, (0, common_3.Param)('id')),
    __param(1, (0, common_3.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", void 0)
], LopHocPhanController.prototype, "taoBuoiHoc", null);
__decorate([
    (0, common_3.Post)('buoi-hoc/:buoiId/phien-diem-danh'),
    __param(0, (0, common_3.Param)('buoiId')),
    __param(1, (0, common_3.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", void 0)
], LopHocPhanController.prototype, "taoPhien", null);
__decorate([
    (0, common_3.Get)('buoi-hoc/:buoiId/phien-hien-tai'),
    __param(0, (0, common_3.Param)('buoiId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], LopHocPhanController.prototype, "getPhienHienTai", null);
__decorate([
    (0, common_3.Get)(':id/diem-hoc-phan'),
    __param(0, (0, common_3.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], LopHocPhanController.prototype, "getDiemHP", null);
__decorate([
    (0, common_3.Get)('diem-ca-nhan/sinh-vien'),
    __param(0, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], LopHocPhanController.prototype, "getDiemCaNhan", null);
exports.LopHocPhanController = LopHocPhanController = __decorate([
    (0, common_3.Controller)('lop-hoc-phan'),
    (0, common_3.UseGuards)(jwt_guard_1.JwtAuthGuard),
    __metadata("design:paramtypes", [LopHocPhanService])
], LopHocPhanController);
let LopHocPhanModule = class LopHocPhanModule {
};
exports.LopHocPhanModule = LopHocPhanModule;
exports.LopHocPhanModule = LopHocPhanModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([entities_1.LopHocPhan, entities_1.BuoiHoc, entities_1.PhienDiemDanh, entities_1.DangKyHoc])],
        controllers: [LopHocPhanController],
        providers: [LopHocPhanService],
        exports: [LopHocPhanService],
    })
], LopHocPhanModule);
//# sourceMappingURL=lop-hoc-phan.module.js.map