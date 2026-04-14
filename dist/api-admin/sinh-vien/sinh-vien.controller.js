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
exports.AdminSinhVienController = void 0;
const common_1 = require("@nestjs/common");
const platform_express_1 = require("@nestjs/platform-express");
const sinh_vien_service_1 = require("./sinh-vien.service");
let AdminSinhVienController = class AdminSinhVienController {
    constructor(sinhVienService) {
        this.sinhVienService = sinhVienService;
    }
    async layDanhSachAdminSinhVien(page = '1', limit = '10', search = '') {
        return this.sinhVienService.layDanhSachAdminSinhVien(page, limit, search);
    }
    async themAdminSinhVien(body) {
        return this.sinhVienService.themAdminSinhVien(body);
    }
    async importAdminSinhVienTuExcel(file) {
        if (!file) {
            return { thanh_cong: false, thong_bao: 'Không tìm thấy file upload!' };
        }
        return this.sinhVienService.importAdminSinhVienTuExcel(file.buffer);
    }
    async xoaAdminSinhVien(id) {
        return this.sinhVienService.xoaAdminSinhVien(id);
    }
    async suaAdminSinhVien(id, body) {
        return this.sinhVienService.suaAdminSinhVien(id, body);
    }
};
exports.AdminSinhVienController = AdminSinhVienController;
__decorate([
    (0, common_1.Get)(),
    __param(0, (0, common_1.Query)('page')),
    __param(1, (0, common_1.Query)('limit')),
    __param(2, (0, common_1.Query)('search')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String, String]),
    __metadata("design:returntype", Promise)
], AdminSinhVienController.prototype, "layDanhSachAdminSinhVien", null);
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], AdminSinhVienController.prototype, "themAdminSinhVien", null);
__decorate([
    (0, common_1.Post)('import'),
    (0, common_1.UseInterceptors)((0, platform_express_1.FileInterceptor)('file')),
    __param(0, (0, common_1.UploadedFile)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], AdminSinhVienController.prototype, "importAdminSinhVienTuExcel", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], AdminSinhVienController.prototype, "xoaAdminSinhVien", null);
__decorate([
    (0, common_1.Put)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], AdminSinhVienController.prototype, "suaAdminSinhVien", null);
exports.AdminSinhVienController = AdminSinhVienController = __decorate([
    (0, common_1.Controller)('api/admin/sinh-vien'),
    __metadata("design:paramtypes", [sinh_vien_service_1.AdminSinhVienService])
], AdminSinhVienController);
//# sourceMappingURL=sinh-vien.controller.js.map