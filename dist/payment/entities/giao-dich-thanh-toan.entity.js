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
exports.GiaoDichThanhToan = void 0;
const typeorm_1 = require("typeorm");
const sinh_vien_entity_1 = require("../../sinh-vien/entities/sinh-vien.entity");
const chi_tiet_thanh_toan_entity_1 = require("./chi-tiet-thanh-toan.entity");
let GiaoDichThanhToan = class GiaoDichThanhToan {
};
exports.GiaoDichThanhToan = GiaoDichThanhToan;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], GiaoDichThanhToan.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => sinh_vien_entity_1.SinhVien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'sinh_vien_id' }),
    __metadata("design:type", sinh_vien_entity_1.SinhVien)
], GiaoDichThanhToan.prototype, "sinhVien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'sinh_vien_id', nullable: true }),
    __metadata("design:type", Number)
], GiaoDichThanhToan.prototype, "sinhVienId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ma_giao_dich', length: 100, unique: true }),
    __metadata("design:type", String)
], GiaoDichThanhToan.prototype, "maGiaoDich", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ma_giao_dich_vnpay', length: 100, nullable: true }),
    __metadata("design:type", String)
], GiaoDichThanhToan.prototype, "maGiaoDichVnpay", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'so_tien', type: 'bigint' }),
    __metadata("design:type", Number)
], GiaoDichThanhToan.prototype, "soTien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'noi_dung', type: 'text', nullable: true }),
    __metadata("design:type", String)
], GiaoDichThanhToan.prototype, "noiDung", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'trang_thai', length: 20, default: 'cho_thanh_toan' }),
    __metadata("design:type", String)
], GiaoDichThanhToan.prototype, "trangThai", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ma_phan_hoi', length: 10, nullable: true }),
    __metadata("design:type", String)
], GiaoDichThanhToan.prototype, "maPhanHoi", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ma_ngan_hang', length: 20, nullable: true }),
    __metadata("design:type", String)
], GiaoDichThanhToan.prototype, "maNganHang", void 0);
__decorate([
    (0, typeorm_1.CreateDateColumn)({ name: 'thoi_gian_tao' }),
    __metadata("design:type", Date)
], GiaoDichThanhToan.prototype, "thoiGianTao", void 0);
__decorate([
    (0, typeorm_1.UpdateDateColumn)({ name: 'thoi_gian_cap_nhat' }),
    __metadata("design:type", Date)
], GiaoDichThanhToan.prototype, "thoiGianCapNhat", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => chi_tiet_thanh_toan_entity_1.ChiTietThanhToan, ct => ct.giaoDich, { cascade: true, eager: false }),
    __metadata("design:type", Array)
], GiaoDichThanhToan.prototype, "chiTiet", void 0);
exports.GiaoDichThanhToan = GiaoDichThanhToan = __decorate([
    (0, typeorm_1.Entity)('giao_dich_thanh_toan')
], GiaoDichThanhToan);
//# sourceMappingURL=giao-dich-thanh-toan.entity.js.map