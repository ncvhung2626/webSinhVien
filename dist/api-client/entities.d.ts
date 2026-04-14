export declare class VaiTro {
    id: number;
    ten_vai_tro: string;
}
export declare class SinhVien {
    id: number;
    nguoi_dung_id: number;
    mssv: string;
    ho_ten: string;
    lop: string;
    ma_qr: string;
}
export declare class GiangVien {
    id: number;
    nguoi_dung_id: number;
    ho_ten: string;
    bo_mon: string;
}
export declare class NguoiDung {
    id: number;
    email: string;
    mat_khau: string;
    vai_tro_id: number;
    vaiTro: VaiTro;
}
export declare class HocPhan {
    id: number;
    ten_hoc_phan: string;
    so_tin_chi: number;
}
export declare class LopHocPhan {
    id: number;
    hoc_phan_id: number;
    giang_vien_id: number;
    hoc_ky: string;
    si_so_toi_da: number;
    ma_lop: string;
    hocPhan: HocPhan;
    giangVien: GiangVien;
}
export declare class DangKyHoc {
    id: number;
    sinh_vien_id: number;
    lop_hoc_phan_id: number;
    ngay_dang_ky: Date;
}
export declare class LichHoc {
    id: number;
    lop_hoc_phan_id: number;
    thu: number;
    gio_bat_dau: string;
    gio_ket_thuc: string;
    phong: string;
}
export declare class BuoiHoc {
    id: number;
    lop_hoc_phan_id: number;
    ngay_hoc: Date;
    trang_thai: string;
}
export declare class PhienDiemDanh {
    id: number;
    buoi_hoc_id: number;
    ma_qr_phien: string;
    bat_dau: Date;
    ket_thuc: Date;
}
export declare class DiemDanh {
    id: number;
    buoi_hoc_id: number;
    sinh_vien_id: number;
    trang_thai: string;
    thoi_gian: Date;
    hinh_thuc: string;
}
export declare class BaiTap {
    id: number;
    lop_hoc_phan_id: number;
    ten_bai_tap: string;
    han_nop: Date;
    giang_vien_id: number;
    mo_ta: string;
    ngay_tao: Date;
}
export declare class NopBai {
    id: number;
    bai_tap_id: number;
    sinh_vien_id: number;
    ngay_nop: Date;
    trang_thai: string;
}
export declare class DiemRenLuyen {
    id: number;
    sinh_vien_id: number;
    tong_diem: number;
    xep_loai: string;
    hoc_ky: string;
}
export declare class PhanCongGiangDay {
    id: number;
    giang_vien_id: number;
    lop_hoc_phan_id: number;
}
export declare class SuKien {
    id: number;
    ten_su_kien: string;
    mo_ta: string;
    ngay_to_chuc: Date;
    dia_diem: string;
    diem_ren_luyen: number;
}
export declare class PhieuYeuCau {
    id: number;
    sinh_vien_id: number;
    loai_yeu_cau: string;
    noi_dung: string;
    trang_thai: string;
    ngay_tao: Date;
}
