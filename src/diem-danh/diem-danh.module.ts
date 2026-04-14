import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DiemDanhController } from './diem-danh.controller';
import { DiemDanhService }    from './diem-danh.service';
import { DiemDanh }           from './entities/diem-danh.entity';
import { PhienDiemDanh }      from './entities/phien-diem-danh.entity';

/*
  MODULE: DiemDanhModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : phien_diem_danh, diem_danh
  THUỘC TÍNH phien_diem_danh:
    id, lop_hoc_phan_id, ma_qr_session, thoi_gian_het_han, da_dong, ngay_tao
  THUỘC TÍNH diem_danh:
    id, buoi_hoc_id, sinh_vien_id (FK), trang_thai, thoi_gian, hinh_thuc
  JOIN       : sinh_vien → mssv, hoTen (khi GV xem danh sách)
  ENTITY     : DiemDanh, PhienDiemDanh
  DTO        : TaoPhienDto (lopHocPhanId, thoiGianPhut?)
               QuetQrDto  (maQrSession, sinhVienId)
  SERVICE    : taoPhien | dongPhien | quetQr | findBySinhVien
               findByBuoiHoc | suaTrangThai
  CONTROLLER :
    API   POST /api/diem-danh/phien
          PUT  /api/diem-danh/phien/:id/dong
          POST /api/diem-danh/quet-qr
          GET  /api/diem-danh/sinh-vien/:svId
          GET  /api/diem-danh/buoi/:buoiId
          PUT  /api/diem-danh/:id/trang-thai
  VIEW DÙNG  :
    giang-vien.html → tab Tạo QR (taoPhien → render QRCode.js canvas)
    giang-vien.html → tab Quản lý điểm danh (findByBuoiHoc, suaTrangThai)
    sinh-vien.html  → tab Điểm danh QR (quetQr, findBySinhVien)
  EXPORT     : DiemDanhService
  ──────────────────────────────────────────────────────
*/
@Module({
  imports:     [TypeOrmModule.forFeature([DiemDanh, PhienDiemDanh])],
  controllers: [DiemDanhController],
  providers:   [DiemDanhService],
  exports:     [DiemDanhService],
})
export class DiemDanhModule {}
