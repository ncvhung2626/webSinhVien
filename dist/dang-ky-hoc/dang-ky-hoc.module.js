"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.DangKyHocModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const dang_ky_hoc_controller_1 = require("./dang-ky-hoc.controller");
const dang_ky_hoc_service_1 = require("./dang-ky-hoc.service");
const dang_ky_hoc_entity_1 = require("./entities/dang-ky-hoc.entity");
let DangKyHocModule = class DangKyHocModule {
};
exports.DangKyHocModule = DangKyHocModule;
exports.DangKyHocModule = DangKyHocModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([dang_ky_hoc_entity_1.DangKyHoc])],
        controllers: [dang_ky_hoc_controller_1.DangKyHocController],
        providers: [dang_ky_hoc_service_1.DangKyHocService],
        exports: [dang_ky_hoc_service_1.DangKyHocService],
    })
], DangKyHocModule);
//# sourceMappingURL=dang-ky-hoc.module.js.map