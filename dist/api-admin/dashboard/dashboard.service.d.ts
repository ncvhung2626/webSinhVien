import { DataSource } from 'typeorm';
export declare class AdminDashboardService {
    private dataSource;
    constructor(dataSource: DataSource);
    layDuLieuAdminDashboard(): Promise<{
        thanh_cong: boolean;
        the_thong_ke: {
            tong_sinh_vien: any;
            tong_giang_vien: any;
            tong_lop_hoc: any;
            tong_su_kien: any;
        };
        diem_danh: any;
        nop_bai: any;
        top_sinh_vien: any;
        thong_bao?: undefined;
        chi_tiet?: undefined;
    } | {
        thanh_cong: boolean;
        thong_bao: string;
        chi_tiet: any;
        the_thong_ke?: undefined;
        diem_danh?: undefined;
        nop_bai?: undefined;
        top_sinh_vien?: undefined;
    }>;
}
