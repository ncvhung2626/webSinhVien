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
exports.AuthService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const jwt_1 = require("@nestjs/jwt");
const bcrypt = require("bcrypt");
const nguoi_dung_entity_1 = require("./entities/nguoi-dung.entity");
let AuthService = class AuthService {
    constructor(nguoiDungRepo, jwtService) {
        this.nguoiDungRepo = nguoiDungRepo;
        this.jwtService = jwtService;
    }
    async login(dto) {
        const user = await this.nguoiDungRepo.findOne({
            where: { email: dto.email },
            relations: ['vaiTro'],
        });
        if (!user)
            throw new common_1.UnauthorizedException('Email không tồn tại');
        let isMatch = false;
        const hash = user.matKhau || '';
        if (hash.startsWith('$2b$') || hash.startsWith('$2a$')) {
            isMatch = await bcrypt.compare(dto.matKhau, hash);
        }
        else {
            isMatch = dto.matKhau === hash;
        }
        if (!isMatch)
            throw new common_1.UnauthorizedException('Mật khẩu không đúng');
        const vaiTro = user.vaiTro?.tenVaiTro || '';
        const payload = { sub: user.id, email: user.email, vaiTro };
        return {
            accessToken: this.jwtService.sign(payload),
            vaiTro,
            userId: user.id,
        };
    }
    verifyToken(token) {
        return this.jwtService.verify(token);
    }
    async resetPassword(email) {
        const user = await this.nguoiDungRepo.findOne({ where: { email } });
        if (!user)
            throw new Error('Email không tồn tại trong hệ thống');
        const newPass = Math.random().toString(36).slice(-8).toUpperCase();
        user.matKhau = newPass;
        await this.nguoiDungRepo.save(user);
        return newPass;
    }
    async kiemTraEmail(email) {
        const user = await this.nguoiDungRepo.findOne({ where: { email } });
        if (!user)
            throw new Error('Email không tồn tại trong hệ thống');
    }
    async datLaiMatKhau(email, matKhauMoi) {
        const user = await this.nguoiDungRepo.findOne({ where: { email } });
        if (!user)
            throw new Error('Email không tồn tại trong hệ thống');
        user.matKhau = await bcrypt.hash(matKhauMoi, 10);
        await this.nguoiDungRepo.save(user);
    }
};
exports.AuthService = AuthService;
exports.AuthService = AuthService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(nguoi_dung_entity_1.NguoiDung)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        jwt_1.JwtService])
], AuthService);
//# sourceMappingURL=auth.service.js.map