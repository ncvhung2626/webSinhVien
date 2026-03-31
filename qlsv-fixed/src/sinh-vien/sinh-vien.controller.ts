import {
  Controller, Get, Post, Put,
  Param, Body, ParseIntPipe, Res,
} from '@nestjs/common';
import { Response }          from 'express';
import { join }              from 'path';
import { SinhVienService }   from './sinh-vien.service';
import { CreateSinhVienDto } from './dto/create-sinh-vien.dto';

/*
  CONTROLLER: SinhVienController
  ─────────────────────────────────────────────────────────
  VIEW ROUTES  (render HTML → public/sinh-vien.html)
    GET  /sinh-vien          → sinh-vien.html
      View hiển thị: hoTen, mssv, lop, maQr
      Các tab: Dashboard, Đăng ký học phần, Điểm danh QR,
               Bài tập, Điểm rèn luyện, Sự kiện,
               Lịch sử đăng ký, Phiếu yêu cầu, Thông tin

  API ROUTES   (JSON ← TypeORM ← bảng sinh_vien)
    GET  /api/sinh-vien           → findAll()           danh sách tất cả SV
    GET  /api/sinh-vien/me/:uid   → findByNguoiDung()   SV theo nguoi_dung_id
    GET  /api/sinh-vien/:id       → findOne()           chi tiết 1 SV
    POST /api/sinh-vien           → create()            tạo SV mới
    PUT  /api/sinh-vien/:id       → update()            cập nhật SV
  ─────────────────────────────────────────────────────────
*/
@Controller()
export class SinhVienController {
  constructor(private readonly sinhVienService: SinhVienService) {}

  // ── VIEW ─────────────────────────────────────────────
  @Get('sinh-vien')
  showView(@Res() res: Response) {
    res.sendFile(join(__dirname, '..', '..', 'public', 'sinh-vien.html'));
  }

  // ── API ──────────────────────────────────────────────
  @Get('api/sinh-vien')
  findAll() {
    return this.sinhVienService.findAll();
  }

  @Get('api/sinh-vien/me/:uid')
  findMe(@Param('uid', ParseIntPipe) uid: number) {
    return this.sinhVienService.findByNguoiDung(uid);
  }

  @Get('api/sinh-vien/:id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.sinhVienService.findOne(id);
  }

  @Post('api/sinh-vien')
  create(@Body() dto: CreateSinhVienDto) {
    return this.sinhVienService.create(dto);
  }

  @Put('api/sinh-vien/:id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: Partial<CreateSinhVienDto>,
  ) {
    return this.sinhVienService.update(id, dto);
  }
}
