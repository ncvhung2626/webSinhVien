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
exports.GiangVienModule = exports.GiangVienController = exports.GiangVienService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("@nestjs/common");
const typeorm_2 = require("@nestjs/typeorm");
const typeorm_3 = require("typeorm");
const common_3 = require("@nestjs/common");
const entities_1 = require("../entities");
const jwt_guard_1 = require("../auth/jwt.guard");
let GiangVienService = class GiangVienService {
    constructor(repo) {
        this.repo = repo;
    }
    async getThongTin(id) { return this.repo.findOne({ where: { id } }); }
    async getDanhSachTatCa() { return this.repo.manager.query(`SELECT gv.id,gv.ho_ten,gv.bo_mon,nd.email FROM giang_vien gv JOIN nguoi_dung nd ON nd.id=gv.nguoi_dung_id ORDER BY gv.ho_ten`); }
};
exports.GiangVienService = GiangVienService;
exports.GiangVienService = GiangVienService = __decorate([
    (0, common_2.Injectable)(),
    __param(0, (0, typeorm_2.InjectRepository)(entities_1.GiangVien)),
    __metadata("design:paramtypes", [typeorm_3.Repository])
], GiangVienService);
let GiangVienController = class GiangVienController {
    constructor(service) {
        this.service = service;
    }
    getCaNhan(req) { return this.service.getThongTin(req.user.profileId); }
    getTatCa() { return this.service.getDanhSachTatCa(); }
};
exports.GiangVienController = GiangVienController;
__decorate([
    (0, common_3.Get)('ca-nhan'),
    __param(0, (0, common_3.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], GiangVienController.prototype, "getCaNhan", null);
__decorate([
    (0, common_3.Get)('tat-ca'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], GiangVienController.prototype, "getTatCa", null);
exports.GiangVienController = GiangVienController = __decorate([
    (0, common_3.Controller)('giang-vien'),
    (0, common_3.UseGuards)(jwt_guard_1.JwtAuthGuard),
    __metadata("design:paramtypes", [GiangVienService])
], GiangVienController);
let GiangVienModule = class GiangVienModule {
};
exports.GiangVienModule = GiangVienModule;
exports.GiangVienModule = GiangVienModule = __decorate([
    (0, common_1.Module)({ imports: [typeorm_1.TypeOrmModule.forFeature([entities_1.GiangVien])], controllers: [GiangVienController], providers: [GiangVienService], exports: [GiangVienService] })
], GiangVienModule);
//# sourceMappingURL=giang-vien.module.js.map