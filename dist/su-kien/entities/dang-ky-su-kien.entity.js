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
exports.DangKySuKien = void 0;
const typeorm_1 = require("typeorm");
const su_kien_entity_1 = require("./su-kien.entity");
const sinh_vien_entity_1 = require("../../sinh-vien/entities/sinh-vien.entity");
let DangKySuKien = class DangKySuKien {
};
exports.DangKySuKien = DangKySuKien;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], DangKySuKien.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => su_kien_entity_1.SuKien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'su_kien_id' }),
    __metadata("design:type", su_kien_entity_1.SuKien)
], DangKySuKien.prototype, "suKien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'su_kien_id' }),
    __metadata("design:type", Number)
], DangKySuKien.prototype, "suKienId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => sinh_vien_entity_1.SinhVien, { eager: true }),
    (0, typeorm_1.JoinColumn)({ name: 'sinh_vien_id' }),
    __metadata("design:type", sinh_vien_entity_1.SinhVien)
], DangKySuKien.prototype, "sinhVien", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'sinh_vien_id' }),
    __metadata("design:type", Number)
], DangKySuKien.prototype, "sinhVienId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'trang_thai', length: 20, default: 'da_duyet' }),
    __metadata("design:type", String)
], DangKySuKien.prototype, "trangThai", void 0);
__decorate([
    (0, typeorm_1.CreateDateColumn)({ name: 'thoi_gian_dang_ky' }),
    __metadata("design:type", Date)
], DangKySuKien.prototype, "thoiGianDangKy", void 0);
exports.DangKySuKien = DangKySuKien = __decorate([
    (0, typeorm_1.Entity)('dang_ky_su_kien')
], DangKySuKien);
//# sourceMappingURL=dang-ky-su-kien.entity.js.map