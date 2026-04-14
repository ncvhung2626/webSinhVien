import { Repository } from 'typeorm';
import { HocPhan } from './entities/hoc-phan.entity';
import { CreateHocPhanDto } from './dto/create-hoc-phan.dto';
export declare class HocPhanService {
    private readonly repo;
    constructor(repo: Repository<HocPhan>);
    findAll(): Promise<HocPhan[]>;
    findOne(id: number): Promise<HocPhan>;
    create(dto: CreateHocPhanDto): Promise<HocPhan>;
    update(id: number, dto: Partial<CreateHocPhanDto>): Promise<HocPhan>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
}
