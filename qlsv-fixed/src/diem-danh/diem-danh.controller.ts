import {
  Controller, Get, Post, Put,
  Param, Body, ParseIntPipe,
} from '@nestjs/common';
import { DiemDanhService }        from './diem-danh.service';
import { TaoPhienDto, QuetQrDto } from './dto/diem-danh.dto';

/*
  CONTROLLER: DiemDanhController
  ─────────────────────────────────────────────────────────
  VIEW ROUTES  : không có view riêng
    giang-vien.html tab "Tạo QR Điểm Danh":
      POST /api/diem-danh/phien → nhận { maQrSession, thoiGianHetHan }
      → frontend dùng QRCode.js render canvas từ maQrSession
      → hiển thị countdown thoiGianHetHan
    sinh-vien.html tab "Điểm Danh QR":
      POST /api/diem-danh/quet-qr → SV gửi maQrSession quét được
      GET  /api/diem-danh/sinh-vien/:svId → lịch sử điểm danh
      Hiển thị: trangThai (co_mat/vang_mat), thoiGian, hinhThuc
    giang-vien.html tab "Quản lý Điểm Danh":
      GET  /api/diem-danh/buoi/:buoiId → DS SV + trangThai
      PUT  /api/diem-danh/:id/trang-thai → đổi trạng thái thủ công

  API ROUTES   (JSON ← TypeORM ← phien_diem_danh, diem_danh)
    POST /api/diem-danh/phien              → taoPhien()
    PUT  /api/diem-danh/phien/:id/dong     → dongPhien()
    POST /api/diem-danh/quet-qr            → quetQr()
    GET  /api/diem-danh/sinh-vien/:svId    → findBySinhVien()
    GET  /api/diem-danh/buoi/:buoiId       → findByBuoiHoc()
    PUT  /api/diem-danh/:id/trang-thai     → suaTrangThai()
  ─────────────────────────────────────────────────────────
*/
@Controller('api/diem-danh')
export class DiemDanhController {
  constructor(private readonly diemDanhService: DiemDanhService) {}

  @Post('phien')
  taoPhien(@Body() dto: TaoPhienDto) {
    return this.diemDanhService.taoPhien(dto);
  }

  @Put('phien/:id/dong')
  dongPhien(@Param('id', ParseIntPipe) id: number) {
    return this.diemDanhService.dongPhien(id);
  }

  @Post('quet-qr')
  quetQr(@Body() dto: QuetQrDto) {
    return this.diemDanhService.quetQr(dto);
  }

  @Get('sinh-vien/:svId')
  findBySinhVien(@Param('svId', ParseIntPipe) svId: number) {
    return this.diemDanhService.findBySinhVien(svId);
  }

  @Get('buoi/:buoiId')
  findByBuoiHoc(@Param('buoiId', ParseIntPipe) buoiId: number) {
    return this.diemDanhService.findByBuoiHoc(buoiId);
  }

  @Put(':id/trang-thai')
  suaTrangThai(
    @Param('id', ParseIntPipe) id: number,
    @Body('trangThai') trangThai: string,
  ) {
    return this.diemDanhService.suaTrangThai(id, trangThai);
  }
}
