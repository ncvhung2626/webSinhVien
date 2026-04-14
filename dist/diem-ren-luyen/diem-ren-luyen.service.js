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
exports.DiemRenLuyenService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const diem_ren_luyen_entity_1 = require("./entities/diem-ren-luyen.entity");
const lich_su_drl_entity_1 = require("./entities/lich-su-drl.entity");
let DiemRenLuyenService = class DiemRenLuyenService {
    constructor(drlRepo, lichSuRepo) {
        this.drlRepo = drlRepo;
        this.lichSuRepo = lichSuRepo;
    }
    findBySinhVien(sinhVienId) {
        return this.drlRepo.find({
            where: { sinhVienId },
            order: { hocKy: 'DESC' },
        });
    }
    async findHienTai(sinhVienId, hocKy) {
        const drl = await this.drlRepo.findOne({ where: { sinhVienId, hocKy } });
        if (!drl)
            throw new common_1.NotFoundException('Chưa có điểm rèn luyện học kỳ này');
        return drl;
    }
    findLichSu(sinhVienId) {
        return this.lichSuRepo.find({
            where: { sinhVienId },
            order: { ngayCapNhat: 'DESC' },
        });
    }
    async capNhat(dto) {
        const xepLoai = this.tinhXepLoai(dto.tongDiem);
        let drl = await this.drlRepo.findOne({
            where: { sinhVienId: dto.sinhVienId, hocKy: dto.hocKy },
        });
        if (drl) {
            await this.drlRepo.update(drl.id, { tongDiem: dto.tongDiem, xepLoai });
        }
        else {
            drl = this.drlRepo.create({ ...dto, xepLoai });
            await this.drlRepo.save(drl);
        }
        return this.drlRepo.findOne({ where: { sinhVienId: dto.sinhVienId, hocKy: dto.hocKy } });
    }
    async congDiem(dto) {
        const drl = await this.drlRepo.findOne({
            where: { sinhVienId: dto.sinhVienId },
            order: { hocKy: 'DESC' },
        });
        if (!drl)
            throw new common_1.NotFoundException('Chưa có bản ghi điểm rèn luyện');
        const tongMoi = Math.min(100, Math.max(0, drl.tongDiem + dto.diemThayDoi));
        await this.drlRepo.update(drl.id, { tongDiem: tongMoi, xepLoai: this.tinhXepLoai(tongMoi) });
        const ls = this.lichSuRepo.create({
            sinhVienId: dto.sinhVienId,
            diemThayDoi: dto.diemThayDoi,
            lyDo: dto.lyDo,
        });
        await this.lichSuRepo.save(ls);
        return { tongDiem: tongMoi, xepLoai: this.tinhXepLoai(tongMoi) };
    }
    tinhXepLoai(diem) {
        if (diem >= 90)
            return 'xuat_sac';
        if (diem >= 80)
            return 'tot';
        if (diem >= 65)
            return 'kha';
        if (diem >= 50)
            return 'trung_binh';
        return 'yeu';
    }
};
exports.DiemRenLuyenService = DiemRenLuyenService;
exports.DiemRenLuyenService = DiemRenLuyenService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(diem_ren_luyen_entity_1.DiemRenLuyen)),
    __param(1, (0, typeorm_1.InjectRepository)(lich_su_drl_entity_1.LichSuDiemRenLuyen)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], DiemRenLuyenService);
//# sourceMappingURL=diem-ren-luyen.service.js.map