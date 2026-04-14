import { LopHocPhan } from '../../lop-hoc-phan/entities/lop-hoc-phan.entity';
import { GiangVien } from '../../giang-vien/entities/giang-vien.entity';
export declare class BaiTap {
    id: number;
    lopHocPhan: LopHocPhan;
    lopHocPhanId: number;
    tenBaiTap: string;
    hanNop: Date;
    giangVien: GiangVien;
    giangVienId: number;
    moTa: string;
    fileDinhKem: string;
    ngayTao: Date;
}
