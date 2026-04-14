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
exports.BaiTapController = void 0;
const common_1 = require("@nestjs/common");
const platform_express_1 = require("@nestjs/platform-express");
const multer_1 = require("multer");
const path_1 = require("path");
const bai_tap_service_1 = require("./bai-tap.service");
const bai_tap_dto_1 = require("./dto/bai-tap.dto");
let BaiTapController = class BaiTapController {
    constructor(baiTapService) {
        this.baiTapService = baiTapService;
    }
    findByLop(lopId) {
        return this.baiTapService.findByLop(lopId);
    }
    findNopBaiBySinhVien(svId) {
        return this.baiTapService.findNopBaiBySinhVien(svId);
    }
    nopBai(dto, file) {
        const filePath = file ? `uploads/bai-tap/${file.filename}` : undefined;
        return this.baiTapService.nopBai(dto, filePath);
    }
    chamDiem(nbId, dto) {
        return this.baiTapService.chamDiem(nbId, dto);
    }
    findNopBaiByBaiTap(id) {
        return this.baiTapService.findNopBaiByBaiTap(id);
    }
    findOne(id) {
        return this.baiTapService.findOne(id);
    }
    create(dto, file) {
        if (file) {
            dto.fileDinhKem = `uploads/de-bai/${file.filename}`;
        }
        return this.baiTapService.create(dto);
    }
    update(id, dto) {
        return this.baiTapService.update(id, dto);
    }
    remove(id) {
        return this.baiTapService.remove(id);
    }
};
exports.BaiTapController = BaiTapController;
__decorate([
    (0, common_1.Get)('lop/:lopId'),
    __param(0, (0, common_1.Param)('lopId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "findByLop", null);
__decorate([
    (0, common_1.Get)('sinh-vien/:svId/nop-bai'),
    __param(0, (0, common_1.Param)('svId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "findNopBaiBySinhVien", null);
__decorate([
    (0, common_1.Post)('nop'),
    (0, common_1.UseInterceptors)((0, platform_express_1.FileInterceptor)('file', {
        storage: (0, multer_1.diskStorage)({
            destination: './uploads/bai-tap',
            filename: (_req, file, cb) => {
                const unique = Date.now() + '-' + Math.round(Math.random() * 1e9);
                cb(null, unique + (0, path_1.extname)(file.originalname));
            },
        }),
        limits: { fileSize: 20 * 1024 * 1024 },
    })),
    __param(0, (0, common_1.Body)()),
    __param(1, (0, common_1.UploadedFile)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [bai_tap_dto_1.NopBaiDto, Object]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "nopBai", null);
__decorate([
    (0, common_1.Put)('nop-bai/:nbId/cham-diem'),
    __param(0, (0, common_1.Param)('nbId', common_1.ParseIntPipe)),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, bai_tap_dto_1.ChamDiemDto]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "chamDiem", null);
__decorate([
    (0, common_1.Get)(':id/nop-bai'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "findNopBaiByBaiTap", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "findOne", null);
__decorate([
    (0, common_1.Post)(),
    (0, common_1.UseInterceptors)((0, platform_express_1.FileInterceptor)('fileDinhKem', {
        storage: (0, multer_1.diskStorage)({
            destination: './uploads/de-bai',
            filename: (_req, file, cb) => {
                const unique = Date.now() + '-' + Math.round(Math.random() * 1e9);
                cb(null, unique + (0, path_1.extname)(file.originalname));
            },
        }),
        limits: { fileSize: 30 * 1024 * 1024 },
    })),
    __param(0, (0, common_1.Body)()),
    __param(1, (0, common_1.UploadedFile)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [bai_tap_dto_1.CreateBaiTapDto, Object]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "create", null);
__decorate([
    (0, common_1.Put)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], BaiTapController.prototype, "remove", null);
exports.BaiTapController = BaiTapController = __decorate([
    (0, common_1.Controller)('api/bai-tap'),
    __metadata("design:paramtypes", [bai_tap_service_1.BaiTapService])
], BaiTapController);
//# sourceMappingURL=bai-tap.controller.js.map