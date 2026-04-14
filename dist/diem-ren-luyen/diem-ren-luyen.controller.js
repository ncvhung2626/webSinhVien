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
exports.DiemRenLuyenController = void 0;
const common_1 = require("@nestjs/common");
const diem_ren_luyen_service_1 = require("./diem-ren-luyen.service");
const diem_ren_luyen_dto_1 = require("./dto/diem-ren-luyen.dto");
let DiemRenLuyenController = class DiemRenLuyenController {
    constructor(diemRenLuyenService) {
        this.diemRenLuyenService = diemRenLuyenService;
    }
    findBySinhVien(svId) {
        return this.diemRenLuyenService.findBySinhVien(svId);
    }
    findLichSu(svId) {
        return this.diemRenLuyenService.findLichSu(svId);
    }
    capNhat(dto) {
        return this.diemRenLuyenService.capNhat(dto);
    }
    congDiem(dto) {
        return this.diemRenLuyenService.congDiem(dto);
    }
};
exports.DiemRenLuyenController = DiemRenLuyenController;
__decorate([
    (0, common_1.Get)('sinh-vien/:svId'),
    __param(0, (0, common_1.Param)('svId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DiemRenLuyenController.prototype, "findBySinhVien", null);
__decorate([
    (0, common_1.Get)('sinh-vien/:svId/lich-su'),
    __param(0, (0, common_1.Param)('svId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], DiemRenLuyenController.prototype, "findLichSu", null);
__decorate([
    (0, common_1.Put)('cap-nhat'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [diem_ren_luyen_dto_1.CapNhatDrlDto]),
    __metadata("design:returntype", void 0)
], DiemRenLuyenController.prototype, "capNhat", null);
__decorate([
    (0, common_1.Put)('cong-diem'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [diem_ren_luyen_dto_1.CongDiemDto]),
    __metadata("design:returntype", void 0)
], DiemRenLuyenController.prototype, "congDiem", null);
exports.DiemRenLuyenController = DiemRenLuyenController = __decorate([
    (0, common_1.Controller)('api/diem-ren-luyen'),
    __metadata("design:paramtypes", [diem_ren_luyen_service_1.DiemRenLuyenService])
], DiemRenLuyenController);
//# sourceMappingURL=diem-ren-luyen.controller.js.map