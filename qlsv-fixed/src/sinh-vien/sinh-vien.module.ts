import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SinhVienController } from './sinh-vien.controller';
import { SinhVienService }    from './sinh-vien.service';
import { SinhVien }           from './entities/sinh-vien.entity';

/*
  MODULE: SinhVienModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : sinh_vien
  THUỘC TÍNH   : id, nguoi_dung_id, mssv, ho_ten, lop, ma_qr
  ENTITY       : SinhVien
  DTO          : CreateSinhVienDto (mssv, hoTen, lop?, nguoiDungId?)
  SERVICE      : findAll | findOne | findByNguoiDung | create | update
  CONTROLLER   :
    VIEW  GET /sinh-vien            → sinh-vien.html
    API   GET  /api/sinh-vien
          GET  /api/sinh-vien/me/:uid
          GET  /api/sinh-vien/:id
          POST /api/sinh-vien
          PUT  /api/sinh-vien/:id
  EXPORT       : SinhVienService (dùng bởi DangKyHocModule, DiemDanhModule,
                                   BaiTapModule, PaymentModule)
  ──────────────────────────────────────────────────────
*/
@Module({
  imports: [
    TypeOrmModule.forFeature([SinhVien]),
  ],
  controllers: [SinhVienController],
  providers:   [SinhVienService],
  exports:     [SinhVienService],
})
export class SinhVienModule {}
