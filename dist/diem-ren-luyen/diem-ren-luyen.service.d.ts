import { Repository } from 'typeorm';
import { DiemRenLuyen } from './entities/diem-ren-luyen.entity';
import { LichSuDiemRenLuyen } from './entities/lich-su-drl.entity';
import { CapNhatDrlDto, CongDiemDto } from './dto/diem-ren-luyen.dto';
export declare class DiemRenLuyenService {
    private drlRepo;
    private lichSuRepo;
    constructor(drlRepo: Repository<DiemRenLuyen>, lichSuRepo: Repository<LichSuDiemRenLuyen>);
    findBySinhVien(sinhVienId: number): Promise<DiemRenLuyen[]>;
    findHienTai(sinhVienId: number, hocKy: string): Promise<DiemRenLuyen>;
    findLichSu(sinhVienId: number): Promise<LichSuDiemRenLuyen[]>;
    capNhat(dto: CapNhatDrlDto): Promise<DiemRenLuyen>;
    congDiem(dto: CongDiemDto): Promise<{
        tongDiem: number;
        xepLoai: string;
    }>;
    private tinhXepLoai;
}
