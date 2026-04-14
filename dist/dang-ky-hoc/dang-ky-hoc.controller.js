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
exports.DangKyHocController = void 0;
const common_1 = require("@nestjs/common");
const dang_ky_hoc_service_1 = require("./dang-ky-hoc.service");
const dang_ky_hoc_dto_1 = require("./dto/dang-ky-hoc.dto");
let DangKyHocController = class DangKyHocController {
    constructor(dangKyHocService) {
        this.dangKyHocService = dangKyHocService;
    }
    findBySinhVien(svId) {
        return this.dangKyHocService.findBySinhVien(svId);
    }
    findByLop(lopId) {
        return this.dangKyHocService.findByLopHocPhan(lopId);
    }
    dangKy(dto) {
        return this.dangKyHocService.dangKyNhieu(dto);
    }
    capNhatThanhToan(body) {
        return this.dangKyHocService.capNhatThanhToan(body.sinhVienId, body.lopHocPhanIds);
    }
    huyDangKy(id) {
        return this.dangKyHocService.huyDangKy(id);
    }
};
exports.DangKyHocController = DangKyHocController;
__decorate([
    (0, common_1.Get)('sinh-vien/:svId'),
    __param(0, (0, common_1.Param)('svId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DangKyHocController.prototype, "findBySinhVien", null);
__decorate([
    (0, common_1.Get)('lop/:lopId'),
    __param(0, (0, common_1.Param)('lopId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DangKyHocController.prototype, "findByLop", null);
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [dang_ky_hoc_dto_1.DangKyHocDto]),
    __metadata("design:returntype", void 0)
], DangKyHocController.prototype, "dangKy", null);
__decorate([
    (0, common_1.Put)('thanh-toan'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], DangKyHocController.prototype, "capNhatThanhToan", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DangKyHocController.prototype, "huyDangKy", null);
exports.DangKyHocController = DangKyHocController = __decorate([
    (0, common_1.Controller)('api/dang-ky-hoc'),
    __metadata("design:paramtypes", [dang_ky_hoc_service_1.DangKyHocService])
], DangKyHocController);
//# sourceMappingURL=dang-ky-hoc.controller.js.map