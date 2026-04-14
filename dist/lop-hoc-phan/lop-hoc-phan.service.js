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
exports.LopHocPhanService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const lop_hoc_phan_entity_1 = require("./entities/lop-hoc-phan.entity");
let LopHocPhanService = class LopHocPhanService {
    constructor(repo) {
        this.repo = repo;
    }
    findAll() {
        return this.repo.find({ relations: ['hocPhan', 'giangVien'] });
    }
    findByGiangVien(giangVienId) {
        return this.repo.find({
            where: { giangVienId },
            relations: ['hocPhan', 'giangVien'],
        });
    }
    async findOne(id) {
        const lhp = await this.repo.findOne({
            where: { id },
            relations: ['hocPhan', 'giangVien'],
        });
        if (!lhp)
            throw new common_1.NotFoundException(`Không tìm thấy lớp học phần id=${id}`);
        return lhp;
    }
    create(dto) {
        return this.repo.save(this.repo.create(dto));
    }
    async update(id, dto) {
        await this.findOne(id);
        await this.repo.update(id, dto);
        return this.findOne(id);
    }
    async remove(id) {
        await this.findOne(id);
        return this.repo.delete(id);
    }
};
exports.LopHocPhanService = LopHocPhanService;
exports.LopHocPhanService = LopHocPhanService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(lop_hoc_phan_entity_1.LopHocPhan)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], LopHocPhanService);
//# sourceMappingURL=lop-hoc-phan.service.js.map