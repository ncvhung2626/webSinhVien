import { AdminGiangVienService } from './giang-vien.service';
export declare class AdminGiangVienController {
    private readonly giangVienService;
    constructor(giangVienService: AdminGiangVienService);
    layDanhSachAdminGiangVien(page?: string, limit?: string, search?: string): Promise<{
        thanh_cong: boolean;
        du_lieu: any[];
        tong_so_trang: number;
        trang_hien_tai: number;
        thong_bao?: undefined;
    } | {
        thanh_cong: boolean;
        thong_bao: string;
        du_lieu?: undefined;
        tong_so_trang?: undefined;
        trang_hien_tai?: undefined;
    }>;
    themAdminGiangVien(body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    xoaAdminGiangVien(id: string): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    suaAdminGiangVien(id: string, body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
}
