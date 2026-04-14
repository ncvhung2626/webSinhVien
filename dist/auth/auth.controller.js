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
exports.AuthController = void 0;
const common_1 = require("@nestjs/common");
const path_1 = require("path");
const auth_service_1 = require("./auth.service");
const login_dto_1 = require("./dto/login.dto");
let AuthController = class AuthController {
    constructor(authService) {
        this.authService = authService;
    }
    showLogin(res) {
        res.sendFile((0, path_1.join)(__dirname, '..', '..', 'public', 'index.html'));
    }
    async login(dto) {
        const result = await this.authService.login(dto);
        return {
            ...result,
            redirectUrl: result.vaiTro === 'GIANG_VIEN' || result.vaiTro === 'giang_vien'
                ? '/giang-vien'
                : '/sinh-vien',
        };
    }
    async resetPassword(email) {
        try {
            const newPass = await this.authService.resetPassword(email);
            return { success: true, newPassword: newPass };
        }
        catch (e) {
            return { success: false, message: e.message };
        }
    }
    async kiemTraEmail(email) {
        try {
            await this.authService.kiemTraEmail(email);
            return { success: true };
        }
        catch (e) {
            return { success: false, message: e.message };
        }
    }
    async datLaiMatKhau(email, matKhauMoi) {
        try {
            if (!matKhauMoi || matKhauMoi.length < 6) {
                return { success: false, message: 'Mật khẩu phải có ít nhất 6 ký tự' };
            }
            await this.authService.datLaiMatKhau(email, matKhauMoi);
            return { success: true };
        }
        catch (e) {
            return { success: false, message: e.message };
        }
    }
};
exports.AuthController = AuthController;
__decorate([
    (0, common_1.Get)(),
    __param(0, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], AuthController.prototype, "showLogin", null);
__decorate([
    (0, common_1.Post)('api/auth/login'),
    (0, common_1.HttpCode)(common_1.HttpStatus.OK),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [login_dto_1.LoginDto]),
    __metadata("design:returntype", Promise)
], AuthController.prototype, "login", null);
__decorate([
    (0, common_1.Post)('api/auth/reset-password'),
    (0, common_1.HttpCode)(common_1.HttpStatus.OK),
    __param(0, (0, common_1.Body)('email')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], AuthController.prototype, "resetPassword", null);
__decorate([
    (0, common_1.Post)('api/auth/quen-mat-khau/kiem-tra-email'),
    (0, common_1.HttpCode)(common_1.HttpStatus.OK),
    __param(0, (0, common_1.Body)('email')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], AuthController.prototype, "kiemTraEmail", null);
__decorate([
    (0, common_1.Post)('api/auth/quen-mat-khau/dat-lai'),
    (0, common_1.HttpCode)(common_1.HttpStatus.OK),
    __param(0, (0, common_1.Body)('email')),
    __param(1, (0, common_1.Body)('matKhauMoi')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String]),
    __metadata("design:returntype", Promise)
], AuthController.prototype, "datLaiMatKhau", null);
exports.AuthController = AuthController = __decorate([
    (0, common_1.Controller)(),
    __metadata("design:paramtypes", [auth_service_1.AuthService])
], AuthController);
//# sourceMappingURL=auth.controller.js.map