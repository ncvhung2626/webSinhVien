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
exports.SinhVienController = void 0;
const common_1 = require("@nestjs/common");
const path_1 = require("path");
const sinh_vien_service_1 = require("./sinh-vien.service");
const create_sinh_vien_dto_1 = require("./dto/create-sinh-vien.dto");
let SinhVienController = class SinhVienController {
    constructor(sinhVienService) {
        this.sinhVienService = sinhVienService;
    }
    showView(res) {
        res.sendFile((0, path_1.join)(__dirname, '..', '..', 'public', 'sinh-vien.html'));
    }
    findAll() {
        return this.sinhVienService.findAll();
    }
    findMe(uid) {
        return this.sinhVienService.findByNguoiDung(uid);
    }
    findOne(id) {
        return this.sinhVienService.findOne(id);
    }
    create(dto) {
        return this.sinhVienService.create(dto);
    }
    update(id, dto) {
        return this.sinhVienService.update(id, dto);
    }
};
exports.SinhVienController = SinhVienController;
__decorate([
    (0, common_1.Get)('sinh-vien'),
    __param(0, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], SinhVienController.prototype, "showView", null);
__decorate([
    (0, common_1.Get)('api/sinh-vien'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], SinhVienController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)('api/sinh-vien/me/:uid'),
    __param(0, (0, common_1.Param)('uid', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], SinhVienController.prototype, "findMe", null);
__decorate([
    (0, common_1.Get)('api/sinh-vien/:id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], SinhVienController.prototype, "findOne", null);
__decorate([
    (0, common_1.Post)('api/sinh-vien'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_sinh_vien_dto_1.CreateSinhVienDto]),
    __metadata("design:returntype", void 0)
], SinhVienController.prototype, "create", null);
__decorate([
    (0, common_1.Put)('api/sinh-vien/:id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", void 0)
], SinhVienController.prototype, "update", null);
exports.SinhVienController = SinhVienController = __decorate([
    (0, common_1.Controller)(),
    __metadata("design:paramtypes", [sinh_vien_service_1.SinhVienService])
], SinhVienController);
//# sourceMappingURL=sinh-vien.controller.js.map