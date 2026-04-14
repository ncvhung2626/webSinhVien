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
exports.GiangVienController = void 0;
const common_1 = require("@nestjs/common");
const path_1 = require("path");
const giang_vien_service_1 = require("./giang-vien.service");
const create_giang_vien_dto_1 = require("./dto/create-giang-vien.dto");
let GiangVienController = class GiangVienController {
    constructor(giangVienService) {
        this.giangVienService = giangVienService;
    }
    showView(res) {
        res.sendFile((0, path_1.join)(__dirname, '..', '..', 'public', 'giang-vien.html'));
    }
    findAll() {
        return this.giangVienService.findAll();
    }
    findMe(uid) {
        return this.giangVienService.findByNguoiDung(uid);
    }
    findOne(id) {
        return this.giangVienService.findOne(id);
    }
    create(dto) {
        return this.giangVienService.create(dto);
    }
    update(id, dto) {
        return this.giangVienService.update(id, dto);
    }
};
exports.GiangVienController = GiangVienController;
__decorate([
    (0, common_1.Get)('giang-vien'),
    __param(0, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], GiangVienController.prototype, "showView", null);
__decorate([
    (0, common_1.Get)('api/giang-vien'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], GiangVienController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)('api/giang-vien/me/:uid'),
    __param(0, (0, common_1.Param)('uid', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], GiangVienController.prototype, "findMe", null);
__decorate([
    (0, common_1.Get)('api/giang-vien/:id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], GiangVienController.prototype, "findOne", null);
__decorate([
    (0, common_1.Post)('api/giang-vien'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_giang_vien_dto_1.CreateGiangVienDto]),
    __metadata("design:returntype", void 0)
], GiangVienController.prototype, "create", null);
__decorate([
    (0, common_1.Put)('api/giang-vien/:id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", void 0)
], GiangVienController.prototype, "update", null);
exports.GiangVienController = GiangVienController = __decorate([
    (0, common_1.Controller)(),
    __metadata("design:paramtypes", [giang_vien_service_1.GiangVienService])
], GiangVienController);
//# sourceMappingURL=giang-vien.controller.js.map