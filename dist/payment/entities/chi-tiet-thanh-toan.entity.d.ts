import { GiaoDichThanhToan } from './giao-dich-thanh-toan.entity';
import { LopHocPhan } from '../../lop-hoc-phan/entities/lop-hoc-phan.entity';
import { DangKyHoc } from '../../dang-ky-hoc/entities/dang-ky-hoc.entity';
export declare class ChiTietThanhToan {
    id: number;
    giaoDich: GiaoDichThanhToan;
    giaoDichId: number;
    dangKyHoc: DangKyHoc;
    dangKyHocId: number;
    lopHocPhan: LopHocPhan;
    lopHocPhanId: number;
    soTinChi: number;
    donGiaTinChi: number;
    thanhTien: number;
}
