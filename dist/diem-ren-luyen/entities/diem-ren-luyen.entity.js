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
exports.DiemRenLuyen = void 0;
const typeorm_1 = require("typeorm");
const sinh_vien_entity_1 = require("../../sinh-vien/entities/sinh-vien.entity");
let DiemRenLuyen = class DiemRenLuyen {
};
exports.DiemRenLuyen = DiemRenLuyen;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], DiemRenLuyen.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => sinh_vien_entity_1.SinhVien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'sinh_vien_id' }),
    __metadata("design:type", sinh_vien_entity_1.SinhVien)
], DiemRenLuyen.prototype, "sinhVien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'sinh_vien_id' }),
    __metadata("design:type", Number)
], DiemRenLuyen.prototype, "sinhVienId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'tong_diem' }),
    __metadata("design:type", Number)
], DiemRenLuyen.prototype, "tongDiem", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'xep_loai', length: 20, nullable: true }),
    __metadata("design:type", String)
], DiemRenLuyen.prototype, "xepLoai", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'hoc_ky', length: 20, nullable: true }),
    __metadata("design:type", String)
], DiemRenLuyen.prototype, "hocKy", void 0);
exports.DiemRenLuyen = DiemRenLuyen = __decorate([
    (0, typeorm_1.Entity)('diem_ren_luyen')
], DiemRenLuyen);
//# sourceMappingURL=diem-ren-luyen.entity.js.map