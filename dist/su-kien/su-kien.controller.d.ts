import { SuKienService } from './su-kien.service';
import { CreateSuKienDto, DangKySuKienDto } from './dto/su-kien.dto';
export declare class SuKienController {
    private readonly suKienService;
    constructor(suKienService: SuKienService);
    findAll(): Promise<import("./entities/su-kien.entity").SuKien[]>;
    findBySinhVien(svId: number): Promise<import("./entities/dang-ky-su-kien.entity").DangKySuKien[]>;
    findDanhSachDangKy(id: number): Promise<import("./entities/dang-ky-su-kien.entity").DangKySuKien[]>;
    dangKy(dto: DangKySuKienDto): Promise<{
        message: string;
    }>;
    huyDangKy(id: number): Promise<import("typeorm").DeleteResult>;
    findOne(id: number): Promise<import("./entities/su-kien.entity").SuKien>;
    create(dto: CreateSuKienDto): Promise<import("./entities/su-kien.entity").SuKien>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
}
