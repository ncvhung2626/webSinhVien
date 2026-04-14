import { Controller, Post, Get, Body, UseGuards, Request } from '@nestjs/common';
import { AuthService } from './auth.service';
import { JwtAuthGuard } from './jwt.guard';
@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}
  @Post('login')
  login(@Body() body: { email: string; mat_khau: string }) { return this.authService.login(body.email, body.mat_khau); }
  @Get('me') @UseGuards(JwtAuthGuard)
  getMe(@Request() req) { return this.authService.getMe(req.user.id); }
}
