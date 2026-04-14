import { DiemRenLuyenService } from './diem-ren-luyen.service';
import { CapNhatDrlDto, CongDiemDto } from './dto/diem-ren-luyen.dto';
export declare class DiemRenLuyenController {
    private readonly diemRenLuyenService;
    constructor(diemRenLuyenService: DiemRenLuyenService);
    findBySinhVien(svId: number): Promise<import("./entities/diem-ren-luyen.entity").DiemRenLuyen[]>;
    findLichSu(svId: number): Promise<import("./entities/lich-su-drl.entity").LichSuDiemRenLuyen[]>;
    capNhat(dto: CapNhatDrlDto): Promise<import("./entities/diem-ren-luyen.entity").DiemRenLuyen>;
    congDiem(dto: CongDiemDto): Promise<{
        tongDiem: number;
        xepLoai: string;
    }>;
}
