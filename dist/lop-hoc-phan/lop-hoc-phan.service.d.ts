import { Repository } from 'typeorm';
import { LopHocPhan } from './entities/lop-hoc-phan.entity';
import { CreateLopHocPhanDto } from './dto/create-lop-hoc-phan.dto';
export declare class LopHocPhanService {
    private readonly repo;
    constructor(repo: Repository<LopHocPhan>);
    findAll(): Promise<LopHocPhan[]>;
    findByGiangVien(giangVienId: number): Promise<LopHocPhan[]>;
    findOne(id: number): Promise<LopHocPhan>;
    create(dto: CreateLopHocPhanDto): Promise<LopHocPhan>;
    update(id: number, dto: Partial<CreateLopHocPhanDto>): Promise<LopHocPhan>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
}
