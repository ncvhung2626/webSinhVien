import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DiemRenLuyenController } from './diem-ren-luyen.controller';
import { DiemRenLuyenService }    from './diem-ren-luyen.service';
import { DiemRenLuyen }           from './entities/diem-ren-luyen.entity';
import { LichSuDiemRenLuyen }     from './entities/lich-su-drl.entity';

/*
  MODULE: DiemRenLuyenModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : diem_ren_luyen, lich_su_diem_ren_luyen
  THUỘC TÍNH diem_ren_luyen:
    id, sinh_vien_id (FK), tong_diem (0–100), xep_loai, hoc_ky
  THUỘC TÍNH lich_su_diem_ren_luyen:
    id, sinh_vien_id, diem_thay_doi, ly_do, ngay_cap_nhat
  XẾP LOẠI    : ≥90→xuat_sac | ≥80→tot | ≥65→kha | ≥50→trung_binh | <50→yeu
  ENTITY      : DiemRenLuyen, LichSuDiemRenLuyen
  DTO         : CapNhatDrlDto (sinhVienId, tongDiem, hocKy?)
                CongDiemDto   (sinhVienId, diemThayDoi, lyDo?)
  SERVICE     : findBySinhVien | findLichSu | capNhat | congDiem
  CONTROLLER  :
    API   GET /api/diem-ren-luyen/sinh-vien/:svId
          GET /api/diem-ren-luyen/sinh-vien/:svId/lich-su
          PUT /api/diem-ren-luyen/cap-nhat
          PUT /api/diem-ren-luyen/cong-diem
  VIEW DÙNG   :
    sinh-vien.html → tab Điểm rèn luyện: hiển thị tongDiem,
                     xepLoai, hocKy, lịch sử thay đổi (lyDo, diemThayDoi)
  EXPORT      : DiemRenLuyenService (dùng bởi SuKienModule → congDiem)
  ──────────────────────────────────────────────────────
*/
@Module({
  imports:     [TypeOrmModule.forFeature([DiemRenLuyen, LichSuDiemRenLuyen])],
  controllers: [DiemRenLuyenController],
  providers:   [DiemRenLuyenService],
  exports:     [DiemRenLuyenService],
})
export class DiemRenLuyenModule {}
