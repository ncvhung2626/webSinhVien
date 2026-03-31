import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { PhanCongGiangDayService } from './phan-cong-giang-day.service';

@Controller()
export class PhanCongGiangDayController {
  constructor(private readonly phanCongService: PhanCongGiangDayService) {}

  @Get('phan-cong-giang-day')
  async layDanhSachPhanCong(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.phanCongService.layDanhSachPhanCong(page, limit, search);
  }

  @Get('danh-sach-chon-phancong')
  async layDropdownPhanCong() {
    return this.phanCongService.layDropdownPhanCong();
  }

  @Post('phan-cong-giang-day')
  async themPhanCong(@Body() body: any) {
    return this.phanCongService.themPhanCong(body);
  }

  @Put('phan-cong-giang-day/:id')
  async suaPhanCong(@Param('id') id: string, @Body() body: any) {
    return this.phanCongService.suaPhanCong(id, body);
  }

  @Delete('phan-cong-giang-day/:id')
  async xoaPhanCong(@Param('id') id: string) {
    return this.phanCongService.xoaPhanCong(id);
  }
}
