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
exports.SinhVienModule = exports.SinhVienController = exports.SinhVienService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("@nestjs/common");
const typeorm_2 = require("@nestjs/typeorm");
const typeorm_3 = require("typeorm");
const common_3 = require("@nestjs/common");
const entities_1 = require("../entities");
const jwt_guard_1 = require("../auth/jwt.guard");
let SinhVienService = class SinhVienService {
    constructor(repo) {
        this.repo = repo;
    }
    async getThongTinCaNhan(id) { return this.repo.findOne({ where: { id } }); }
    async getDanhSachTheoLop(lopId) {
        return this.repo.manager.query(`SELECT sv.id,sv.mssv,sv.ho_ten,sv.lop,sv.ma_qr,nd.email FROM dang_ky_hoc dkh JOIN sinh_vien sv ON sv.id=dkh.sinh_vien_id JOIN nguoi_dung nd ON nd.id=sv.nguoi_dung_id WHERE dkh.lop_hoc_phan_id=$1 ORDER BY sv.ho_ten`, [lopId]);
    }
    async getDanhSachTatCa() {
        return this.repo.manager.query(`SELECT sv.id,sv.mssv,sv.ho_ten,sv.lop,sv.ma_qr,nd.email FROM sinh_vien sv JOIN nguoi_dung nd ON nd.id=sv.nguoi_dung_id ORDER BY sv.ho_ten`);
    }
};
exports.SinhVienService = SinhVienService;
exports.SinhVienService = SinhVienService = __decorate([
    (0, common_2.Injectable)(),
    __param(0, (0, typeorm_2.InjectRepository)(entities_1.SinhVien)),
    __metadata("design:paramtypes", [typeorm_3.Repository])
], SinhVienService);
let SinhVienController = class SinhVienController {
    constructor(service) {
        this.service = service;
    }
    getCaNhan(req) { return this.service.getThongTinCaNhan(req.user.profileId); }
    getDanhSach(lopId) { return this.service.getDanhSachTheoLop(lopId); }
    getTatCa() { return this.service.getDanhSachTatCa(); }
};
exports.SinhVienController = SinhVienController;
__decorate([
    (0, common_3.Get)('ca-nhan'),
    __param(0, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], SinhVienController.prototype, "getCaNhan", null);
__decorate([
    (0, common_3.Get)('lop/:lopId'),
    __param(0, (0, common_3.Param)('lopId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], SinhVienController.prototype, "getDanhSach", null);
__decorate([
    (0, common_3.Get)('tat-ca'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], SinhVienController.prototype, "getTatCa", null);
exports.SinhVienController = SinhVienController = __decorate([
    (0, common_3.Controller)('sinh-vien'),
    (0, common_3.UseGuards)(jwt_guard_1.JwtAuthGuard),
    __metadata("design:paramtypes", [SinhVienService])
], SinhVienController);
let SinhVienModule = class SinhVienModule {
};
exports.SinhVienModule = SinhVienModule;
exports.SinhVienModule = SinhVienModule = __decorate([
    (0, common_1.Module)({ imports: [typeorm_1.TypeOrmModule.forFeature([entities_1.SinhVien])], controllers: [SinhVienController], providers: [SinhVienService], exports: [SinhVienService] })
], SinhVienModule);
//# sourceMappingURL=sinh-vien.module.js.map