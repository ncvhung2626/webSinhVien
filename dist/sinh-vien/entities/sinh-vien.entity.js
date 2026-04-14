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
exports.SinhVien = void 0;
const typeorm_1 = require("typeorm");
const nguoi_dung_entity_1 = require("../../auth/entities/nguoi-dung.entity");
let SinhVien = class SinhVien {
};
exports.SinhVien = SinhVien;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], SinhVien.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.OneToOne)(() => nguoi_dung_entity_1.NguoiDung, { eager: false }),
    (0, typeorm_1.JoinColumn)({ name: 'nguoi_dung_id' }),
    __metadata("design:type", nguoi_dung_entity_1.NguoiDung)
], SinhVien.prototype, "nguoiDung", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'nguoi_dung_id', nullable: true }),
    __metadata("design:type", Number)
], SinhVien.prototype, "nguoiDungId", void 0);
__decorate([
    (0, typeorm_1.Column)({ length: 20, unique: true }),
    __metadata("design:type", String)
], SinhVien.prototype, "mssv", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ho_ten', length: 100 }),
    __metadata("design:type", String)
], SinhVien.prototype, "hoTen", void 0);
__decorate([
    (0, typeorm_1.Column)({ length: 20, nullable: true }),
    __metadata("design:type", String)
], SinhVien.prototype, "lop", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ma_qr', length: 100, nullable: true }),
    __metadata("design:type", String)
], SinhVien.prototype, "maQr", void 0);
exports.SinhVien = SinhVien = __decorate([
    (0, typeorm_1.Entity)('sinh_vien')
], SinhVien);
//# sourceMappingURL=sinh-vien.entity.js.map