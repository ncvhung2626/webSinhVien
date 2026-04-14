import { Repository } from 'typeorm';
import { GiaoDichThanhToan } from './entities/giao-dich-thanh-toan.entity';
import { ChiTietThanhToan } from './entities/chi-tiet-thanh-toan.entity';
import { TaoUrlVnpayDto } from './dto/payment.dto';
import { DangKyHocService } from '../dang-ky-hoc/dang-ky-hoc.service';
export declare class PaymentService {
    private giaoDichRepo;
    private chiTietRepo;
    private dangKyHocService;
    private readonly vnp_TmnCode;
    private readonly vnp_HashSecret;
    private readonly vnp_Url;
    private readonly vnp_ReturnUrl;
    constructor(giaoDichRepo: Repository<GiaoDichThanhToan>, chiTietRepo: Repository<ChiTietThanhToan>, dangKyHocService: DangKyHocService);
    taoUrlThanhToan(dto: TaoUrlVnpayDto, ipAddr: string): Promise<{
        payUrl: string;
        maGiaoDich: string;
        giaoDichId: number;
    }>;
    xuLyCallback(query: Record<string, string>): Promise<{
        code: string;
        message: string;
    }>;
    findBySinhVien(sinhVienId: number): Promise<GiaoDichThanhToan[]>;
    findOne(id: number): Promise<GiaoDichThanhToan>;
    private buildVnpayUrl;
    private sortObject;
    private formatDate;
}
