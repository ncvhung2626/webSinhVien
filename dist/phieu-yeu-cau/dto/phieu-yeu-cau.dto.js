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
Object.defineProperty(exports, "__esModule", { value: true });
exports.XuLyPhieuDto = exports.TaoPhieuDto = void 0;
const class_validator_1 = require("class-validator");
class TaoPhieuDto {
}
exports.TaoPhieuDto = TaoPhieuDto;
__decorate([
    (0, class_validator_1.IsInt)(),
    __metadata("design:type", Number)
], TaoPhieuDto.prototype, "sinhVienId", void 0);
__decorate([
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.Length)(1, 50),
    __metadata("design:type", String)
], TaoPhieuDto.prototype, "loaiYeuCau", void 0);
__decorate([
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.Length)(1, 200),
    __metadata("design:type", String)
], TaoPhieuDto.prototype, "tieuDe", void 0);
__decorate([
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], TaoPhieuDto.prototype, "noiDung", void 0);
class XuLyPhieuDto {
}
exports.XuLyPhieuDto = XuLyPhieuDto;
__decorate([
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], XuLyPhieuDto.prototype, "trangThai", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], XuLyPhieuDto.prototype, "phanHoi", void 0);
__decorate([
    (0, class_validator_1.IsOptional)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], XuLyPhieuDto.prototype, "nguoiXuLy", void 0);
//# sourceMappingURL=phieu-yeu-cau.dto.js.map