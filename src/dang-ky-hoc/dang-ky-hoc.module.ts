import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DangKyHocController } from './dang-ky-hoc.controller';
import { DangKyHocService }    from './dang-ky-hoc.service';
import { DangKyHoc }           from './entities/dang-ky-hoc.entity';

/*
  MODULE: DangKyHocModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : dang_ky_hoc
  THUỘC TÍNH   : id, sinh_vien_id (FK), lop_hoc_phan_id (FK),
                 ngay_dang_ky, da_thanh_toan
  JOIN         : sinh_vien → mssv, hoTen
                 lop_hoc_phan → hocPhan.tenHocPhan, hocPhan.soTinChi
  ENTITY       : DangKyHoc
  DTO          : DangKyHocDto (sinhVienId, lopHocPhanIds[])
  SERVICE      : findBySinhVien | findByLopHocPhan | dangKyNhieu
                 capNhatThanhToan | huyDangKy
  CONTROLLER   :
    API   GET    /api/dang-ky-hoc/sinh-vien/:svId
          GET    /api/dang-ky-hoc/lop/:lopId
          POST   /api/dang-ky-hoc
          PUT    /api/dang-ky-hoc/thanh-toan
          DELETE /api/dang-ky-hoc/:id
  VIEW DÙNG    :
    sinh-vien.html → tab Đăng ký học phần + tab Lịch sử đăng ký
    giang-vien.html → tab SV Đăng ký học phần
  EXPORT       : DangKyHocService (dùng bởi PaymentModule)
  ──────────────────────────────────────────────────────
*/
@Module({
  imports:     [TypeOrmModule.forFeature([DangKyHoc])],
  controllers: [DangKyHocController],
  providers:   [DangKyHocService],
  exports:     [DangKyHocService],
})
export class DangKyHocModule {}
