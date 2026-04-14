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
exports.LopHocPhan = void 0;
const typeorm_1 = require("typeorm");
const hoc_phan_entity_1 = require("../../hoc-phan/entities/hoc-phan.entity");
const giang_vien_entity_1 = require("../../giang-vien/entities/giang-vien.entity");
let LopHocPhan = class LopHocPhan {
};
exports.LopHocPhan = LopHocPhan;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], LopHocPhan.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => hoc_phan_entity_1.HocPhan, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'hoc_phan_id' }),
    __metadata("design:type", hoc_phan_entity_1.HocPhan)
], LopHocPhan.prototype, "hocPhan", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'hoc_phan_id' }),
    __metadata("design:type", Number)
], LopHocPhan.prototype, "hocPhanId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => giang_vien_entity_1.GiangVien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'giang_vien_id' }),
    __metadata("design:type", giang_vien_entity_1.GiangVien)
], LopHocPhan.prototype, "giangVien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'giang_vien_id', nullable: true }),
    __metadata("design:type", Number)
], LopHocPhan.prototype, "giangVienId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'hoc_ky', length: 20, nullable: true }),
    __metadata("design:type", String)
], LopHocPhan.prototype, "hocKy", void 0);
exports.LopHocPhan = LopHocPhan = __decorate([
    (0, typeorm_1.Entity)('lop_hoc_phan')
], LopHocPhan);
//# sourceMappingURL=lop-hoc-phan.entity.js.map