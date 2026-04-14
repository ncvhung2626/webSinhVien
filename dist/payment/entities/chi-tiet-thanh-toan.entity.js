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
exports.ChiTietThanhToan = void 0;
const typeorm_1 = require("typeorm");
const giao_dich_thanh_toan_entity_1 = require("./giao-dich-thanh-toan.entity");
const lop_hoc_phan_entity_1 = require("../../lop-hoc-phan/entities/lop-hoc-phan.entity");
const dang_ky_hoc_entity_1 = require("../../dang-ky-hoc/entities/dang-ky-hoc.entity");
let ChiTietThanhToan = class ChiTietThanhToan {
};
exports.ChiTietThanhToan = ChiTietThanhToan;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], ChiTietThanhToan.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => giao_dich_thanh_toan_entity_1.GiaoDichThanhToan, gd => gd.chiTiet, { onDelete: 'CASCADE' }),
    (0, typeorm_1.JoinColumn)({ name: 'giao_dich_id' }),
    __metadata("design:type", giao_dich_thanh_toan_entity_1.GiaoDichThanhToan)
], ChiTietThanhToan.prototype, "giaoDich", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'giao_dich_id' }),
    __metadata("design:type", Number)
], ChiTietThanhToan.prototype, "giaoDichId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => dang_ky_hoc_entity_1.DangKyHoc, { eager: true, nullable: true }),
    (0, typeorm_1.JoinColumn)({ name: 'dang_ky_hoc_id' }),
    __metadata("design:type", dang_ky_hoc_entity_1.DangKyHoc)
], ChiTietThanhToan.prototype, "dangKyHoc", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'dang_ky_hoc_id', nullable: true }),
    __metadata("design:type", Number)
], ChiTietThanhToan.prototype, "dangKyHocId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => lop_hoc_phan_entity_1.LopHocPhan, { eager: true, nullable: true }),
    (0, typeorm_1.JoinColumn)({ name: 'lop_hoc_phan_id' }),
    __metadata("design:type", lop_hoc_phan_entity_1.LopHocPhan)
], ChiTietThanhToan.prototype, "lopHocPhan", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'lop_hoc_phan_id', nullable: true }),
    __metadata("design:type", Number)
], ChiTietThanhToan.prototype, "lopHocPhanId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'so_tin_chi', nullable: true }),
    __metadata("design:type", Number)
], ChiTietThanhToan.prototype, "soTinChi", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'don_gia_tin_chi', default: 450000 }),
    __metadata("design:type", Number)
], ChiTietThanhToan.prototype, "donGiaTinChi", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'thanh_tien', type: 'bigint', nullable: true }),
    __metadata("design:type", Number)
], ChiTietThanhToan.prototype, "thanhTien", void 0);
exports.ChiTietThanhToan = ChiTietThanhToan = __decorate([
    (0, typeorm_1.Entity)('chi_tiet_thanh_toan')
], ChiTietThanhToan);
//# sourceMappingURL=chi-tiet-thanh-toan.entity.js.map