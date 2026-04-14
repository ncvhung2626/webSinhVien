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
const entities_1 = require("../entities");
let AuthService = class AuthService {
    constructor(nguoiDungRepo, sinhVienRepo, giangVienRepo, jwtService) {
        this.nguoiDungRepo = nguoiDungRepo;
        this.sinhVienRepo = sinhVienRepo;
        this.giangVienRepo = giangVienRepo;
        this.jwtService = jwtService;
    }
    async login(email, matKhau) {
        const user = await this.nguoiDungRepo.findOne({
            where: { email },
            relations: ["vaiTro"],
        });
        if (!user)
            throw new common_1.UnauthorizedException("Email khong ton tai");
        if (matKhau !== user.mat_khau) {
            throw new common_1.UnauthorizedException("Mat khau khong dung");
        }
        const vaiTro = user.vaiTro?.ten_vai_tro?.toLowerCase() || "sinh_vien";
        let profileId = null, hoTen = email;
        if (vaiTro === "sinh_vien") {
            const sv = await this.sinhVienRepo.findOne({
                where: { nguoi_dung_id: user.id },
            });
            if (sv) {
                profileId = sv.id;
                hoTen = sv.ho_ten || email;
            }
        }
        if (vaiTro === "giang_vien") {
            const gv = await this.giangVienRepo.findOne({
                where: { nguoi_dung_id: user.id },
            });
            if (gv) {
                profileId = gv.id;
                hoTen = gv.ho_ten || email;
            }
        }
        const payload = {
            sub: user.id,
            email: user.email,
            vaiTro,
            profileId,
            hoTen,
        };
        return {
            access_token: this.jwtService.sign(payload),
            vaiTro,
            profileId,
            hoTen,
            email: user.email,
        };
    }
    async getMe(userId) {
        return this.nguoiDungRepo.findOne({
            where: { id: userId },
            relations: ["vaiTro"],
        });
    }
};
exports.AuthService = AuthService;
exports.AuthService = AuthService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(entities_1.NguoiDung)),
    __param(1, (0, typeorm_1.InjectRepository)(entities_1.SinhVien)),
    __param(2, (0, typeorm_1.InjectRepository)(entities_1.GiangVien)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository,
        jwt_1.JwtService])
], AuthService);
//# sourceMappingURL=auth.service.js.map