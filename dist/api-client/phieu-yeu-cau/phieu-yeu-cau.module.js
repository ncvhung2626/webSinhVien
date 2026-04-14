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
exports.PhieuYeuCauModule = exports.PhieuYeuCauController = exports.PhieuYeuCauService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("@nestjs/common");
const typeorm_2 = require("@nestjs/typeorm");
const typeorm_3 = require("typeorm");
const common_3 = require("@nestjs/common");
const entities_1 = require("../entities");
const jwt_guard_1 = require("../auth/jwt.guard");
let PhieuYeuCauService = class PhieuYeuCauService {
    constructor(repo) {
        this.repo = repo;
    }
    async tao(svId, loai, nd) { return this.repo.save(this.repo.create({ sinh_vien_id: svId, loai_yeu_cau: loai, noi_dung: nd })); }
    async getCuaSV(id) { return this.repo.find({ where: { sinh_vien_id: id }, order: { ngay_tao: 'DESC' } }); }
    async getTatCa() { return this.repo.manager.query(`SELECT pyc.*,sv.mssv,sv.ho_ten,sv.lop FROM phieu_yeu_cau pyc JOIN sinh_vien sv ON sv.id=pyc.sinh_vien_id ORDER BY pyc.ngay_tao DESC`); }
    async capNhat(id, tt) { await this.repo.update(id, { trang_thai: tt }); return this.repo.findOne({ where: { id } }); }
};
exports.PhieuYeuCauService = PhieuYeuCauService;
exports.PhieuYeuCauService = PhieuYeuCauService = __decorate([
    (0, common_2.Injectable)(),
    __param(0, (0, typeorm_2.InjectRepository)(entities_1.PhieuYeuCau)),
    __metadata("design:paramtypes", [typeorm_3.Repository])
], PhieuYeuCauService);
let PhieuYeuCauController = class PhieuYeuCauController {
    constructor(service) {
        this.service = service;
    }
    tao(b, req) { return this.service.tao(req.user.profileId, b.loai_yeu_cau, b.noi_dung); }
    getCuaToi(req) { return this.service.getCuaSV(req.user.profileId); }
    getTatCa() { return this.service.getTatCa(); }
    capNhat(id, b) { return this.service.capNhat(id, b.trang_thai); }
};
exports.PhieuYeuCauController = PhieuYeuCauController;
__decorate([
    (0, common_3.Post)(),
    __param(0, (0, common_3.Body)()),
    __param(1, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, Object]),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "tao", null);
__decorate([
    (0, common_3.Get)('cua-toi'),
    __param(0, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "getCuaToi", null);
__decorate([
    (0, common_3.Get)('tat-ca'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "getTatCa", null);
__decorate([
    (0, common_3.Put)(':id/trang-thai'),
    __param(0, (0, common_3.Param)('id')),
    __param(1, (0, common_3.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "capNhat", null);
exports.PhieuYeuCauController = PhieuYeuCauController = __decorate([
    (0, common_3.Controller)('phieu-yeu-cau'),
    (0, common_3.UseGuards)(jwt_guard_1.JwtAuthGuard),
    __metadata("design:paramtypes", [PhieuYeuCauService])
], PhieuYeuCauController);
let PhieuYeuCauModule = class PhieuYeuCauModule {
};
exports.PhieuYeuCauModule = PhieuYeuCauModule;
exports.PhieuYeuCauModule = PhieuYeuCauModule = __decorate([
    (0, common_1.Module)({ imports: [typeorm_1.TypeOrmModule.forFeature([entities_1.PhieuYeuCau])], controllers: [PhieuYeuCauController], providers: [PhieuYeuCauService] })
], PhieuYeuCauModule);
//# sourceMappingURL=phieu-yeu-cau.module.js.map