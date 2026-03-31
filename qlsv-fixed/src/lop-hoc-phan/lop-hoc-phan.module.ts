import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { LopHocPhanController } from './lop-hoc-phan.controller';
import { LopHocPhanService }    from './lop-hoc-phan.service';
import { LopHocPhan }           from './entities/lop-hoc-phan.entity';

/*
  MODULE: LopHocPhanModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : lop_hoc_phan
  THUỘC TÍNH   : id, hoc_phan_id (FK), giang_vien_id (FK), hoc_ky
  JOIN         : hoc_phan → tenHocPhan, soTinChi
                 giang_vien → hoTen, boMon
  ENTITY       : LopHocPhan
  DTO          : CreateLopHocPhanDto (hocPhanId, giangVienId, hocKy?)
  SERVICE      : findAll | findByGiangVien | findOne | create | update | remove
  CONTROLLER   :
    API   GET    /api/lop-hoc-phan
          GET    /api/lop-hoc-phan/giang-vien/:gvId
          GET    /api/lop-hoc-phan/:id
          POST   /api/lop-hoc-phan
          PUT    /api/lop-hoc-phan/:id
          DELETE /api/lop-hoc-phan/:id
  VIEW DÙNG    :
    sinh-vien.html  → tab Đăng ký học phần (render danh sách lớp)
    giang-vien.html → tab Lớp học phần + tab Tạo QR
  EXPORT       : LopHocPhanService (dùng bởi DangKyHocModule, DiemDanhModule)
  ──────────────────────────────────────────────────────
*/
@Module({
  imports:     [TypeOrmModule.forFeature([LopHocPhan])],
  controllers: [LopHocPhanController],
  providers:   [LopHocPhanService],
  exports:     [LopHocPhanService],
})
export class LopHocPhanModule {}
