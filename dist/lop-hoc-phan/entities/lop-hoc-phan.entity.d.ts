import { HocPhan } from '../../hoc-phan/entities/hoc-phan.entity';
import { GiangVien } from '../../giang-vien/entities/giang-vien.entity';
export declare class LopHocPhan {
    id: number;
    hocPhan: HocPhan;
    hocPhanId: number;
    giangVien: GiangVien;
    giangVienId: number;
    hocKy: string;
}
