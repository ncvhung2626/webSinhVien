import { SinhVien } from '../../sinh-vien/entities/sinh-vien.entity';
import { LopHocPhan } from '../../lop-hoc-phan/entities/lop-hoc-phan.entity';
export declare class DangKyHoc {
    id: number;
    sinhVien: SinhVien;
    sinhVienId: number;
    lopHocPhan: LopHocPhan;
    lopHocPhanId: number;
    ngayDangKy: Date;
    daThanhToan: boolean;
}
