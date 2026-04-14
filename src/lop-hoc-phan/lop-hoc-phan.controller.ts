import {
  Controller, Get, Post, Put, Delete,
  Param, Body, ParseIntPipe,
} from '@nestjs/common';
import { LopHocPhanService }   from './lop-hoc-phan.service';
import { CreateLopHocPhanDto } from './dto/create-lop-hoc-phan.dto';

/*
  CONTROLLER: LopHocPhanController
  ─────────────────────────────────────────────────────────
  VIEW ROUTES  : không có view riêng — dữ liệu nhúng vào 2 trang HTML
    sinh-vien.html tab "Đăng ký học phần":
      fetch('/api/lop-hoc-phan') → render hp-card
      Hiển thị: hocPhan.tenHocPhan, hocPhan.soTinChi,
                giangVien.hoTen, hocKy, id (để đăng ký)
    giang-vien.html tab "Lớp học phần":
      fetch('/api/lop-hoc-phan/giang-vien/:gvId')
      Hiển thị: hocPhan.tenHocPhan, hocKy, id (để tạo QR)

  API ROUTES   (JSON ← TypeORM ← lop_hoc_phan JOIN hoc_phan, giang_vien)
    GET    /api/lop-hoc-phan                    → findAll()
    GET    /api/lop-hoc-phan/giang-vien/:gvId   → findByGiangVien()
    GET    /api/lop-hoc-phan/:id                → findOne()
    POST   /api/lop-hoc-phan                    → create()
    PUT    /api/lop-hoc-phan/:id                → update()
    DELETE /api/lop-hoc-phan/:id                → remove()
  ─────────────────────────────────────────────────────────
*/
@Controller('api/lop-hoc-phan')
export class LopHocPhanController {
  constructor(private readonly lopHocPhanService: LopHocPhanService) {}

  @Get()
  findAll() { return this.lopHocPhanService.findAll(); }

  @Get('giang-vien/:gvId')
  findByGiangVien(@Param('gvId', ParseIntPipe) gvId: number) {
    return this.lopHocPhanService.findByGiangVien(gvId);
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.lopHocPhanService.findOne(id);
  }

  @Post()
  create(@Body() dto: CreateLopHocPhanDto) {
    return this.lopHocPhanService.create(dto);
  }

  @Put(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: Partial<CreateLopHocPhanDto>,
  ) {
    return this.lopHocPhanService.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.lopHocPhanService.remove(id);
  }
}
