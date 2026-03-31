import { Controller, Post, Body } from '@nestjs/common';
import { AuthService } from './auth.service';

@Controller()
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('login')
  xuLyDangNhap(@Body() duLieuTuClient: any) {
    return this.authService.xuLyDangNhap(duLieuTuClient);
  }
}
