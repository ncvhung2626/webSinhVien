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
exports.AdminLopHocPhanController = void 0;
const common_1 = require("@nestjs/common");
const lop_hoc_phan_service_1 = require("./lop-hoc-phan.service");
let AdminLopHocPhanController = class AdminLopHocPhanController {
    constructor(lopHocPhanService) {
        this.lopHocPhanService = lopHocPhanService;
    }
    async layDanhSachAdminLopHocPhan(page = '1', limit = '10', search = '') {
        return this.lopHocPhanService.layDanhSachAdminLopHocPhan(page, limit, search);
    }
    async themAdminLopHocPhan(body) {
        return this.lopHocPhanService.themAdminLopHocPhan(body);
    }
    async xoaAdminLopHocPhan(id) {
        return this.lopHocPhanService.xoaAdminLopHocPhan(id);
    }
    async suaAdminLopHocPhan(id, body) {
        return this.lopHocPhanService.suaAdminLopHocPhan(id, body);
    }
    async layDanhSachChoDropdown() {
        return this.lopHocPhanService.layDanhSachChoDropdown();
    }
};
exports.AdminLopHocPhanController = AdminLopHocPhanController;
__decorate([
    (0, common_1.Get)('lop-hoc-phan'),
    __param(0, (0, common_1.Query)('page')),
    __param(1, (0, common_1.Query)('limit')),
    __param(2, (0, common_1.Query)('search')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String, String]),
    __metadata("design:returntype", Promise)
], AdminLopHocPhanController.prototype, "layDanhSachAdminLopHocPhan", null);
__decorate([
    (0, common_1.Post)('lop-hoc-phan'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], AdminLopHocPhanController.prototype, "themAdminLopHocPhan", null);
__decorate([
    (0, common_1.Delete)('lop-hoc-phan/:id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], AdminLopHocPhanController.prototype, "xoaAdminLopHocPhan", null);
__decorate([
    (0, common_1.Put)('lop-hoc-phan/:id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], AdminLopHocPhanController.prototype, "suaAdminLopHocPhan", null);
__decorate([
    (0, common_1.Get)('danh-sach-chon'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], AdminLopHocPhanController.prototype, "layDanhSachChoDropdown", null);
exports.AdminLopHocPhanController = AdminLopHocPhanController = __decorate([
    (0, common_1.Controller)('api/admin'),
    __metadata("design:paramtypes", [lop_hoc_phan_service_1.AdminLopHocPhanService])
], AdminLopHocPhanController);
//# sourceMappingURL=lop-hoc-phan.controller.js.map