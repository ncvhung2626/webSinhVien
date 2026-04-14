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
exports.NopBai = void 0;
const typeorm_1 = require("typeorm");
const bai_tap_entity_1 = require("./bai-tap.entity");
const sinh_vien_entity_1 = require("../../sinh-vien/entities/sinh-vien.entity");
let NopBai = class NopBai {
};
exports.NopBai = NopBai;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], NopBai.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => bai_tap_entity_1.BaiTap, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'bai_tap_id' }),
    __metadata("design:type", bai_tap_entity_1.BaiTap)
], NopBai.prototype, "baiTap", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'bai_tap_id' }),
    __metadata("design:type", Number)
], NopBai.prototype, "baiTapId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => sinh_vien_entity_1.SinhVien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'sinh_vien_id' }),
    __metadata("design:type", sinh_vien_entity_1.SinhVien)
], NopBai.prototype, "sinhVien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'sinh_vien_id' }),
    __metadata("design:type", Number)
], NopBai.prototype, "sinhVienId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'mssv', length: 20, nullable: true }),
    __metadata("design:type", String)
], NopBai.prototype, "mssv", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'file_nop', length: 500, nullable: true }),
    __metadata("design:type", String)
], NopBai.prototype, "fileNop", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ghi_chu', type: 'text', nullable: true }),
    __metadata("design:type", String)
], NopBai.prototype, "ghiChu", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ngay_nop', type: 'date', nullable: true }),
    __metadata("design:type", Date)
], NopBai.prototype, "ngayNop", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'trang_thai', length: 20, default: 'da_nop' }),
    __metadata("design:type", String)
], NopBai.prototype, "trangThai", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'diem', type: 'numeric', precision: 4, scale: 1, nullable: true }),
    __metadata("design:type", Number)
], NopBai.prototype, "diem", void 0);
exports.NopBai = NopBai = __decorate([
    (0, typeorm_1.Entity)('nop_bai')
], NopBai);
//# sourceMappingURL=nop-bai.entity.js.map