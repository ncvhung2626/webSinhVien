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
exports.BaiTapModule = exports.BaiTapController = exports.BaiTapService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("@nestjs/common");
const typeorm_2 = require("@nestjs/typeorm");
const typeorm_3 = require("typeorm");
const common_3 = require("@nestjs/common");
const entities_1 = require("../entities");
const jwt_guard_1 = require("../auth/jwt.guard");
const nodemailer = require("nodemailer");
let BaiTapService = class BaiTapService {
    constructor(btRepo, nbRepo) {
        this.btRepo = btRepo;
        this.nbRepo = nbRepo;
    }
    async taoBaiTap(dto) { return this.btRepo.save(this.btRepo.create(dto)); }
    async getBaiTapTheoLop(lopId) { return this.btRepo.find({ where: { lop_hoc_phan_id: lopId }, order: { han_nop: 'ASC' } }); }
    async getBaiTapSinhVien(svId, lopId) {
        return this.btRepo.manager.query(`SELECT bt.id,bt.ten_bai_tap,bt.mo_ta,bt.han_nop,bt.ngay_tao,nb.id as nop_bai_id,nb.ngay_nop,nb.trang_thai as trang_thai_nop,CASE WHEN nb.id IS NOT NULL THEN true ELSE false END as da_nop FROM bai_tap bt LEFT JOIN nop_bai nb ON nb.bai_tap_id=bt.id AND nb.sinh_vien_id=$1 WHERE bt.lop_hoc_phan_id=$2 ORDER BY bt.han_nop`, [svId, lopId]);
    }
    async nopBai(svId, btId) {
        const bt = await this.btRepo.findOne({ where: { id: btId } });
        if (!bt)
            throw new common_2.BadRequestException('Bai tap khong ton tai');
        const ex = await this.nbRepo.findOne({ where: { bai_tap_id: btId, sinh_vien_id: svId } });
        if (ex)
            throw new common_2.BadRequestException('Ban da nop bai nay roi');
        const saved = await this.nbRepo.save(this.nbRepo.create({ bai_tap_id: btId, sinh_vien_id: svId, ngay_nop: new Date(), trang_thai: 'da_nop' }));
        this.guiEmail(svId, btId).catch(e => console.log('Email error:', e.message));
        return saved;
    }
    async getDanhSachNopBai(btId) {
        return this.nbRepo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,nb.ngay_nop,nb.trang_thai,bt.ten_bai_tap,bt.han_nop,CASE WHEN nb.ngay_nop<=bt.han_nop THEN 'dung_han' ELSE 'tre_han' END as ket_qua FROM nop_bai nb JOIN sinh_vien sv ON sv.id=nb.sinh_vien_id JOIN bai_tap bt ON bt.id=nb.bai_tap_id WHERE nb.bai_tap_id=$1 ORDER BY nb.ngay_nop DESC`, [btId]);
    }
    async guiEmail(svId, btId) {
        if (!process.env.MAIL_USER || !process.env.MAIL_PASS)
            return;
        const d = await this.nbRepo.manager.query(`SELECT sv.ho_ten,nd.email,bt.ten_bai_tap,bt.han_nop,hp.ten_hoc_phan FROM sinh_vien sv JOIN nguoi_dung nd ON nd.id=sv.nguoi_dung_id JOIN bai_tap bt ON bt.id=$2 JOIN lop_hoc_phan lhp ON lhp.id=bt.lop_hoc_phan_id JOIN hoc_phan hp ON hp.id=lhp.hoc_phan_id WHERE sv.id=$1`, [svId, btId]);
        if (!d.length || !d[0].email)
            return;
        const t = nodemailer.createTransport({ service: 'gmail', auth: { user: process.env.MAIL_USER, pass: process.env.MAIL_PASS } });
        await t.sendMail({ from: `"QLSV" <${process.env.MAIL_USER}>`, to: d[0].email, subject: `Nop bai thanh cong - ${d[0].ten_bai_tap}`, html: `<p>Xin chao ${d[0].ho_ten}, ban da nop bai <b>${d[0].ten_bai_tap}</b> thanh cong!</p>` });
    }
};
exports.BaiTapService = BaiTapService;
exports.BaiTapService = BaiTapService = __decorate([
    (0, common_2.Injectable)(),
    __param(0, (0, typeorm_2.InjectRepository)(entities_1.BaiTap)),
    __param(1, (0, typeorm_2.InjectRepository)(entities_1.NopBai)),
    __metadata("design:paramtypes", [typeorm_3.Repository, typeorm_3.Repository])
], BaiTapService);
let BaiTapController = class BaiTapController {
    constructor(service) {
        this.service = service;
    }
    taoBaiTap(b, req) { return this.service.taoBaiTap({ ...b, giang_vien_id: req.user.profileId }); }
    getBaiTapLop(lopId) { return this.service.getBaiTapTheoLop(lopId); }
    getBaiTapSV(lopId, req) { return this.service.getBaiTapSinhVien(req.user.profileId, lopId); }
    nopBai(id, req) { return this.service.nopBai(req.user.profileId, id); }
    getDSNop(id) { return this.service.getDanhSachNopBai(id); }
};
exports.BaiTapController = BaiTapController;
__decorate([
    (0, common_3.Post)(),
    __param(0, (0, common_3.Body)()),
    __param(1, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, Object]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "taoBaiTap", null);
__decorate([
    (0, common_3.Get)('lop/:lopId'),
    __param(0, (0, common_3.Param)('lopId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "getBaiTapLop", null);
__decorate([
    (0, common_3.Get)('sinh-vien/:lopId'),
    __param(0, (0, common_3.Param)('lopId')),
    __param(1, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "getBaiTapSV", null);
__decorate([
    (0, common_3.Post)(':id/nop'),
    __param(0, (0, common_3.Param)('id')),
    __param(1, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "nopBai", null);
__decorate([
    (0, common_3.Get)(':id/danh-sach-nop'),
    __param(0, (0, common_3.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "getDSNop", null);
exports.BaiTapController = BaiTapController = __decorate([
    (0, common_3.Controller)('bai-tap'),
    (0, common_3.UseGuards)(jwt_guard_1.JwtAuthGuard),
    __metadata("design:paramtypes", [BaiTapService])
], BaiTapController);
let BaiTapModule = class BaiTapModule {
};
exports.BaiTapModule = BaiTapModule;
exports.BaiTapModule = BaiTapModule = __decorate([
    (0, common_1.Module)({ imports: [typeorm_1.TypeOrmModule.forFeature([entities_1.BaiTap, entities_1.NopBai])], controllers: [BaiTapController], providers: [BaiTapService] })
], BaiTapModule);
//# sourceMappingURL=bai-tap.module.js.map