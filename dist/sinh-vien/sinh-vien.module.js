"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SinhVienModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const sinh_vien_controller_1 = require("./sinh-vien.controller");
const sinh_vien_service_1 = require("./sinh-vien.service");
const sinh_vien_entity_1 = require("./entities/sinh-vien.entity");
let SinhVienModule = class SinhVienModule {
};
exports.SinhVienModule = SinhVienModule;
exports.SinhVienModule = SinhVienModule = __decorate([
    (0, common_1.Module)({
        imports: [
            typeorm_1.TypeOrmModule.forFeature([sinh_vien_entity_1.SinhVien]),
        ],
        controllers: [sinh_vien_controller_1.SinhVienController],
        providers: [sinh_vien_service_1.SinhVienService],
        exports: [sinh_vien_service_1.SinhVienService],
    })
], SinhVienModule);
//# sourceMappingURL=sinh-vien.module.js.map