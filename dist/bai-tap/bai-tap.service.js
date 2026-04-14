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
exports.BaiTapService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const bai_tap_entity_1 = require("./entities/bai-tap.entity");
const nop_bai_entity_1 = require("./entities/nop-bai.entity");
let BaiTapService = class BaiTapService {
    constructor(baiTapRepo, nopBaiRepo) {
        this.baiTapRepo = baiTapRepo;
        this.nopBaiRepo = nopBaiRepo;
    }
    findByLop(lopHocPhanId) {
        return this.baiTapRepo.find({
            where: { lopHocPhanId },
            order: { hanNop: 'ASC' },
        });
    }
    findBySinhVien(lopHocPhanIds) {
        return this.baiTapRepo.find({
            where: { lopHocPhanId: (0, typeorm_2.In)(lopHocPhanIds) },
            order: { hanNop: 'ASC' },
        });
    }
    async findOne(id) {
        const bt = await this.baiTapRepo.findOne({ where: { id } });
        if (!bt)
            throw new common_1.NotFoundException(`Không tìm thấy bài tập id=${id}`);
        return bt;
    }
    create(dto) {
        const bt = this.baiTapRepo.create(dto);
        return this.baiTapRepo.save(bt);
    }
    async update(id, dto) {
        await this.findOne(id);
        await this.baiTapRepo.update(id, dto);
        return this.findOne(id);
    }
    async remove(id) {
        await this.findOne(id);
        return this.baiTapRepo.delete(id);
    }
    async nopBai(dto, filePath) {
        const exists = await this.nopBaiRepo.findOne({
            where: { baiTapId: dto.baiTapId, sinhVienId: dto.sinhVienId },
        });
        if (exists)
            throw new common_1.ConflictException('Bạn đã nộp bài tập này rồi');
        const nb = this.nopBaiRepo.create({
            ...dto,
            fileNop: filePath,
            ngayNop: new Date(),
            trangThai: 'da_nop',
        });
        return this.nopBaiRepo.save(nb);
    }
    findNopBaiByBaiTap(baiTapId) {
        return this.nopBaiRepo.find({
            where: { baiTapId },
            relations: ['sinhVien'],
        });
    }
    findNopBaiBySinhVien(sinhVienId) {
        return this.nopBaiRepo.find({
            where: { sinhVienId },
            relations: ['baiTap'],
        });
    }
    async chamDiem(nopBaiId, dto) {
        const nb = await this.nopBaiRepo.findOne({ where: { id: nopBaiId } });
        if (!nb)
            throw new common_1.NotFoundException(`Không tìm thấy bài nộp id=${nopBaiId}`);
        await this.nopBaiRepo.update(nopBaiId, { diem: dto.diem, trangThai: 'da_cham' });
        return this.nopBaiRepo.findOne({ where: { id: nopBaiId } });
    }
};
exports.BaiTapService = BaiTapService;
exports.BaiTapService = BaiTapService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(bai_tap_entity_1.BaiTap)),
    __param(1, (0, typeorm_1.InjectRepository)(nop_bai_entity_1.NopBai)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], BaiTapService);
//# sourceMappingURL=bai-tap.service.js.map