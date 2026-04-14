import { Controller, Post, Body } from '@nestjs/common';
import { AdminAuthService } from './auth.service';

@Controller('api/admin')
export class AdminAuthController {
  constructor(private readonly authService: AdminAuthService) {}

  @Post('login')
  xuLyDangNhap(@Body() duLieuTuClient: any) {
    return this.authService.xuLyDangNhap(duLieuTuClient);
  }
}
