import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { SuKienService } from './su-kien.service';

@Controller()
export class SuKienController {
  constructor(private readonly suKienService: SuKienService) {}

  @Get('su-kien')
  async layDanhSachSuKien(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.suKienService.layDanhSachSuKien(page, limit, search);
  }

  @Get('su-kien/:id/dang-ky')
  async layDanhSachDangKy(@Param('id') id: string, @Query('trang_thai') trangThai: string = '') {
    return this.suKienService.layDanhSachDangKy(id, trangThai);
  }

  @Post('su-kien')
  async themSuKien(@Body() body: any) {
    return this.suKienService.themSuKien(body);
  }

  @Put('su-kien/:id')
  async suaSuKien(@Param('id') id: string, @Body() body: any) {
    return this.suKienService.suaSuKien(id, body);
  }

  @Delete('su-kien/:id')
  async xoaSuKien(@Param('id') id: string) {
    return this.suKienService.xoaSuKien(id);
  }

  @Put('dang-ky-su-kien/:id/trang-thai')
  async capNhatTrangThaiDangKy(@Param('id') id: string, @Body() body: any) {
    return this.suKienService.capNhatTrangThaiDangKy(id, body);
  }
}
