import { DiemDanhService } from './diem-danh.service';
import { TaoPhienDto, QuetQrDto } from './dto/diem-danh.dto';
export declare class DiemDanhController {
    private readonly diemDanhService;
    constructor(diemDanhService: DiemDanhService);
    taoPhien(dto: TaoPhienDto): Promise<import("./entities/phien-diem-danh.entity").PhienDiemDanh>;
    dongPhien(id: number): Promise<{
        message: string;
    }>;
    quetQr(dto: QuetQrDto): Promise<{
        message: string;
        thoiGian: Date;
    }>;
    findBySinhVien(svId: number): Promise<import("./entities/diem-danh.entity").DiemDanh[]>;
    findByBuoiHoc(buoiId: number): Promise<import("./entities/diem-danh.entity").DiemDanh[]>;
    suaTrangThai(id: number, trangThai: string): Promise<import("./entities/diem-danh.entity").DiemDanh>;
}
