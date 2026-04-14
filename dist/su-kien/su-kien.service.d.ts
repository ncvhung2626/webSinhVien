import { Repository } from 'typeorm';
import { SuKien } from './entities/su-kien.entity';
import { DangKySuKien } from './entities/dang-ky-su-kien.entity';
import { CreateSuKienDto, DangKySuKienDto } from './dto/su-kien.dto';
import { DiemRenLuyenService } from '../diem-ren-luyen/diem-ren-luyen.service';
export declare class SuKienService {
    private suKienRepo;
    private dangKyRepo;
    private diemRenLuyenService;
    constructor(suKienRepo: Repository<SuKien>, dangKyRepo: Repository<DangKySuKien>, diemRenLuyenService: DiemRenLuyenService);
    findAll(): Promise<SuKien[]>;
    findOne(id: number): Promise<SuKien>;
    findBySinhVien(sinhVienId: number): Promise<DangKySuKien[]>;
    findDanhSachDangKy(suKienId: number): Promise<DangKySuKien[]>;
    create(dto: CreateSuKienDto): Promise<SuKien>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
    dangKy(dto: DangKySuKienDto): Promise<{
        message: string;
    }>;
    huyDangKy(id: number): Promise<import("typeorm").DeleteResult>;
}
