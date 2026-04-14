"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AdminPhanCongGiangDayModule = void 0;
const common_1 = require("@nestjs/common");
const phan_cong_giang_day_controller_1 = require("./phan-cong-giang-day.controller");
const phan_cong_giang_day_service_1 = require("./phan-cong-giang-day.service");
let AdminPhanCongGiangDayModule = class AdminPhanCongGiangDayModule {
};
exports.AdminPhanCongGiangDayModule = AdminPhanCongGiangDayModule;
exports.AdminPhanCongGiangDayModule = AdminPhanCongGiangDayModule = __decorate([
    (0, common_1.Module)({
        controllers: [phan_cong_giang_day_controller_1.AdminPhanCongGiangDayController],
        providers: [phan_cong_giang_day_service_1.AdminPhanCongGiangDayService],
    })
], AdminPhanCongGiangDayModule);
//# sourceMappingURL=phan-cong-giang-day.module.js.map