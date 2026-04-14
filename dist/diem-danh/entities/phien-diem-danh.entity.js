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
exports.PhienDiemDanh = void 0;
const typeorm_1 = require("typeorm");
let PhienDiemDanh = class PhienDiemDanh {
};
exports.PhienDiemDanh = PhienDiemDanh;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], PhienDiemDanh.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'lop_hoc_phan_id', nullable: true }),
    __metadata("design:type", Number)
], PhienDiemDanh.prototype, "lopHocPhanId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'buoi_hoc_id', nullable: true }),
    __metadata("design:type", Number)
], PhienDiemDanh.prototype, "buoiHocId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ma_qr_session', length: 100, unique: true }),
    __metadata("design:type", String)
], PhienDiemDanh.prototype, "maQrSession", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'bat_dau', type: 'timestamp', nullable: true }),
    __metadata("design:type", Date)
], PhienDiemDanh.prototype, "batDau", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ket_thuc', type: 'timestamp', nullable: true }),
    __metadata("design:type", Date)
], PhienDiemDanh.prototype, "thoiGianHetHan", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'da_dong', default: false }),
    __metadata("design:type", Boolean)
], PhienDiemDanh.prototype, "daDong", void 0);
exports.PhienDiemDanh = PhienDiemDanh = __decorate([
    (0, typeorm_1.Entity)('phien_diem_danh')
], PhienDiemDanh);
//# sourceMappingURL=phien-diem-danh.entity.js.map