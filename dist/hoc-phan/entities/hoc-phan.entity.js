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
exports.HocPhan = void 0;
const typeorm_1 = require("typeorm");
let HocPhan = class HocPhan {
};
exports.HocPhan = HocPhan;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], HocPhan.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'ten_hoc_phan', length: 100 }),
    __metadata("design:type", String)
], HocPhan.prototype, "tenHocPhan", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'so_tin_chi' }),
    __metadata("design:type", Number)
], HocPhan.prototype, "soTinChi", void 0);
exports.HocPhan = HocPhan = __decorate([
    (0, typeorm_1.Entity)('hoc_phan')
], HocPhan);
//# sourceMappingURL=hoc-phan.entity.js.map