import { Repository } from 'typeorm';
import { GiangVien } from './entities/giang-vien.entity';
import { CreateGiangVienDto } from './dto/create-giang-vien.dto';
export declare class GiangVienService {
    private readonly repo;
    constructor(repo: Repository<GiangVien>);
    findAll(): Promise<GiangVien[]>;
    findOne(id: number): Promise<GiangVien>;
    findByNguoiDung(nguoiDungId: number): Promise<GiangVien>;
    create(dto: CreateGiangVienDto): Promise<GiangVien>;
    update(id: number, dto: Partial<CreateGiangVienDto>): Promise<GiangVien>;
}
