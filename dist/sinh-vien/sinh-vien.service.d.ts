import { Repository } from 'typeorm';
import { SinhVien } from './entities/sinh-vien.entity';
import { CreateSinhVienDto } from './dto/create-sinh-vien.dto';
export declare class SinhVienService {
    private readonly repo;
    constructor(repo: Repository<SinhVien>);
    findAll(): Promise<SinhVien[]>;
    findOne(id: number): Promise<SinhVien>;
    findByNguoiDung(nguoiDungId: number): Promise<SinhVien>;
    create(dto: CreateSinhVienDto): Promise<SinhVien>;
    update(id: number, dto: Partial<CreateSinhVienDto>): Promise<SinhVien>;
}
