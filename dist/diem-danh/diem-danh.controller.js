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
exports.DiemDanhController = void 0;
const common_1 = require("@nestjs/common");
const diem_danh_service_1 = require("./diem-danh.service");
const diem_danh_dto_1 = require("./dto/diem-danh.dto");
let DiemDanhController = class DiemDanhController {
    constructor(diemDanhService) {
        this.diemDanhService = diemDanhService;
    }
    taoPhien(dto) {
        return this.diemDanhService.taoPhien(dto);
    }
    dongPhien(id) {
        return this.diemDanhService.dongPhien(id);
    }
    quetQr(dto) {
        return this.diemDanhService.quetQr(dto);
    }
    findBySinhVien(svId) {
        return this.diemDanhService.findBySinhVien(svId);
    }
    findByBuoiHoc(buoiId) {
        return this.diemDanhService.findByBuoiHoc(buoiId);
    }
    suaTrangThai(id, trangThai) {
        return this.diemDanhService.suaTrangThai(id, trangThai);
    }
};
exports.DiemDanhController = DiemDanhController;
__decorate([
    (0, common_1.Post)('phien'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [diem_danh_dto_1.TaoPhienDto]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "taoPhien", null);
__decorate([
    (0, common_1.Put)('phien/:id/dong'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "dongPhien", null);
__decorate([
    (0, common_1.Post)('quet-qr'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [diem_danh_dto_1.QuetQrDto]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "quetQr", null);
__decorate([
    (0, common_1.Get)('sinh-vien/:svId'),
    __param(0, (0, common_1.Param)('svId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "findBySinhVien", null);
__decorate([
    (0, common_1.Get)('buoi/:buoiId'),
    __param(0, (0, common_1.Param)('buoiId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "findByBuoiHoc", null);
__decorate([
    (0, common_1.Put)(':id/trang-thai'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __param(1, (0, common_1.Body)('trangThai')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, String]),
    __metadata("design:returntype", void 0)
], DiemDanhController.prototype, "suaTrangThai", null);
exports.DiemDanhController = DiemDanhController = __decorate([
    (0, common_1.Controller)('api/diem-danh'),
    __metadata("design:paramtypes", [diem_danh_service_1.DiemDanhService])
], DiemDanhController);
//# sourceMappingURL=diem-danh.controller.js.map