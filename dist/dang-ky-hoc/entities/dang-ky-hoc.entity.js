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
exports.DangKyHoc = void 0;
const typeorm_1 = require("typeorm");
const sinh_vien_entity_1 = require("../../sinh-vien/entities/sinh-vien.entity");
const lop_hoc_phan_entity_1 = require("../../lop-hoc-phan/entities/lop-hoc-phan.entity");
let DangKyHoc = class DangKyHoc {
};
exports.DangKyHoc = DangKyHoc;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], DangKyHoc.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => sinh_vien_entity_1.SinhVien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'sinh_vien_id' }),
    __metadata("design:type", sinh_vien_entity_1.SinhVien)
], DangKyHoc.prototype, "sinhVien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'sinh_vien_id' }),
    __metadata("design:type", Number)
], DangKyHoc.prototype, "sinhVienId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => lop_hoc_phan_entity_1.LopHocPhan, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'lop_hoc_phan_id' }),
    __metadata("design:type", lop_hoc_phan_entity_1.LopHocPhan)
], DangKyHoc.prototype, "lopHocPhan", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'lop_hoc_phan_id' }),
    __metadata("design:type", Number)
], DangKyHoc.prototype, "lopHocPhanId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ngay_dang_ky', type: 'date', default: () => 'CURRENT_DATE' }),
    __metadata("design:type", Date)
], DangKyHoc.prototype, "ngayDangKy", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'da_thanh_toan', default: false }),
    __metadata("design:type", Boolean)
], DangKyHoc.prototype, "daThanhToan", void 0);
exports.DangKyHoc = DangKyHoc = __decorate([
    (0, typeorm_1.Entity)('dang_ky_hoc')
], DangKyHoc);
//# sourceMappingURL=dang-ky-hoc.entity.js.map