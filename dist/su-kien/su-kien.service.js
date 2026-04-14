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
exports.SuKienService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const su_kien_entity_1 = require("./entities/su-kien.entity");
const dang_ky_su_kien_entity_1 = require("./entities/dang-ky-su-kien.entity");
const diem_ren_luyen_service_1 = require("../diem-ren-luyen/diem-ren-luyen.service");
let SuKienService = class SuKienService {
    constructor(suKienRepo, dangKyRepo, diemRenLuyenService) {
        this.suKienRepo = suKienRepo;
        this.dangKyRepo = dangKyRepo;
        this.diemRenLuyenService = diemRenLuyenService;
    }
    findAll() {
        return this.suKienRepo.find({ order: { ngayToChuc: 'ASC' } });
    }
    async findOne(id) {
        const sk = await this.suKienRepo.findOne({ where: { id } });
        if (!sk)
            throw new common_1.NotFoundException(`Không tìm thấy sự kiện id=${id}`);
        return sk;
    }
    findBySinhVien(sinhVienId) {
        return this.dangKyRepo.find({
            where: { sinhVienId },
            relations: ['suKien'],
        });
    }
    findDanhSachDangKy(suKienId) {
        return this.dangKyRepo.find({
            where: { suKienId },
            relations: ['sinhVien'],
        });
    }
    create(dto) {
        const sk = this.suKienRepo.create(dto);
        return this.suKienRepo.save(sk);
    }
    async remove(id) {
        await this.findOne(id);
        return this.suKienRepo.delete(id);
    }
    async dangKy(dto) {
        const exists = await this.dangKyRepo.findOne({
            where: { suKienId: dto.suKienId, sinhVienId: dto.sinhVienId },
        });
        if (exists)
            throw new common_1.ConflictException('Bạn đã đăng ký sự kiện này rồi');
        const suKien = await this.findOne(dto.suKienId);
        const dk = this.dangKyRepo.create({ ...dto, trangThai: 'da_duyet' });
        await this.dangKyRepo.save(dk);
        if (suKien.diemCong > 0) {
            await this.diemRenLuyenService.congDiem({
                sinhVienId: dto.sinhVienId,
                diemThayDoi: suKien.diemCong,
                lyDo: `Tham gia sự kiện: ${suKien.tenSuKien}`,
            });
        }
        return { message: `Đăng ký thành công! Cộng ${suKien.diemCong} điểm rèn luyện.` };
    }
    async huyDangKy(id) {
        const dk = await this.dangKyRepo.findOne({ where: { id } });
        if (!dk)
            throw new common_1.NotFoundException(`Không tìm thấy đăng ký id=${id}`);
        return this.dangKyRepo.delete(id);
    }
};
exports.SuKienService = SuKienService;
exports.SuKienService = SuKienService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(su_kien_entity_1.SuKien)),
    __param(1, (0, typeorm_1.InjectRepository)(dang_ky_su_kien_entity_1.DangKySuKien)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository,
        diem_ren_luyen_service_1.DiemRenLuyenService])
], SuKienService);
//# sourceMappingURL=su-kien.service.js.map