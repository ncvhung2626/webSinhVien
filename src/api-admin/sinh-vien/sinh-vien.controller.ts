import { Controller, Get, Post, Put, Delete, Body, Param, Query, UseInterceptors, UploadedFile } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { AdminSinhVienService } from './sinh-vien.service';

@Controller('api/admin/sinh-vien')
export class AdminSinhVienController {
  constructor(private readonly sinhVienService: AdminSinhVienService) {}

  @Get()
  async layDanhSachAdminSinhVien(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.sinhVienService.layDanhSachAdminSinhVien(page, limit, search);
  }

  @Post()
  async themAdminSinhVien(@Body() body: any) {
    return this.sinhVienService.themAdminSinhVien(body);
  }

  @Post('import')
  @UseInterceptors(FileInterceptor('file'))
  async importAdminSinhVienTuExcel(@UploadedFile() file: any) {
    if (!file) {
      return { thanh_cong: false, thong_bao: 'Không tìm thấy file upload!' };
    }
    return this.sinhVienService.importAdminSinhVienTuExcel(file.buffer);
  }

  @Delete(':id')
  async xoaAdminSinhVien(@Param('id') id: string) {
    return this.sinhVienService.xoaAdminSinhVien(id);
  }

  @Put(':id')
  async suaAdminSinhVien(@Param('id') id: string, @Body() body: any) {
    return this.sinhVienService.suaAdminSinhVien(id, body);
  }
}
