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
exports.HocPhanController = void 0;
const common_1 = require("@nestjs/common");
const hoc_phan_service_1 = require("./hoc-phan.service");
const create_hoc_phan_dto_1 = require("./dto/create-hoc-phan.dto");
let HocPhanController = class HocPhanController {
    constructor(hocPhanService) {
        this.hocPhanService = hocPhanService;
    }
    findAll() { return this.hocPhanService.findAll(); }
    findOne(id) {
        return this.hocPhanService.findOne(id);
    }
    create(dto) {
        return this.hocPhanService.create(dto);
    }
    update(id, dto) {
        return this.hocPhanService.update(id, dto);
    }
    remove(id) {
        return this.hocPhanService.remove(id);
    }
};
exports.HocPhanController = HocPhanController;
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], HocPhanController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], HocPhanController.prototype, "findOne", null);
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_hoc_phan_dto_1.CreateHocPhanDto]),
    __metadata("design:returntype", void 0)
], HocPhanController.prototype, "create", null);
__decorate([
    (0, common_1.Put)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", void 0)
], HocPhanController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], HocPhanController.prototype, "remove", null);
exports.HocPhanController = HocPhanController = __decorate([
    (0, common_1.Controller)('api/hoc-phan'),
    __metadata("design:paramtypes", [hoc_phan_service_1.HocPhanService])
], HocPhanController);
//# sourceMappingURL=hoc-phan.controller.js.map