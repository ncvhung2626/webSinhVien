import { AdminAuthService } from './auth.service';
export declare class AdminAuthController {
    private readonly authService;
    constructor(authService: AdminAuthService);
    xuLyDangNhap(duLieuTuClient: any): {
        thanh_cong: boolean;
        thong_bao: string;
    };
}
