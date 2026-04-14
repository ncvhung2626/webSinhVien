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
exports.PhieuYeuCauController = void 0;
const common_1 = require("@nestjs/common");
const phieu_yeu_cau_service_1 = require("./phieu-yeu-cau.service");
const phieu_yeu_cau_dto_1 = require("./dto/phieu-yeu-cau.dto");
let PhieuYeuCauController = class PhieuYeuCauController {
    constructor(phieuYeuCauService) {
        this.phieuYeuCauService = phieuYeuCauService;
    }
    findAll() {
        return this.phieuYeuCauService.findAll();
    }
    findBySinhVien(svId) {
        return this.phieuYeuCauService.findBySinhVien(svId);
    }
    findOne(id) {
        return this.phieuYeuCauService.findOne(id);
    }
    create(dto) {
        return this.phieuYeuCauService.create(dto);
    }
    xuLy(id, dto) {
        return this.phieuYeuCauService.xuLy(id, dto);
    }
    remove(id) {
        return this.phieuYeuCauService.remove(id);
    }
};
exports.PhieuYeuCauController = PhieuYeuCauController;
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)('sinh-vien/:svId'),
    __param(0, (0, common_1.Param)('svId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "findBySinhVien", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "findOne", null);
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [phieu_yeu_cau_dto_1.TaoPhieuDto]),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "create", null);
__decorate([
    (0, common_1.Put)(':id/xu-ly'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, phieu_yeu_cau_dto_1.XuLyPhieuDto]),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "xuLy", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], PhieuYeuCauController.prototype, "remove", null);
exports.PhieuYeuCauController = PhieuYeuCauController = __decorate([
    (0, common_1.Controller)('api/phieu-yeu-cau'),
    __metadata("design:paramtypes", [phieu_yeu_cau_service_1.PhieuYeuCauService])
], PhieuYeuCauController);
//# sourceMappingURL=phieu-yeu-cau.controller.js.map