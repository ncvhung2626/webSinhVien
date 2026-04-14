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
exports.GiangVien = void 0;
const typeorm_1 = require("typeorm");
const nguoi_dung_entity_1 = require("../../auth/entities/nguoi-dung.entity");
let GiangVien = class GiangVien {
};
exports.GiangVien = GiangVien;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], GiangVien.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.OneToOne)(() => nguoi_dung_entity_1.NguoiDung, { eager: false }),
    (0, typeorm_1.JoinColumn)({ name: 'nguoi_dung_id' }),
    __metadata("design:type", nguoi_dung_entity_1.NguoiDung)
], GiangVien.prototype, "nguoiDung", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'nguoi_dung_id', nullable: true }),
    __metadata("design:type", Number)
], GiangVien.prototype, "nguoiDungId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ho_ten', length: 100 }),
    __metadata("design:type", String)
], GiangVien.prototype, "hoTen", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'bo_mon', length: 100, nullable: true }),
    __metadata("design:type", String)
], GiangVien.prototype, "boMon", void 0);
exports.GiangVien = GiangVien = __decorate([
    (0, typeorm_1.Entity)('giang_vien')
], GiangVien);
//# sourceMappingURL=giang-vien.entity.js.map