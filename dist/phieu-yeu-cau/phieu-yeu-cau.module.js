"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PhieuYeuCauModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const phieu_yeu_cau_controller_1 = require("./phieu-yeu-cau.controller");
const phieu_yeu_cau_service_1 = require("./phieu-yeu-cau.service");
const phieu_yeu_cau_entity_1 = require("./entities/phieu-yeu-cau.entity");
let PhieuYeuCauModule = class PhieuYeuCauModule {
};
exports.PhieuYeuCauModule = PhieuYeuCauModule;
exports.PhieuYeuCauModule = PhieuYeuCauModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([phieu_yeu_cau_entity_1.PhieuYeuCau])],
        controllers: [phieu_yeu_cau_controller_1.PhieuYeuCauController],
        providers: [phieu_yeu_cau_service_1.PhieuYeuCauService],
        exports: [phieu_yeu_cau_service_1.PhieuYeuCauService],
    })
], PhieuYeuCauModule);
//# sourceMappingURL=phieu-yeu-cau.module.js.map