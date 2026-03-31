import {
  Controller, Get, Post, Put,
  Param, Body, ParseIntPipe, Res,
} from '@nestjs/common';
import { Response }           from 'express';
import { join }               from 'path';
import { GiangVienService }   from './giang-vien.service';
import { CreateGiangVienDto } from './dto/create-giang-vien.dto';

/*
  CONTROLLER: GiangVienController
  ─────────────────────────────────────────────────────────
  VIEW ROUTES  (render HTML → public/giang-vien.html)
    GET  /giang-vien         → giang-vien.html
      View hiển thị: hoTen, boMon (sidebar + thông tin cá nhân)
      Các tab: Dashboard, Lớp học phần, SV Đăng ký,
               Tạo QR điểm danh, Quản lý điểm danh,
               Quản lý bài tập, Bài tập đã nộp,
               Sự kiện, Phiếu yêu cầu, Thông tin

  API ROUTES   (JSON ← TypeORM ← bảng giang_vien)
    GET  /api/giang-vien           → findAll()           danh sách GV
    GET  /api/giang-vien/me/:uid   → findByNguoiDung()   GV theo nguoi_dung_id
    GET  /api/giang-vien/:id       → findOne()           chi tiết 1 GV
    POST /api/giang-vien           → create()            tạo GV mới
    PUT  /api/giang-vien/:id       → update()            cập nhật GV
  ─────────────────────────────────────────────────────────
*/
@Controller()
export class GiangVienController {
  constructor(private readonly giangVienService: GiangVienService) {}

  // ── VIEW ─────────────────────────────────────────────
  @Get('giang-vien')
  showView(@Res() res: Response) {
    res.sendFile(join(__dirname, '..', '..', 'public', 'giang-vien.html'));
  }

  // ── API ──────────────────────────────────────────────
  @Get('api/giang-vien')
  findAll() {
    return this.giangVienService.findAll();
  }

  @Get('api/giang-vien/me/:uid')
  findMe(@Param('uid', ParseIntPipe) uid: number) {
    return this.giangVienService.findByNguoiDung(uid);
  }

  @Get('api/giang-vien/:id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.giangVienService.findOne(id);
  }

  @Post('api/giang-vien')
  create(@Body() dto: CreateGiangVienDto) {
    return this.giangVienService.create(dto);
  }

  @Put('api/giang-vien/:id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: Partial<CreateGiangVienDto>,
  ) {
    return this.giangVienService.update(id, dto);
  }
}
