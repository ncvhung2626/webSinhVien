import { DataSource } from 'typeorm';
export declare class AdminSinhVienService {
    private dataSource;
    constructor(dataSource: DataSource);
    layDanhSachAdminSinhVien(page?: string, limit?: string, search?: string): Promise<{
        thanh_cong: boolean;
        du_lieu: any[];
        tong_so_sinh_vien: number;
        tong_so_trang: number;
        trang_hien_tai: number;
        thong_bao?: undefined;
    } | {
        thanh_cong: boolean;
        thong_bao: string;
        du_lieu?: undefined;
        tong_so_sinh_vien?: undefined;
        tong_so_trang?: undefined;
        trang_hien_tai?: undefined;
    }>;
    themAdminSinhVien(body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    xoaAdminSinhVien(id: string): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    suaAdminSinhVien(id: string, body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    importAdminSinhVienTuExcel(buffer: Buffer): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
}
