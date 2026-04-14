import { BaiTap } from './bai-tap.entity';
import { SinhVien } from '../../sinh-vien/entities/sinh-vien.entity';
export declare class NopBai {
    id: number;
    baiTap: BaiTap;
    baiTapId: number;
    sinhVien: SinhVien;
    sinhVienId: number;
    mssv: string;
    fileNop: string;
    ghiChu: string;
    ngayNop: Date;
    trangThai: string;
    diem: number;
}
