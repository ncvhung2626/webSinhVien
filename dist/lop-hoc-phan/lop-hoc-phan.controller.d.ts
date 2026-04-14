import { LopHocPhanService } from './lop-hoc-phan.service';
import { CreateLopHocPhanDto } from './dto/create-lop-hoc-phan.dto';
export declare class LopHocPhanController {
    private readonly lopHocPhanService;
    constructor(lopHocPhanService: LopHocPhanService);
    findAll(): Promise<import("./entities/lop-hoc-phan.entity").LopHocPhan[]>;
    findByGiangVien(gvId: number): Promise<import("./entities/lop-hoc-phan.entity").LopHocPhan[]>;
    findOne(id: number): Promise<import("./entities/lop-hoc-phan.entity").LopHocPhan>;
    create(dto: CreateLopHocPhanDto): Promise<import("./entities/lop-hoc-phan.entity").LopHocPhan>;
    update(id: number, dto: Partial<CreateLopHocPhanDto>): Promise<import("./entities/lop-hoc-phan.entity").LopHocPhan>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
}
