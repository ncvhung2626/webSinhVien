import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { AdminGiangVienService } from './giang-vien.service';

@Controller('api/admin/giang-vien')
export class AdminGiangVienController {
  constructor(private readonly giangVienService: AdminGiangVienService) {}

  @Get()
  async layDanhSachAdminGiangVien(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.giangVienService.layDanhSachAdminGiangVien(page, limit, search);
  }

  @Post()
  async themAdminGiangVien(@Body() body: any) {
    return this.giangVienService.themAdminGiangVien(body);
  }

  @Delete(':id')
  async xoaAdminGiangVien(@Param('id') id: string) {
    return this.giangVienService.xoaAdminGiangVien(id);
  }

  @Put(':id')
  async suaAdminGiangVien(@Param('id') id: string, @Body() body: any) {
    return this.giangVienService.suaAdminGiangVien(id, body);
  }
}
