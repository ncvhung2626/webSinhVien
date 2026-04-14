import { AdminLopHocPhanService } from './lop-hoc-phan.service';
export declare class AdminLopHocPhanController {
    private readonly lopHocPhanService;
    constructor(lopHocPhanService: AdminLopHocPhanService);
    layDanhSachAdminLopHocPhan(page?: string, limit?: string, search?: string): Promise<{
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
    themAdminLopHocPhan(body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    xoaAdminLopHocPhan(id: string): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    suaAdminLopHocPhan(id: string, body: any): Promise<{
        thanh_cong: boolean;
        thong_bao: string;
    }>;
    layDanhSachChoDropdown(): Promise<{
        thanh_cong: boolean;
        hocPhan: any;
        giangVien: any;
        thong_bao?: undefined;
    } | {
        thanh_cong: boolean;
        thong_bao: string;
        hocPhan?: undefined;
        giangVien?: undefined;
    }>;
}
