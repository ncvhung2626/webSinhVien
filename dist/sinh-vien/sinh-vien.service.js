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
exports.SinhVienService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const sinh_vien_entity_1 = require("./entities/sinh-vien.entity");
const uuid_1 = require("uuid");
let SinhVienService = class SinhVienService {
    constructor(repo) {
        this.repo = repo;
    }
    findAll() {
        return this.repo.find();
    }
    async findOne(id) {
        const sv = await this.repo.findOne({ where: { id } });
        if (!sv)
            throw new common_1.NotFoundException(`Không tìm thấy sinh viên id=${id}`);
        return sv;
    }
    findByNguoiDung(nguoiDungId) {
        return this.repo.findOne({ where: { nguoiDungId } });
    }
    create(dto) {
        const sv = this.repo.create({ ...dto, maQr: (0, uuid_1.v4)() });
        return this.repo.save(sv);
    }
    async update(id, dto) {
        await this.findOne(id);
        await this.repo.update(id, dto);
        return this.findOne(id);
    }
};
exports.SinhVienService = SinhVienService;
exports.SinhVienService = SinhVienService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(sinh_vien_entity_1.SinhVien)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], SinhVienService);
//# sourceMappingURL=sinh-vien.service.js.map