import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PhieuYeuCauController } from './phieu-yeu-cau.controller';
import { PhieuYeuCauService }    from './phieu-yeu-cau.service';
import { PhieuYeuCau }           from './entities/phieu-yeu-cau.entity';

/*
  MODULE: PhieuYeuCauModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : phieu_yeu_cau
  THUỘC TÍNH   :
    id, sinh_vien_id (FK), loai_yeu_cau, tieu_de, noi_dung,
    trang_thai (cho_xu_ly|dang_xu_ly|da_xu_ly),
    phan_hoi, nguoi_xu_ly, ngay_gui, ngay_cap_nhat
  LOẠI YÊU CẦU : xin_nghi | phuc_khao | giay_to | chuyen_lop | khac
  JOIN         : sinh_vien (eager) → mssv, hoTen
  ENTITY       : PhieuYeuCau
  DTO          : TaoPhieuDto    (sinhVienId, loaiYeuCau, tieuDe, noiDung)
                 XuLyPhieuDto  (trangThai, phanHoi?, nguoiXuLy?)
  SERVICE      : findAll | findBySinhVien | findOne | create | xuLy | remove
  CONTROLLER   :
    API   GET    /api/phieu-yeu-cau
          GET    /api/phieu-yeu-cau/sinh-vien/:svId
          GET    /api/phieu-yeu-cau/:id
          POST   /api/phieu-yeu-cau
          PUT    /api/phieu-yeu-cau/:id/xu-ly
          DELETE /api/phieu-yeu-cau/:id
  VIEW DÙNG    :
    sinh-vien.html  → tab Phiếu yêu cầu:
                      form tạo phiếu (loaiYeuCau, tieuDe, noiDung)
                      danh sách phiếu đã gửi: tieuDe, trangThai, phanHoi
    giang-vien.html → tab Phiếu yêu cầu:
                      danh sách phiếu SV gửi (mssv, hoTen, tieuDe, noiDung)
                      nút đổi trangThai, nút gửi phanHoi
  EXPORT       : PhieuYeuCauService
  ──────────────────────────────────────────────────────
*/
@Module({
  imports:     [TypeOrmModule.forFeature([PhieuYeuCau])],
  controllers: [PhieuYeuCauController],
  providers:   [PhieuYeuCauService],
  exports:     [PhieuYeuCauService],
})
export class PhieuYeuCauModule {}
