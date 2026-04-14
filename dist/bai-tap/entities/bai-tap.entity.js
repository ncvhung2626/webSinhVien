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
exports.BaiTap = void 0;
const typeorm_1 = require("typeorm");
const lop_hoc_phan_entity_1 = require("../../lop-hoc-phan/entities/lop-hoc-phan.entity");
const giang_vien_entity_1 = require("../../giang-vien/entities/giang-vien.entity");
let BaiTap = class BaiTap {
};
exports.BaiTap = BaiTap;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], BaiTap.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => lop_hoc_phan_entity_1.LopHocPhan, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'lop_hoc_phan_id' }),
    __metadata("design:type", lop_hoc_phan_entity_1.LopHocPhan)
], BaiTap.prototype, "lopHocPhan", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'lop_hoc_phan_id' }),
    __metadata("design:type", Number)
], BaiTap.prototype, "lopHocPhanId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ten_bai_tap', length: 100 }),
    __metadata("design:type", String)
], BaiTap.prototype, "tenBaiTap", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'han_nop', type: 'date' }),
    __metadata("design:type", Date)
], BaiTap.prototype, "hanNop", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => giang_vien_entity_1.GiangVien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'giang_vien_id' }),
    __metadata("design:type", giang_vien_entity_1.GiangVien)
], BaiTap.prototype, "giangVien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'giang_vien_id', nullable: true }),
    __metadata("design:type", Number)
], BaiTap.prototype, "giangVienId", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'text', nullable: true }),
    __metadata("design:type", String)
], BaiTap.prototype, "moTa", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'file_dinh_kem', length: 500, nullable: true }),
    __metadata("design:type", String)
], BaiTap.prototype, "fileDinhKem", void 0);
__decorate([
    (0, typeorm_1.CreateDateColumn)({ name: 'ngay_tao' }),
    __metadata("design:type", Date)
], BaiTap.prototype, "ngayTao", void 0);
exports.BaiTap = BaiTap = __decorate([
    (0, typeorm_1.Entity)('bai_tap')
], BaiTap);
//# sourceMappingURL=bai-tap.entity.js.map