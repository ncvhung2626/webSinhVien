import {
  Controller, Get, Post, Put, Delete,
  Param, Body, ParseIntPipe,
} from '@nestjs/common';
import { DangKyHocService } from './dang-ky-hoc.service';
import { DangKyHocDto }     from './dto/dang-ky-hoc.dto';

/*
  CONTROLLER: DangKyHocController
  ─────────────────────────────────────────────────────────
  VIEW ROUTES  : không có view riêng
    sinh-vien.html tab "Đăng ký học phần":
      POST /api/dang-ky-hoc → đăng ký học phần đã chọn
    sinh-vien.html tab "Lịch sử đăng ký":
      GET  /api/dang-ky-hoc/sinh-vien/:svId
      Hiển thị: lopHocPhan.hocPhan.tenHocPhan, ngayDangKy, daThanhToan
    giang-vien.html tab "SV Đăng ký":
      GET  /api/dang-ky-hoc/lop/:lopId
      Hiển thị: sinhVien.mssv, sinhVien.hoTen, daThanhToan

  API ROUTES   (JSON ← TypeORM ← dang_ky_hoc)
    GET    /api/dang-ky-hoc/sinh-vien/:svId  → findBySinhVien()
    GET    /api/dang-ky-hoc/lop/:lopId       → findByLopHocPhan()
    POST   /api/dang-ky-hoc                  → dangKyNhieu()
    PUT    /api/dang-ky-hoc/thanh-toan       → capNhatThanhToan()
    DELETE /api/dang-ky-hoc/:id              → huyDangKy()
  ─────────────────────────────────────────────────────────
*/
@Controller('api/dang-ky-hoc')
export class DangKyHocController {
  constructor(private readonly dangKyHocService: DangKyHocService) {}

  @Get('sinh-vien/:svId')
  findBySinhVien(@Param('svId', ParseIntPipe) svId: number) {
    return this.dangKyHocService.findBySinhVien(svId);
  }

  @Get('lop/:lopId')
  findByLop(@Param('lopId', ParseIntPipe) lopId: number) {
    return this.dangKyHocService.findByLopHocPhan(lopId);
  }

  @Post()
  dangKy(@Body() dto: DangKyHocDto) {
    return this.dangKyHocService.dangKyNhieu(dto);
  }

  @Put('thanh-toan')
  capNhatThanhToan(@Body() body: { sinhVienId: number; lopHocPhanIds: number[] }) {
    return this.dangKyHocService.capNhatThanhToan(body.sinhVienId, body.lopHocPhanIds);
  }

  @Delete(':id')
  huyDangKy(@Param('id', ParseIntPipe) id: number) {
    return this.dangKyHocService.huyDangKy(id);
  }
}
