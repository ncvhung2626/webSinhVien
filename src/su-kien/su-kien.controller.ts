import {
  Controller, Get, Post, Delete,
  Param, Body, ParseIntPipe,
} from '@nestjs/common';
import { SuKienService }                    from './su-kien.service';
import { CreateSuKienDto, DangKySuKienDto } from './dto/su-kien.dto';

@Controller('api/su-kien')
export class SuKienController {
  constructor(private readonly suKienService: SuKienService) {}

  @Get()
  findAll() {
    return this.suKienService.findAll();
  }

  @Get('sinh-vien/:svId')
  findBySinhVien(@Param('svId', ParseIntPipe) svId: number) {
    return this.suKienService.findBySinhVien(svId);
  }

  @Get(':id/dang-ky')
  findDanhSachDangKy(@Param('id', ParseIntPipe) id: number) {
    return this.suKienService.findDanhSachDangKy(id);
  }

  @Post('dang-ky')
  dangKy(@Body() dto: DangKySuKienDto) {
    return this.suKienService.dangKy(dto);
  }

  @Delete('dang-ky/:id')
  huyDangKy(@Param('id', ParseIntPipe) id: number) {
    return this.suKienService.huyDangKy(id);
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.suKienService.findOne(id);
  }

  @Post()
  create(@Body() dto: CreateSuKienDto) {
    return this.suKienService.create(dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.suKienService.remove(id);
  }
}
