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
exports.DiemDanhModule = exports.DiemDanhController = exports.DiemDanhService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("@nestjs/common");
const typeorm_2 = require("@nestjs/typeorm");
const typeorm_3 = require("typeorm");
const common_3 = require("@nestjs/common");
const entities_1 = require("../entities");
const jwt_guard_1 = require("../auth/jwt.guard");
let DiemDanhService = class DiemDanhService {
    constructor(repo, phienRepo) {
        this.repo = repo;
        this.phienRepo = phienRepo;
    }
    async diemDanhQR(maQR, svId) {
        const phien = await this.phienRepo.createQueryBuilder('p').where('p.ma_qr_phien=:maQR AND p.ket_thuc>NOW()', { maQR }).getOne();
        if (!phien)
            throw new common_2.BadRequestException('Ma QR khong hop le hoac het han');
        const ex = await this.repo.findOne({ where: { buoi_hoc_id: phien.buoi_hoc_id, sinh_vien_id: svId } });
        if (ex)
            throw new common_2.BadRequestException('Ban da diem danh roi');
        return this.repo.save(this.repo.create({ buoi_hoc_id: phien.buoi_hoc_id, sinh_vien_id: svId, trang_thai: 'co_mat', hinh_thuc: 'qr' }));
    }
    async getDiemDanhBuoi(buoiId) { return this.repo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,COALESCE(dd.trang_thai,'vang') as trang_thai,dd.thoi_gian,dd.hinh_thuc FROM dang_ky_hoc dkh JOIN sinh_vien sv ON sv.id=dkh.sinh_vien_id JOIN buoi_hoc bh ON bh.id=$1 AND bh.lop_hoc_phan_id=dkh.lop_hoc_phan_id LEFT JOIN diem_danh dd ON dd.buoi_hoc_id=$1 AND dd.sinh_vien_id=sv.id ORDER BY sv.ho_ten`, [buoiId]); }
    async getThongKeVang(lopId) { return this.repo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,COUNT(bh.id)::int as tong_buoi,COUNT(CASE WHEN dd.trang_thai='co_mat' THEN 1 END)::int as so_co_mat,(COUNT(bh.id)-COUNT(CASE WHEN dd.trang_thai='co_mat' THEN 1 END))::int as so_vang FROM dang_ky_hoc dkh JOIN sinh_vien sv ON sv.id=dkh.sinh_vien_id CROSS JOIN buoi_hoc bh LEFT JOIN diem_danh dd ON dd.buoi_hoc_id=bh.id AND dd.sinh_vien_id=sv.id WHERE dkh.lop_hoc_phan_id=$1 AND bh.lop_hoc_phan_id=$1 GROUP BY sv.id,sv.mssv,sv.ho_ten,sv.lop ORDER BY so_vang DESC`, [lopId]); }
    async getLichSuVang(svId) { return this.repo.manager.query(`SELECT bh.ngay_hoc,hp.ten_hoc_phan,lhp.ma_lop,COALESCE(dd.trang_thai,'vang') as trang_thai,dd.thoi_gian,dd.hinh_thuc FROM dang_ky_hoc dkh JOIN lop_hoc_phan lhp ON lhp.id=dkh.lop_hoc_phan_id JOIN hoc_phan hp ON hp.id=lhp.hoc_phan_id JOIN buoi_hoc bh ON bh.lop_hoc_phan_id=lhp.id LEFT JOIN diem_danh dd ON dd.buoi_hoc_id=bh.id AND dd.sinh_vien_id=$1 WHERE dkh.sinh_vien_id=$1 ORDER BY bh.ngay_hoc DESC`, [svId]); }
    async ghiVang(buoiId, svId) {
        const ex = await this.repo.findOne({ where: { buoi_hoc_id: buoiId, sinh_vien_id: svId } });
        if (ex) {
            await this.repo.update(ex.id, { trang_thai: 'vang' });
            return { message: 'Da cap nhat' };
        }
        return this.repo.save(this.repo.create({ buoi_hoc_id: buoiId, sinh_vien_id: svId, trang_thai: 'vang', hinh_thuc: 'thu_cong' }));
    }
};
exports.DiemDanhService = DiemDanhService;
exports.DiemDanhService = DiemDanhService = __decorate([
    (0, common_2.Injectable)(),
    __param(0, (0, typeorm_2.InjectRepository)(entities_1.DiemDanh)),
    __param(1, (0, typeorm_2.InjectRepository)(entities_1.PhienDiemDanh)),
    __metadata("design:paramtypes", [typeorm_3.Repository, typeorm_3.Repository])
], DiemDanhService);
let DiemDanhController = class DiemDanhController {
    constructor(service) {
        this.service = service;
    }
    diemDanhQR(b, req) { return this.service.diemDanhQR(b.ma_qr, req.user.profileId); }
    getDiemDanhBuoi(buoiId) { return this.service.getDiemDanhBuoi(buoiId); }
    getThongKeVang(lopId) { return this.service.getThongKeVang(lopId); }
    getLichSuVang(req) { return this.service.getLichSuVang(req.user.profileId); }
    ghiVang(b) { return this.service.ghiVang(b.buoi_hoc_id, b.sinh_vien_id); }
};
exports.DiemDanhController = DiemDanhController;
__decorate([
    (0, common_3.Post)('qr'),
    __param(0, (0, common_3.Body)()),
    __param(1, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, Object]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "diemDanhQR", null);
__decorate([
    (0, common_3.Get)('buoi/:buoiId'),
    __param(0, (0, common_3.Param)('buoiId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "getDiemDanhBuoi", null);
__decorate([
    (0, common_3.Get)('thong-ke-vang/:lopId'),
    __param(0, (0, common_3.Param)('lopId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "getThongKeVang", null);
__decorate([
    (0, common_3.Get)('lich-su-vang'),
    __param(0, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "getLichSuVang", null);
__decorate([
    (0, common_3.Post)('ghi-vang'),
    __param(0, (0, common_3.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "ghiVang", null);
exports.DiemDanhController = DiemDanhController = __decorate([
    (0, common_3.Controller)('diem-danh'),
    (0, common_3.UseGuards)(jwt_guard_1.JwtAuthGuard),
    __metadata("design:paramtypes", [DiemDanhService])
], DiemDanhController);
let DiemDanhModule = class DiemDanhModule {
};
exports.DiemDanhModule = DiemDanhModule;
exports.DiemDanhModule = DiemDanhModule = __decorate([
    (0, common_1.Module)({ imports: [typeorm_1.TypeOrmModule.forFeature([entities_1.DiemDanh, entities_1.PhienDiemDanh])], controllers: [DiemDanhController], providers: [DiemDanhService] })
], DiemDanhModule);
//# sourceMappingURL=diem-danh.module.js.map