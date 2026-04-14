import { SinhVien } from '../../sinh-vien/entities/sinh-vien.entity';
import { ChiTietThanhToan } from './chi-tiet-thanh-toan.entity';
export declare class GiaoDichThanhToan {
    id: number;
    sinhVien: SinhVien;
    sinhVienId: number;
    maGiaoDich: string;
    maGiaoDichVnpay: string;
    soTien: number;
    noiDung: string;
    trangThai: string;
    maPhanHoi: string;
    maNganHang: string;
    thoiGianTao: Date;
    thoiGianCapNhat: Date;
    chiTiet: ChiTietThanhToan[];
}
