import { DataSource } from 'typeorm';
export declare class AdminPhanCongGiangDayService {
    private dataSource;
    constructor(dataSource: DataSource);
    layDanhSachPhanCong(page?: string, limit?: string, search?: string): Promise<{
        thanh_cong: boolean;
        du_lieu: any[];
        tong_so: number;
        tong_so_trang: number;
        trang_hien_tai: number;
        so_giang_vien: any;
        so_lop: any;
        thong_bao?: undefined;
    } | {
        thanh_cong: boolean;
        thong_bao: string;
        du_lieu?: undefined;
        tong_so?: undefined;
        tong_so_trang?: undefined;
        trang_hien_tai?: undefined;
        so_giang_vien?: undefined;
        so_lop?: undefined;
    }>;
    layDropdownPhanCong(): Promise<{
        thanh_cong: boolean;
        giangVien: any;
        lopHocPhan: any;
        thong_bao?: undefined;
    } | {
        thanh_cong: boolean;
        thong_bao: string;
        giangVien?: undefined;
        lopHocPhan?: undefined;
    }>;
    themPhanCong(body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    suaPhanCong(id: string, body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    xoaPhanCong(id: string): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
}
