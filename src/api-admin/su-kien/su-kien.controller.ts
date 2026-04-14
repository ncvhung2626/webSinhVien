import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { AdminSuKienService } from './su-kien.service';

@Controller('api/admin')
export class AdminSuKienController {
  constructor(private readonly suKienService: AdminSuKienService) {}

  @Get('su-kien')
  async layDanhSachAdminSuKien(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.suKienService.layDanhSachAdminSuKien(page, limit, search);
  }

  @Get('su-kien/:id/dang-ky')
  async layDanhSachDangKy(@Param('id') id: string, @Query('trang_thai') trangThai: string = '') {
    return this.suKienService.layDanhSachDangKy(id, trangThai);
  }

  @Post('su-kien')
  async themAdminSuKien(@Body() body: any) {
    return this.suKienService.themAdminSuKien(body);
  }

  @Put('su-kien/:id')
  async suaAdminSuKien(@Param('id') id: string, @Body() body: any) {
    return this.suKienService.suaAdminSuKien(id, body);
  }

  @Delete('su-kien/:id')
  async xoaAdminSuKien(@Param('id') id: string) {
    return this.suKienService.xoaAdminSuKien(id);
  }

  @Put('dang-ky-su-kien/:id/trang-thai')
  async capNhatTrangThaiDangKy(@Param('id') id: string, @Body() body: any) {
    return this.suKienService.capNhatTrangThaiDangKy(id, body);
  }
}
