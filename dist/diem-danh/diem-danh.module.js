"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.DiemDanhModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const diem_danh_controller_1 = require("./diem-danh.controller");
const diem_danh_service_1 = require("./diem-danh.service");
const diem_danh_entity_1 = require("./entities/diem-danh.entity");
const phien_diem_danh_entity_1 = require("./entities/phien-diem-danh.entity");
let DiemDanhModule = class DiemDanhModule {
};
exports.DiemDanhModule = DiemDanhModule;
exports.DiemDanhModule = DiemDanhModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([diem_danh_entity_1.DiemDanh, phien_diem_danh_entity_1.PhienDiemDanh])],
        controllers: [diem_danh_controller_1.DiemDanhController],
        providers: [diem_danh_service_1.DiemDanhService],
        exports: [diem_danh_service_1.DiemDanhService],
    })
], DiemDanhModule);
//# sourceMappingURL=diem-danh.module.js.map