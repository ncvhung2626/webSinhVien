import { Repository } from 'typeorm';
import { DiemDanh } from './entities/diem-danh.entity';
import { PhienDiemDanh } from './entities/phien-diem-danh.entity';
import { TaoPhienDto, QuetQrDto } from './dto/diem-danh.dto';
export declare class DiemDanhService {
    private readonly diemDanhRepo;
    private readonly phienRepo;
    constructor(diemDanhRepo: Repository<DiemDanh>, phienRepo: Repository<PhienDiemDanh>);
    taoPhien(dto: TaoPhienDto): Promise<PhienDiemDanh>;
    dongPhien(phienId: number): Promise<{
        message: string;
    }>;
    quetQr(dto: QuetQrDto): Promise<{
        message: string;
        thoiGian: Date;
    }>;
    findBySinhVien(sinhVienId: number): Promise<DiemDanh[]>;
    findByBuoiHoc(buoiHocId: number): Promise<DiemDanh[]>;
    suaTrangThai(id: number, trangThai: string): Promise<DiemDanh>;
}
