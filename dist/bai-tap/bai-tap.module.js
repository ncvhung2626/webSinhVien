"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.BaiTapModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const platform_express_1 = require("@nestjs/platform-express");
const bai_tap_controller_1 = require("./bai-tap.controller");
const bai_tap_service_1 = require("./bai-tap.service");
const bai_tap_entity_1 = require("./entities/bai-tap.entity");
const nop_bai_entity_1 = require("./entities/nop-bai.entity");
let BaiTapModule = class BaiTapModule {
};
exports.BaiTapModule = BaiTapModule;
exports.BaiTapModule = BaiTapModule = __decorate([
    (0, common_1.Module)({
        imports: [
            typeorm_1.TypeOrmModule.forFeature([bai_tap_entity_1.BaiTap, nop_bai_entity_1.NopBai]),
            platform_express_1.MulterModule.register({ dest: './uploads' }),
        ],
        controllers: [bai_tap_controller_1.BaiTapController],
        providers: [bai_tap_service_1.BaiTapService],
        exports: [bai_tap_service_1.BaiTapService],
    })
], BaiTapModule);
//# sourceMappingURL=bai-tap.module.js.map