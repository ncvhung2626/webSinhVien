"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.HocPhanModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const hoc_phan_controller_1 = require("./hoc-phan.controller");
const hoc_phan_service_1 = require("./hoc-phan.service");
const hoc_phan_entity_1 = require("./entities/hoc-phan.entity");
let HocPhanModule = class HocPhanModule {
};
exports.HocPhanModule = HocPhanModule;
exports.HocPhanModule = HocPhanModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([hoc_phan_entity_1.HocPhan])],
        controllers: [hoc_phan_controller_1.HocPhanController],
        providers: [hoc_phan_service_1.HocPhanService],
        exports: [hoc_phan_service_1.HocPhanService],
    })
], HocPhanModule);
//# sourceMappingURL=hoc-phan.module.js.map