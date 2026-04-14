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
exports.PhieuYeuCau = void 0;
const typeorm_1 = require("typeorm");
const sinh_vien_entity_1 = require("../../sinh-vien/entities/sinh-vien.entity");
let PhieuYeuCau = class PhieuYeuCau {
};
exports.PhieuYeuCau = PhieuYeuCau;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], PhieuYeuCau.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => sinh_vien_entity_1.SinhVien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'sinh_vien_id' }),
    __metadata("design:type", sinh_vien_entity_1.SinhVien)
], PhieuYeuCau.prototype, "sinhVien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'sinh_vien_id' }),
    __metadata("design:type", Number)
], PhieuYeuCau.prototype, "sinhVienId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'loai_yeu_cau', length: 50 }),
    __metadata("design:type", String)
], PhieuYeuCau.prototype, "loaiYeuCau", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'tieu_de', length: 200 }),
    __metadata("design:type", String)
], PhieuYeuCau.prototype, "tieuDe", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'noi_dung', type: 'text' }),
    __metadata("design:type", String)
], PhieuYeuCau.prototype, "noiDung", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'trang_thai', length: 20, default: 'cho_xu_ly' }),
    __metadata("design:type", String)
], PhieuYeuCau.prototype, "trangThai", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'phan_hoi', type: 'text', nullable: true }),
    __metadata("design:type", String)
], PhieuYeuCau.prototype, "phanHoi", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'nguoi_xu_ly', length: 100, nullable: true }),
    __metadata("design:type", String)
], PhieuYeuCau.prototype, "nguoiXuLy", void 0);
__decorate([
    (0, typeorm_1.CreateDateColumn)({ name: 'ngay_gui' }),
    __metadata("design:type", Date)
], PhieuYeuCau.prototype, "ngayGui", void 0);
__decorate([
    (0, typeorm_1.UpdateDateColumn)({ name: 'ngay_cap_nhat' }),
    __metadata("design:type", Date)
], PhieuYeuCau.prototype, "ngayCapNhat", void 0);
exports.PhieuYeuCau = PhieuYeuCau = __decorate([
    (0, typeorm_1.Entity)('phieu_yeu_cau')
], PhieuYeuCau);
//# sourceMappingURL=phieu-yeu-cau.entity.js.map