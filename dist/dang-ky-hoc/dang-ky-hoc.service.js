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
exports.DangKyHocService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const dang_ky_hoc_entity_1 = require("./entities/dang-ky-hoc.entity");
let DangKyHocService = class DangKyHocService {
    constructor(repo) {
        this.repo = repo;
    }
    findBySinhVien(sinhVienId) {
        return this.repo.find({
            where: { sinhVienId },
            relations: ['lopHocPhan', 'lopHocPhan.hocPhan', 'lopHocPhan.giangVien'],
        });
    }
    findByLopHocPhan(lopHocPhanId) {
        return this.repo.find({
            where: { lopHocPhanId },
            relations: ['sinhVien'],
        });
    }
    async dangKyNhieu(dto) {
        const results = [];
        for (const lopId of dto.lopHocPhanIds) {
            const exists = await this.repo.findOne({
                where: { sinhVienId: dto.sinhVienId, lopHocPhanId: lopId },
            });
            if (exists)
                throw new common_1.ConflictException(`Đã đăng ký lớp ${lopId} rồi`);
            const dk = this.repo.create({ sinhVienId: dto.sinhVienId, lopHocPhanId: lopId });
            results.push(await this.repo.save(dk));
        }
        return results;
    }
    async capNhatThanhToan(sinhVienId, lopHocPhanIds) {
        await this.repo.update({ sinhVienId, lopHocPhanId: (0, typeorm_2.In)(lopHocPhanIds) }, { daThanhToan: true });
        return { message: 'Cập nhật thanh toán thành công' };
    }
    async huyDangKy(id) {
        const dk = await this.repo.findOne({ where: { id } });
        if (!dk)
            throw new common_1.NotFoundException(`Không tìm thấy đăng ký id=${id}`);
        return this.repo.delete(id);
    }
};
exports.DangKyHocService = DangKyHocService;
exports.DangKyHocService = DangKyHocService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(dang_ky_hoc_entity_1.DangKyHoc)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], DangKyHocService);
//# sourceMappingURL=dang-ky-hoc.service.js.map