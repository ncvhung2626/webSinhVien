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
exports.DiemRenLuyenModule = exports.DiemRenLuyenController = exports.DiemRenLuyenService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("@nestjs/common");
const typeorm_2 = require("@nestjs/typeorm");
const typeorm_3 = require("typeorm");
const common_3 = require("@nestjs/common");
const entities_1 = require("../entities");
const jwt_guard_1 = require("../auth/jwt.guard");
let DiemRenLuyenService = class DiemRenLuyenService {
    constructor(repo) {
        this.repo = repo;
    }
    async getDiemCaNhan(id) { return this.repo.find({ where: { sinh_vien_id: id }, order: { hoc_ky: 'DESC' } }); }
    async getDiemTheoLop(lopId) { return this.repo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,drl.tong_diem,drl.xep_loai,drl.hoc_ky FROM diem_ren_luyen drl JOIN sinh_vien sv ON sv.id=drl.sinh_vien_id WHERE sv.id IN(SELECT sinh_vien_id FROM dang_ky_hoc WHERE lop_hoc_phan_id=$1) ORDER BY drl.hoc_ky DESC,sv.ho_ten`, [lopId]); }
    async getDiemTatCa() { return this.repo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,drl.tong_diem,drl.xep_loai,drl.hoc_ky FROM diem_ren_luyen drl JOIN sinh_vien sv ON sv.id=drl.sinh_vien_id ORDER BY drl.hoc_ky DESC,sv.ho_ten`); }
};
exports.DiemRenLuyenService = DiemRenLuyenService;
exports.DiemRenLuyenService = DiemRenLuyenService = __decorate([
    (0, common_2.Injectable)(),
    __param(0, (0, typeorm_2.InjectRepository)(entities_1.DiemRenLuyen)),
    __metadata("design:paramtypes", [typeorm_3.Repository])
], DiemRenLuyenService);
let DiemRenLuyenController = class DiemRenLuyenController {
    constructor(service) {
        this.service = service;
    }
    getCaNhan(req) { return this.service.getDiemCaNhan(req.user.profileId); }
    getTheoLop(lopId) { return this.service.getDiemTheoLop(lopId); }
    getTatCa() { return this.service.getDiemTatCa(); }
};
exports.DiemRenLuyenController = DiemRenLuyenController;
__decorate([
    (0, common_3.Get)('ca-nhan'),
    __param(0, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], DiemRenLuyenController.prototype, "getCaNhan", null);
__decorate([
    (0, common_3.Get)('theo-lop/:lopId'),
    __param(0, (0, common_3.Param)('lopId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DiemRenLuyenController.prototype, "getTheoLop", null);
__decorate([
    (0, common_3.Get)('tat-ca'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], DiemRenLuyenController.prototype, "getTatCa", null);
exports.DiemRenLuyenController = DiemRenLuyenController = __decorate([
    (0, common_3.Controller)('diem-ren-luyen'),
    (0, common_3.UseGuards)(jwt_guard_1.JwtAuthGuard),
    __metadata("design:paramtypes", [DiemRenLuyenService])
], DiemRenLuyenController);
let DiemRenLuyenModule = class DiemRenLuyenModule {
};
exports.DiemRenLuyenModule = DiemRenLuyenModule;
exports.DiemRenLuyenModule = DiemRenLuyenModule = __decorate([
    (0, common_1.Module)({ imports: [typeorm_1.TypeOrmModule.forFeature([entities_1.DiemRenLuyen])], controllers: [DiemRenLuyenController], providers: [DiemRenLuyenService] })
], DiemRenLuyenModule);
//# sourceMappingURL=diem-ren-luyen.module.js.map