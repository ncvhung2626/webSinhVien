import { Controller, Get, Post, Put, Delete, Body, Param, Query, UseInterceptors, UploadedFile } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { SinhVienService } from './sinh-vien.service';

@Controller('sinh-vien')
export class SinhVienController {
  constructor(private readonly sinhVienService: SinhVienService) {}

  @Get()
  async layDanhSachSinhVien(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.sinhVienService.layDanhSachSinhVien(page, limit, search);
  }

  @Post()
  async themSinhVien(@Body() body: any) {
    return this.sinhVienService.themSinhVien(body);
  }

  @Post('import')
  @UseInterceptors(FileInterceptor('file'))
  async importSinhVienTuExcel(@UploadedFile() file: any) {
    if (!file) {
      return { thanh_cong: false, thong_bao: 'Không tìm thấy file upload!' };
    }
    return this.sinhVienService.importSinhVienTuExcel(file.buffer);
  }

  @Delete(':id')
  async xoaSinhVien(@Param('id') id: string) {
    return this.sinhVienService.xoaSinhVien(id);
  }

  @Put(':id')
  async suaSinhVien(@Param('id') id: string, @Body() body: any) {
    return this.sinhVienService.suaSinhVien(id, body);
  }
}
