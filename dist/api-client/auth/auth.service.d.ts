import { Repository } from "typeorm";
import { JwtService } from "@nestjs/jwt";
import { NguoiDung, SinhVien, GiangVien } from "../entities";
export declare class AuthService {
    private nguoiDungRepo;
    private sinhVienRepo;
    private giangVienRepo;
    private jwtService;
    constructor(nguoiDungRepo: Repository<NguoiDung>, sinhVienRepo: Repository<SinhVien>, giangVienRepo: Repository<GiangVien>, jwtService: JwtService);
    login(email: string, matKhau: string): Promise<{
        access_token: string;
        vaiTro: string;
        profileId: any;
        hoTen: string;
        email: string;
    }>;
    getMe(userId: number): Promise<NguoiDung>;
}
