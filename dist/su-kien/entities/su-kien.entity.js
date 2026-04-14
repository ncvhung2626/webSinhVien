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
exports.SuKien = void 0;
const typeorm_1 = require("typeorm");
let SuKien = class SuKien {
};
exports.SuKien = SuKien;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], SuKien.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ten_su_kien', length: 150 }),
    __metadata("design:type", String)
], SuKien.prototype, "tenSuKien", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'text', nullable: true }),
    __metadata("design:type", String)
], SuKien.prototype, "moTa", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ngay_to_chuc', type: 'date' }),
    __metadata("design:type", Date)
], SuKien.prototype, "ngayToChuc", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'dia_diem', length: 100, nullable: true }),
    __metadata("design:type", String)
], SuKien.prototype, "diaDiem", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'diem_cong', default: 0 }),
    __metadata("design:type", Number)
], SuKien.prototype, "diemCong", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'admin_id', nullable: true }),
    __metadata("design:type", Number)
], SuKien.prototype, "adminId", void 0);
exports.SuKien = SuKien = __decorate([
    (0, typeorm_1.Entity)('su_kien')
], SuKien);
//# sourceMappingURL=su-kien.entity.js.map