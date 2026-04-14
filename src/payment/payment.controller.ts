// Controller Payment
// API ROUTE : POST /api/payment/tao-url           → tao URL VNPay, luu giao dich DB
//             GET  /api/payment/vnpay-callback     → VNPay redirect ve, cap nhat DB
//             GET  /api/payment/lich-su/:svId      → lich su giao dich cua sinh vien
//             GET  /api/payment/giao-dich/:id      → chi tiet 1 giao dich
import {
  Controller, Post, Get,
  Body, Param, Req, Res, ParseIntPipe,
} from '@nestjs/common';
import { Request, Response } from 'express';
import { PaymentService }    from './payment.service';
import { TaoUrlVnpayDto }    from './dto/payment.dto';

@Controller('api/payment')
export class PaymentController {
  constructor(private readonly paymentService: PaymentService) {}

  // POST /api/payment/tao-url
  @Post('tao-url')
  async taoUrl(@Body() dto: TaoUrlVnpayDto, @Req() req: Request) {
    const ipAddr =
      (req.headers['x-forwarded-for'] as string)?.split(',')[0].trim() ||
      req.socket.remoteAddress ||
      '127.0.0.1';
    return this.paymentService.taoUrlThanhToan(dto, ipAddr);
  }

  // GET /api/payment/vnpay-callback
  // ✅ FIX: Dùng @Req() đọc thẳng req.query thay vì @Query() dto
  // Lý do: NestJS ValidationPipe có thể strip hoặc không map đúng
  // các field như vnp_SecureHash khi dùng typed DTO → thiếu hash → lỗi chữ ký
  @Get('vnpay-callback')
  async vnpayCallback(@Req() req: Request, @Res() res: Response) {
    try {
      // Đọc toàn bộ query params thô từ request, không qua DTO transform
      const query = req.query as Record<string, string>;

      console.log('[VNPAY CALLBACK] raw query:', JSON.stringify(query, null, 2));

      const result = await this.paymentService.xuLyCallback(query);
      if (result.code === '00') {
        return res.redirect('/sinh-vien?tab=lich-su-dang-ky&payment=success');
      }
      return res.redirect(`/sinh-vien?tab=dang-ky-hoc&payment=failed&code=${result.code}`);
    } catch (err) {
      console.error('VNPay callback error:', err.message);
      return res.redirect('/sinh-vien?tab=dang-ky-hoc&payment=failed&code=99');
    }
  }

  // GET /api/payment/lich-su/:svId
  @Get('lich-su/:svId')
  findBySinhVien(@Param('svId', ParseIntPipe) svId: number) {
    return this.paymentService.findBySinhVien(svId);
  }

  // GET /api/payment/giao-dich/:id
  @Get('giao-dich/:id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.paymentService.findOne(id);
  }
}
