import { SuKien } from './su-kien.entity';
import { SinhVien } from '../../sinh-vien/entities/sinh-vien.entity';
export declare class DangKySuKien {
    id: number;
    suKien: SuKien;
    suKienId: number;
    sinhVien: SinhVien;
    sinhVienId: number;
    trangThai: string;
    thoiGianDangKy: Date;
}
