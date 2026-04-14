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
exports.DiemDanh = void 0;
const typeorm_1 = require("typeorm");
const sinh_vien_entity_1 = require("../../sinh-vien/entities/sinh-vien.entity");
let DiemDanh = class DiemDanh {
};
exports.DiemDanh = DiemDanh;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], DiemDanh.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'buoi_hoc_id', nullable: true }),
    __metadata("design:type", Number)
], DiemDanh.prototype, "buoiHocId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => sinh_vien_entity_1.SinhVien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'sinh_vien_id' }),
    __metadata("design:type", sinh_vien_entity_1.SinhVien)
], DiemDanh.prototype, "sinhVien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'sinh_vien_id' }),
    __metadata("design:type", Number)
], DiemDanh.prototype, "sinhVienId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'trang_thai', length: 20, default: 'co_mat' }),
    __metadata("design:type", String)
], DiemDanh.prototype, "trangThai", void 0);
__decorate([
    (0, typeorm_1.CreateDateColumn)({ name: 'thoi_gian' }),
    __metadata("design:type", Date)
], DiemDanh.prototype, "thoiGian", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'hinh_thuc', length: 20, default: 'qr_code' }),
    __metadata("design:type", String)
], DiemDanh.prototype, "hinhThuc", void 0);
exports.DiemDanh = DiemDanh = __decorate([
    (0, typeorm_1.Entity)('diem_danh')
], DiemDanh);
//# sourceMappingURL=diem-danh.entity.js.map