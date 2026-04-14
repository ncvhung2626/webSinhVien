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
exports.AdminSuKienController = void 0;
const common_1 = require("@nestjs/common");
const su_kien_service_1 = require("./su-kien.service");
let AdminSuKienController = class AdminSuKienController {
    constructor(suKienService) {
        this.suKienService = suKienService;
    }
    async layDanhSachAdminSuKien(page = '1', limit = '10', search = '') {
        return this.suKienService.layDanhSachAdminSuKien(page, limit, search);
    }
    async layDanhSachDangKy(id, trangThai = '') {
        return this.suKienService.layDanhSachDangKy(id, trangThai);
    }
    async themAdminSuKien(body) {
        return this.suKienService.themAdminSuKien(body);
    }
    async suaAdminSuKien(id, body) {
        return this.suKienService.suaAdminSuKien(id, body);
    }
    async xoaAdminSuKien(id) {
        return this.suKienService.xoaAdminSuKien(id);
    }
    async capNhatTrangThaiDangKy(id, body) {
        return this.suKienService.capNhatTrangThaiDangKy(id, body);
    }
};
exports.AdminSuKienController = AdminSuKienController;
__decorate([
    (0, common_1.Get)('su-kien'),
    __param(0, (0, common_1.Query)('page')),
    __param(1, (0, common_1.Query)('limit')),
    __param(2, (0, common_1.Query)('search')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String, String]),
    __metadata("design:returntype", Promise)
], AdminSuKienController.prototype, "layDanhSachAdminSuKien", null);
__decorate([
    (0, common_1.Get)('su-kien/:id/dang-ky'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Query)('trang_thai')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String]),
    __metadata("design:returntype", Promise)
], AdminSuKienController.prototype, "layDanhSachDangKy", null);
__decorate([
    (0, common_1.Post)('su-kien'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], AdminSuKienController.prototype, "themAdminSuKien", null);
__decorate([
    (0, common_1.Put)('su-kien/:id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], AdminSuKienController.prototype, "suaAdminSuKien", null);
__decorate([
    (0, common_1.Delete)('su-kien/:id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], AdminSuKienController.prototype, "xoaAdminSuKien", null);
__decorate([
    (0, common_1.Put)('dang-ky-su-kien/:id/trang-thai'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], AdminSuKienController.prototype, "capNhatTrangThaiDangKy", null);
exports.AdminSuKienController = AdminSuKienController = __decorate([
    (0, common_1.Controller)('api/admin'),
    __metadata("design:paramtypes", [su_kien_service_1.AdminSuKienService])
], AdminSuKienController);
//# sourceMappingURL=su-kien.controller.js.map