import { DataSource } from 'typeorm';
export declare class AdminSuKienService {
    private dataSource;
    constructor(dataSource: DataSource);
    layDanhSachAdminSuKien(page?: string, limit?: string, search?: string): Promise<{
        thanh_cong: boolean;
        du_lieu: any[];
        tong_so: number;
        tong_so_trang: number;
        trang_hien_tai: number;
        tong_dang_ky: number;
        sap_toi: number;
        thong_bao?: undefined;
    } | {
        thanh_cong: boolean;
        thong_bao: string;
        du_lieu?: undefined;
        tong_so?: undefined;
        tong_so_trang?: undefined;
        trang_hien_tai?: undefined;
        tong_dang_ky?: undefined;
        sap_toi?: undefined;
    }>;
    layDanhSachDangKy(id: string, trangThai?: string): Promise<{
        thanh_cong: boolean;
        du_lieu: any[];
        thong_ke: {
            tong: number;
            xac_nhan: number;
            cho_xet: number;
            huy: number;
        };
        thong_bao?: undefined;
    } | {
        thanh_cong: boolean;
        thong_bao: string;
        du_lieu?: undefined;
        thong_ke?: undefined;
    }>;
    themAdminSuKien(body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    suaAdminSuKien(id: string, body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    xoaAdminSuKien(id: string): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    capNhatTrangThaiDangKy(id: string, body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
}
