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
exports.SuKienController = void 0;
const common_1 = require("@nestjs/common");
const su_kien_service_1 = require("./su-kien.service");
const su_kien_dto_1 = require("./dto/su-kien.dto");
let SuKienController = class SuKienController {
    constructor(suKienService) {
        this.suKienService = suKienService;
    }
    findAll() {
        return this.suKienService.findAll();
    }
    findBySinhVien(svId) {
        return this.suKienService.findBySinhVien(svId);
    }
    findDanhSachDangKy(id) {
        return this.suKienService.findDanhSachDangKy(id);
    }
    dangKy(dto) {
        return this.suKienService.dangKy(dto);
    }
    huyDangKy(id) {
        return this.suKienService.huyDangKy(id);
    }
    findOne(id) {
        return this.suKienService.findOne(id);
    }
    create(dto) {
        return this.suKienService.create(dto);
    }
    remove(id) {
        return this.suKienService.remove(id);
    }
};
exports.SuKienController = SuKienController;
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], SuKienController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)('sinh-vien/:svId'),
    __param(0, (0, common_1.Param)('svId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], SuKienController.prototype, "findBySinhVien", null);
__decorate([
    (0, common_1.Get)(':id/dang-ky'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], SuKienController.prototype, "findDanhSachDangKy", null);
__decorate([
    (0, common_1.Post)('dang-ky'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [su_kien_dto_1.DangKySuKienDto]),
    __metadata("design:returntype", void 0)
], SuKienController.prototype, "dangKy", null);
__decorate([
    (0, common_1.Delete)('dang-ky/:id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], SuKienController.prototype, "huyDangKy", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], SuKienController.prototype, "findOne", null);
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [su_kien_dto_1.CreateSuKienDto]),
    __metadata("design:returntype", void 0)
], SuKienController.prototype, "create", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], SuKienController.prototype, "remove", null);
exports.SuKienController = SuKienController = __decorate([
    (0, common_1.Controller)('api/su-kien'),
    __metadata("design:paramtypes", [su_kien_service_1.SuKienService])
], SuKienController);
//# sourceMappingURL=su-kien.controller.js.map