import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { AdminLopHocPhanService } from './lop-hoc-phan.service';

@Controller('api/admin')
export class AdminLopHocPhanController {
  constructor(private readonly lopHocPhanService: AdminLopHocPhanService) {}

  @Get('lop-hoc-phan')
  async layDanhSachAdminLopHocPhan(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.lopHocPhanService.layDanhSachAdminLopHocPhan(page, limit, search);
  }

  @Post('lop-hoc-phan')
  async themAdminLopHocPhan(@Body() body: any) {
    return this.lopHocPhanService.themAdminLopHocPhan(body);
  }

  @Delete('lop-hoc-phan/:id')
  async xoaAdminLopHocPhan(@Param('id') id: string) {
    return this.lopHocPhanService.xoaAdminLopHocPhan(id);
  }

  @Put('lop-hoc-phan/:id')
  async suaAdminLopHocPhan(@Param('id') id: string, @Body() body: any) {
    return this.lopHocPhanService.suaAdminLopHocPhan(id, body);
  }

  @Get('danh-sach-chon')
  async layDanhSachChoDropdown() {
    return this.lopHocPhanService.layDanhSachChoDropdown();
  }
}
