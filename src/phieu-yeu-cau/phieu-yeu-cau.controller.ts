import {
  Controller, Get, Post, Put, Delete,
  Param, Body, ParseIntPipe,
} from '@nestjs/common';
import { PhieuYeuCauService }            from './phieu-yeu-cau.service';
import { TaoPhieuDto, XuLyPhieuDto }     from './dto/phieu-yeu-cau.dto';

@Controller('api/phieu-yeu-cau')
export class PhieuYeuCauController {
  constructor(private readonly phieuYeuCauService: PhieuYeuCauService) {}

  @Get()
  findAll() {
    return this.phieuYeuCauService.findAll();
  }

  @Get('sinh-vien/:svId')
  findBySinhVien(@Param('svId', ParseIntPipe) svId: number) {
    return this.phieuYeuCauService.findBySinhVien(svId);
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.phieuYeuCauService.findOne(id);
  }

  @Post()
  create(@Body() dto: TaoPhieuDto) {
    return this.phieuYeuCauService.create(dto);
  }

  @Put(':id/xu-ly')
  xuLy(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: XuLyPhieuDto,
  ) {
    return this.phieuYeuCauService.xuLy(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.phieuYeuCauService.remove(id);
  }
}
