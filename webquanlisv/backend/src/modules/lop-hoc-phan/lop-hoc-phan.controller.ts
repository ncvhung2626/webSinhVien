import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { LopHocPhanService } from './lop-hoc-phan.service';

@Controller()
export class LopHocPhanController {
  constructor(private readonly lopHocPhanService: LopHocPhanService) {}

  @Get('lop-hoc-phan')
  async layDanhSachLopHocPhan(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.lopHocPhanService.layDanhSachLopHocPhan(page, limit, search);
  }

  @Post('lop-hoc-phan')
  async themLopHocPhan(@Body() body: any) {
    return this.lopHocPhanService.themLopHocPhan(body);
  }

  @Delete('lop-hoc-phan/:id')
  async xoaLopHocPhan(@Param('id') id: string) {
    return this.lopHocPhanService.xoaLopHocPhan(id);
  }

  @Put('lop-hoc-phan/:id')
  async suaLopHocPhan(@Param('id') id: string, @Body() body: any) {
    return this.lopHocPhanService.suaLopHocPhan(id, body);
  }

  @Get('danh-sach-chon')
  async layDanhSachChoDropdown() {
    return this.lopHocPhanService.layDanhSachChoDropdown();
  }
}
