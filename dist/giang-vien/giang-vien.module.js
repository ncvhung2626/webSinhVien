"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.GiangVienModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const giang_vien_controller_1 = require("./giang-vien.controller");
const giang_vien_service_1 = require("./giang-vien.service");
const giang_vien_entity_1 = require("./entities/giang-vien.entity");
let GiangVienModule = class GiangVienModule {
};
exports.GiangVienModule = GiangVienModule;
exports.GiangVienModule = GiangVienModule = __decorate([
    (0, common_1.Module)({
        imports: [
            typeorm_1.TypeOrmModule.forFeature([giang_vien_entity_1.GiangVien]),
        ],
        controllers: [giang_vien_controller_1.GiangVienController],
        providers: [giang_vien_service_1.GiangVienService],
        exports: [giang_vien_service_1.GiangVienService],
    })
], GiangVienModule);
//# sourceMappingURL=giang-vien.module.js.map