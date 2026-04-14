import {
  Controller, Get, Post, Put, Delete,
  Param, Body, ParseIntPipe,
} from '@nestjs/common';
import { HocPhanService }   from './hoc-phan.service';
import { CreateHocPhanDto } from './dto/create-hoc-phan.dto';

/*
  CONTROLLER: HocPhanController
  ─────────────────────────────────────────────────────────
  VIEW ROUTES  : không có — dữ liệu nhúng vào sinh-vien.html
    sinh-vien.html tab "Đăng ký học phần":
      fetch('/api/hoc-phan') → hiển thị tenHocPhan, soTinChi

  API ROUTES   (JSON ← TypeORM ← bảng hoc_phan)
    GET    /api/hoc-phan        → findAll()     danh sách học phần
    GET    /api/hoc-phan/:id    → findOne()     chi tiết học phần
    POST   /api/hoc-phan        → create()      tạo học phần
    PUT    /api/hoc-phan/:id    → update()      cập nhật
    DELETE /api/hoc-phan/:id    → remove()      xoá học phần
  ─────────────────────────────────────────────────────────
*/
@Controller('api/hoc-phan')
export class HocPhanController {
  constructor(private readonly hocPhanService: HocPhanService) {}

  @Get()
  findAll() { return this.hocPhanService.findAll(); }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.hocPhanService.findOne(id);
  }

  @Post()
  create(@Body() dto: CreateHocPhanDto) {
    return this.hocPhanService.create(dto);
  }

  @Put(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: Partial<CreateHocPhanDto>,
  ) {
    return this.hocPhanService.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.hocPhanService.remove(id);
  }
}
