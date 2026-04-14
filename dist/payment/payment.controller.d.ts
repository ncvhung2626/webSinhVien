import { Request, Response } from 'express';
import { PaymentService } from './payment.service';
import { TaoUrlVnpayDto } from './dto/payment.dto';
export declare class PaymentController {
    private readonly paymentService;
    constructor(paymentService: PaymentService);
    taoUrl(dto: TaoUrlVnpayDto, req: Request): Promise<{
        payUrl: string;
        maGiaoDich: string;
        giaoDichId: number;
    }>;
    vnpayCallback(req: Request, res: Response): Promise<void>;
    findBySinhVien(svId: number): Promise<import("./entities/giao-dich-thanh-toan.entity").GiaoDichThanhToan[]>;
    findOne(id: number): Promise<import("./entities/giao-dich-thanh-toan.entity").GiaoDichThanhToan>;
}
