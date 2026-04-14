"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SuKienModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const su_kien_controller_1 = require("./su-kien.controller");
const su_kien_service_1 = require("./su-kien.service");
const su_kien_entity_1 = require("./entities/su-kien.entity");
const dang_ky_su_kien_entity_1 = require("./entities/dang-ky-su-kien.entity");
const diem_ren_luyen_module_1 = require("../diem-ren-luyen/diem-ren-luyen.module");
let SuKienModule = class SuKienModule {
};
exports.SuKienModule = SuKienModule;
exports.SuKienModule = SuKienModule = __decorate([
    (0, common_1.Module)({
        imports: [
            typeorm_1.TypeOrmModule.forFeature([su_kien_entity_1.SuKien, dang_ky_su_kien_entity_1.DangKySuKien]),
            diem_ren_luyen_module_1.DiemRenLuyenModule,
        ],
        controllers: [su_kien_controller_1.SuKienController],
        providers: [su_kien_service_1.SuKienService],
        exports: [su_kien_service_1.SuKienService],
    })
], SuKienModule);
//# sourceMappingURL=su-kien.module.js.map