import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SuKienController } from './su-kien.controller';
import { SuKienService }    from './su-kien.service';
import { SuKien }           from './entities/su-kien.entity';
import { DangKySuKien }     from './entities/dang-ky-su-kien.entity';
import { DiemRenLuyenModule } from '../diem-ren-luyen/diem-ren-luyen.module';

/*
  MODULE: SuKienModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : su_kien, dang_ky_su_kien
  THUỘC TÍNH su_kien:
    id, ten_su_kien, mo_ta, ngay_to_chuc, dia_diem, diem_cong, admin_id
  THUỘC TÍNH dang_ky_su_kien:
    id, su_kien_id (FK), sinh_vien_id (FK), trang_thai, thoi_gian_dang_ky
  JOIN : su_kien → tenSuKien, diemCong (khi SV đăng ký → cộng điểm rèn luyện)
         sinh_vien → mssv, hoTen (khi xem danh sách đăng ký)
  ENTITY  : SuKien, DangKySuKien
  DTO     : CreateSuKienDto | DangKySuKienDto
  SERVICE : findAll | findOne | findBySinhVien | findDanhSachDangKy
            create | remove | dangKy | huyDangKy
  CONTROLLER:
    API   GET    /api/su-kien
          GET    /api/su-kien/sinh-vien/:svId
          GET    /api/su-kien/:id/dang-ky
          POST   /api/su-kien/dang-ky
          DELETE /api/su-kien/dang-ky/:id
          GET    /api/su-kien/:id
          POST   /api/su-kien
          DELETE /api/su-kien/:id
  VIEW DÙNG:
    sinh-vien.html  → tab Sự kiện: hiển thị tenSuKien, ngayToChuc,
                      diaDiem, diemCong; nút Đăng ký
    giang-vien.html → tab Quản lý sự kiện: tạo/xoá sự kiện,
                      xem DS SV đăng ký
  IMPORT   : DiemRenLuyenModule (gọi congDiem sau khi SV đăng ký sự kiện)
  EXPORT   : SuKienService
  ──────────────────────────────────────────────────────
*/
@Module({
  imports: [
    TypeOrmModule.forFeature([SuKien, DangKySuKien]),
    DiemRenLuyenModule,
  ],
  controllers: [SuKienController],
  providers:   [SuKienService],
  exports:     [SuKienService],
})
export class SuKienModule {}
