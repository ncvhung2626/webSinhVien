import { Controller, Get } from '@nestjs/common';
import { DataSource } from 'typeorm';

@Controller()
export class AppController {
  constructor(private dataSource: DataSource) {}

  @Get('kiem-tra-db')
  async kiemTraKetNoi() {
    try {
      const thoiGianDB = await this.dataSource.query('SELECT NOW()');
      return {
        trang_thai: '🟢 KẾT NỐI POSTGRESQL THÀNH CÔNG!',
        thoi_gian_tu_database: thoiGianDB,
      };
    } catch (error: any) {
      return {
        trang_thai: '🔴 KẾT NỐI THẤT BẠI!',
        chi_tiet_loi: error.message,
      };
    }
  }
}
