import { Response } from 'express';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/login.dto';
export declare class AuthController {
    private readonly authService;
    constructor(authService: AuthService);
    showLogin(res: Response): void;
    login(dto: LoginDto): Promise<{
        redirectUrl: string;
        accessToken: string;
        vaiTro: string;
        userId: number;
    }>;
    resetPassword(email: string): Promise<{
        success: boolean;
        newPassword: string;
        message?: undefined;
    } | {
        success: boolean;
        message: any;
        newPassword?: undefined;
    }>;
    kiemTraEmail(email: string): Promise<{
        success: boolean;
        message?: undefined;
    } | {
        success: boolean;
        message: any;
    }>;
    datLaiMatKhau(email: string, matKhauMoi: string): Promise<{
        success: boolean;
        message?: undefined;
    } | {
        success: boolean;
        message: any;
    }>;
}
