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
exports.NguoiDung = void 0;
const typeorm_1 = require("typeorm");
const vai_tro_entity_1 = require("./vai-tro.entity");
let NguoiDung = class NguoiDung {
};
exports.NguoiDung = NguoiDung;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], NguoiDung.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ unique: true, length: 100 }),
    __metadata("design:type", String)
], NguoiDung.prototype, "email", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'mat_khau', length: 255 }),
    __metadata("design:type", String)
], NguoiDung.prototype, "matKhau", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => vai_tro_entity_1.VaiTro, { eager: true, nullable: true }),
    (0, typeorm_1.JoinColumn)({ name: 'vai_tro_id' }),
    __metadata("design:type", vai_tro_entity_1.VaiTro)
], NguoiDung.prototype, "vaiTro", void 0);
exports.NguoiDung = NguoiDung = __decorate([
    (0, typeorm_1.Entity)('nguoi_dung')
], NguoiDung);
//# sourceMappingURL=nguoi-dung.entity.js.map