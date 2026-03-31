import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { GiangVienService } from './giang-vien.service';

@Controller('giang-vien')
export class GiangVienController {
  constructor(private readonly giangVienService: GiangVienService) {}

  @Get()
  async layDanhSachGiangVien(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.giangVienService.layDanhSachGiangVien(page, limit, search);
  }

  @Post()
  async themGiangVien(@Body() body: any) {
    return this.giangVienService.themGiangVien(body);
  }

  @Delete(':id')
  async xoaGiangVien(@Param('id') id: string) {
    return this.giangVienService.xoaGiangVien(id);
  }

  @Put(':id')
  async suaGiangVien(@Param('id') id: string, @Body() body: any) {
    return this.giangVienService.suaGiangVien(id, body);
  }
}
