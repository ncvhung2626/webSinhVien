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

  // ── Quên mật khẩu – Bước 1: kiểm tra email ──
  @Post('api/auth/quen-mat-khau/kiem-tra-email')
  @HttpCode(HttpStatus.OK)
  async kiemTraEmail(@Body('email') email: string) {
    try {
      await this.authService.kiemTraEmail(email);
      return { success: true };
    } catch (e) {
      return { success: false, message: e.message };
    }
  }

  // ── Quên mật khẩu – Bước 2: đặt lại mật khẩu mới ──
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
      await this.authService.datLaiMatKhau(email, matKhauMoi);
      return { success: true };
    } catch (e) {
      return { success: false, message: e.message };
    }
  }
}
