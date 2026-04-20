import { Controller, Post, Get, Body, Res, HttpCode, HttpStatus } from '@nestjs/common';
import { Response }      from 'express';
import { join }          from 'path';
import { AuthService }   from './auth.service';
import { LoginDto }      from './dto/login.dto';

@Controller()
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Get()
  showLogin(@Res() res: Response) {
    res.sendFile(join(__dirname, '..', '..', 'public', 'index.html'));
  }

  @Post('api/auth/login')
  @HttpCode(HttpStatus.OK)
  async login(@Body() dto: LoginDto) {
    const result = await this.authService.login(dto);
    return {
      ...result,
      redirectUrl: result.vaiTro === 'GIANG_VIEN' || result.vaiTro === 'giang_vien'
        ? '/giang-vien'
        : '/sinh-vien',
    };
  }

  // Giữ lại API cũ
  @Post('api/auth/reset-password')
  @HttpCode(HttpStatus.OK)
  async resetPassword(@Body('email') email: string) {
    try {
      const newPass = await this.authService.resetPassword(email);
      return { success: true, newPassword: newPass };
    } catch (e) {
      return { success: false, message: e.message };
    }
  }

  // ══════════════════════════════════════════════════════
  //  QUÊN MẬT KHẨU VỚI OTP (3 bước)
  // ══════════════════════════════════════════════════════

  /**
   * Bước 1: Kiểm tra email + Tạo OTP → trả về otpCode để frontend gửi email qua EmailJS
   * POST /api/auth/quen-mat-khau/forgot-password
   */
  @Post('api/auth/quen-mat-khau/forgot-password')
  @HttpCode(HttpStatus.OK)
  async forgotPassword(@Body('email') email: string) {
    try {
      const result = await this.authService.forgotPassword(email);
      return result;
    } catch (e) {
      return { success: false, message: e.message };
    }
  }

  /**
   * Bước 2: Xác thực OTP
   * POST /api/auth/quen-mat-khau/verify-otp
   */
  @Post('api/auth/quen-mat-khau/verify-otp')
  @HttpCode(HttpStatus.OK)
  async verifyOtp(
    @Body('email')   email: string,
    @Body('otpCode') otpCode: string,
  ) {
    try {
      const result = await this.authService.verifyOtp(email, otpCode);
      return result;
    } catch (e) {
      return { success: false, message: e.message };
    }
  }

  /**
   * Bước 3: Đặt lại mật khẩu mới (sau khi OTP verified)
   * POST /api/auth/quen-mat-khau/dat-lai
   */
  @Post('api/auth/quen-mat-khau/dat-lai')
  @HttpCode(HttpStatus.OK)
  async datLaiMatKhau(
    @Body('email')      email: string,
    @Body('matKhauMoi') matKhauMoi: string,
  ) {
    try {
      if (!matKhauMoi || matKhauMoi.length < 6) {
        return { success: false, message: 'Mật khẩu phải có ít nhất 6 ký tự' };
      }
      const result = await this.authService.datLaiMatKhauVoiOtp(email, matKhauMoi);
      return result;
    } catch (e) {
      return { success: false, message: e.message };
    }
  }

  // Giữ lại API kiểm tra email cũ (backward compatible)
  @Post('api/auth/quen-mat-khau/kiem-tra-email')
  @HttpCode(HttpStatus.OK)
  async kiemTraEmail(@Body('email') email: string) {
    try {
      // Dùng forgotPassword luôn, vì nó cũng kiểm tra email
      const result = await this.authService.forgotPassword(email);
      return result;
    } catch (e) {
      return { success: false, message: e.message };
    }
  }
}
