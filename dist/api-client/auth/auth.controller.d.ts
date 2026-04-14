import { AuthService } from './auth.service';
export declare class AuthController {
    private authService;
    constructor(authService: AuthService);
    login(body: {
        email: string;
        mat_khau: string;
    }): Promise<{
        access_token: string;
        vaiTro: string;
        profileId: any;
        hoTen: string;
        email: string;
    }>;
    getMe(req: any): Promise<import("../entities").NguoiDung>;
}
