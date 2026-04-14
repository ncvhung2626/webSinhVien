import { Controller, Get, Post, Put, Delete, Body, Param, Query } from '@nestjs/common';
import { AdminPhanCongGiangDayService } from './phan-cong-giang-day.service';

@Controller('api/admin')
export class AdminPhanCongGiangDayController {
  constructor(private readonly adminPhanCongService: AdminPhanCongGiangDayService) {}

  @Get('phan-cong-giang-day')
  async layDanhSachPhanCong(@Query('page') page: string = '1', @Query('limit') limit: string = '10', @Query('search') search: string = '') {
    return this.adminPhanCongService.layDanhSachPhanCong(page, limit, search);
  }

  @Get('danh-sach-chon-phancong')
  async layDropdownPhanCong() {
    return this.adminPhanCongService.layDropdownPhanCong();
  }

  @Post('phan-cong-giang-day')
  async themPhanCong(@Body() body: any) {
    return this.adminPhanCongService.themPhanCong(body);
  }

  @Put('phan-cong-giang-day/:id')
  async suaPhanCong(@Param('id') id: string, @Body() body: any) {
    return this.adminPhanCongService.suaPhanCong(id, body);
  }

  @Delete('phan-cong-giang-day/:id')
  async xoaPhanCong(@Param('id') id: string) {
    return this.adminPhanCongService.xoaPhanCong(id);
  }
}
