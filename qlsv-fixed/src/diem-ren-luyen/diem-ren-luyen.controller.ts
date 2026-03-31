// Controller DiemRenLuyen
// API ROUTE : GET /api/diem-ren-luyen/sinh-vien/:svId          → tất cả điểm theo học kỳ
//             GET /api/diem-ren-luyen/sinh-vien/:svId/lich-su  → lịch sử thay đổi
//             PUT /api/diem-ren-luyen/cap-nhat                 → cập nhật tổng điểm
//             PUT /api/diem-ren-luyen/cong-diem                → cộng/trừ điểm + ghi lịch sử
import { Controller, Get, Put, Param, Body, ParseIntPipe } from '@nestjs/common';
import { DiemRenLuyenService }              from './diem-ren-luyen.service';
import { CapNhatDrlDto, CongDiemDto }       from './dto/diem-ren-luyen.dto';

@Controller('api/diem-ren-luyen')
export class DiemRenLuyenController {
  constructor(private readonly diemRenLuyenService: DiemRenLuyenService) {}

  // GET /api/diem-ren-luyen/sinh-vien/:svId → danh sách điểm rèn luyện các học kỳ
  @Get('sinh-vien/:svId')
  findBySinhVien(@Param('svId', ParseIntPipe) svId: number) {
    return this.diemRenLuyenService.findBySinhVien(svId);
  }

  // GET /api/diem-ren-luyen/sinh-vien/:svId/lich-su → lịch sử thay đổi điểm
  @Get('sinh-vien/:svId/lich-su')
  findLichSu(@Param('svId', ParseIntPipe) svId: number) {
    return this.diemRenLuyenService.findLichSu(svId);
  }

  // PUT /api/diem-ren-luyen/cap-nhat → cập nhật tổng điểm (admin / hệ thống)
  @Put('cap-nhat')
  capNhat(@Body() dto: CapNhatDrlDto) {
    return this.diemRenLuyenService.capNhat(dto);
  }

  // PUT /api/diem-ren-luyen/cong-diem → cộng/trừ điểm sau sự kiện
  @Put('cong-diem')
  congDiem(@Body() dto: CongDiemDto) {
    return this.diemRenLuyenService.congDiem(dto);
  }
}
