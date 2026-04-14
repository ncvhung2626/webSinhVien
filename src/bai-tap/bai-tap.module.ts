import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MulterModule }  from '@nestjs/platform-express';
import { BaiTapController } from './bai-tap.controller';
import { BaiTapService }    from './bai-tap.service';
import { BaiTap }           from './entities/bai-tap.entity';
import { NopBai }           from './entities/nop-bai.entity';

/*
  MODULE: BaiTapModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : bai_tap, nop_bai
  THUỘC TÍNH bai_tap:
    id, lop_hoc_phan_id (FK), giang_vien_id (FK),
    ten_bai_tap, han_nop, mo_ta, file_dinh_kem, ngay_tao
  THUỘC TÍNH nop_bai:
    id, bai_tap_id (FK), sinh_vien_id (FK),
    mssv, file_nop, ghi_chu, ngay_nop, trang_thai, diem
  JOIN bai_tap : lop_hoc_phan → tenHocPhan | giang_vien → hoTen
  JOIN nop_bai : sinh_vien → mssv, hoTen | bai_tap → tenBaiTap
  ENTITY       : BaiTap, NopBai
  DTO          : CreateBaiTapDto (tenBaiTap, lopHocPhanId, giangVienId,
                                  hanNop, moTa?, fileDinhKem?)
                 NopBaiDto       (baiTapId, sinhVienId, mssv, ghiChu?)
                 ChamDiemDto     (diem)
  SERVICE      : findByLop | findOne | create | update | remove
                 nopBai | findNopBaiByBaiTap | findNopBaiBySinhVien | chamDiem
  CONTROLLER   :
    API   GET    /api/bai-tap/lop/:lopId
          GET    /api/bai-tap/sinh-vien/:svId/nop-bai
          POST   /api/bai-tap/nop           (upload file)
          PUT    /api/bai-tap/nop-bai/:id/cham-diem
          GET    /api/bai-tap/:id/nop-bai
          GET    /api/bai-tap/:id
          POST   /api/bai-tap              (upload file đề bài)
          PUT    /api/bai-tap/:id
          DELETE /api/bai-tap/:id
  VIEW DÙNG    :
    giang-vien.html → tab Quản lý bài tập (tạo BT + upload file đề)
    giang-vien.html → tab Bài tập đã nộp (xem file nộp, chấm điểm)
    sinh-vien.html  → tab Bài tập (xem DS, nộp bài + MSSV + file)
  EXPORT       : BaiTapService
  ──────────────────────────────────────────────────────
*/
@Module({
  imports: [
    TypeOrmModule.forFeature([BaiTap, NopBai]),
    MulterModule.register({ dest: './uploads' }),
  ],
  controllers: [BaiTapController],
  providers:   [BaiTapService],
  exports:     [BaiTapService],
})
export class BaiTapModule {}
