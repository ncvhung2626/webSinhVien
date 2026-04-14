import { Repository } from 'typeorm';
import { JwtService } from '@nestjs/jwt';
import { NguoiDung } from './entities/nguoi-dung.entity';
import { LoginDto } from './dto/login.dto';
export declare class AuthService {
    private nguoiDungRepo;
    private jwtService;
    constructor(nguoiDungRepo: Repository<NguoiDung>, jwtService: JwtService);
    login(dto: LoginDto): Promise<{
        accessToken: string;
        vaiTro: string;
        userId: number;
    }>;
    verifyToken(token: string): any;
    resetPassword(email: string): Promise<string>;
    kiemTraEmail(email: string): Promise<void>;
    datLaiMatKhau(email: string, matKhauMoi: string): Promise<void>;
}
