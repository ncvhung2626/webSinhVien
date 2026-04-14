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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AdminPhanCongGiangDayController = void 0;
const common_1 = require("@nestjs/common");
const phan_cong_giang_day_service_1 = require("./phan-cong-giang-day.service");
let AdminPhanCongGiangDayController = class AdminPhanCongGiangDayController {
    constructor(adminPhanCongService) {
        this.adminPhanCongService = adminPhanCongService;
    }
    async layDanhSachPhanCong(page = '1', limit = '10', search = '') {
        return this.adminPhanCongService.layDanhSachPhanCong(page, limit, search);
    }
    async layDropdownPhanCong() {
        return this.adminPhanCongService.layDropdownPhanCong();
    }
    async themPhanCong(body) {
        return this.adminPhanCongService.themPhanCong(body);
    }
    async suaPhanCong(id, body) {
        return this.adminPhanCongService.suaPhanCong(id, body);
    }
    async xoaPhanCong(id) {
        return this.adminPhanCongService.xoaPhanCong(id);
    }
};
exports.AdminPhanCongGiangDayController = AdminPhanCongGiangDayController;
__decorate([
    (0, common_1.Get)('phan-cong-giang-day'),
    __param(0, (0, common_1.Query)('page')),
    __param(1, (0, common_1.Query)('limit')),
    __param(2, (0, common_1.Query)('search')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String, String]),
    __metadata("design:returntype", Promise)
], AdminPhanCongGiangDayController.prototype, "layDanhSachPhanCong", null);
__decorate([
    (0, common_1.Get)('danh-sach-chon-phancong'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], AdminPhanCongGiangDayController.prototype, "layDropdownPhanCong", null);
__decorate([
    (0, common_1.Post)('phan-cong-giang-day'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], AdminPhanCongGiangDayController.prototype, "themPhanCong", null);
__decorate([
    (0, common_1.Put)('phan-cong-giang-day/:id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], AdminPhanCongGiangDayController.prototype, "suaPhanCong", null);
__decorate([
    (0, common_1.Delete)('phan-cong-giang-day/:id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], AdminPhanCongGiangDayController.prototype, "xoaPhanCong", null);
exports.AdminPhanCongGiangDayController = AdminPhanCongGiangDayController = __decorate([
    (0, common_1.Controller)('api/admin'),
    __metadata("design:paramtypes", [phan_cong_giang_day_service_1.AdminPhanCongGiangDayService])
], AdminPhanCongGiangDayController);
//# sourceMappingURL=phan-cong-giang-day.controller.js.map