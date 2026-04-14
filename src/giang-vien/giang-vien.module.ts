import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { GiangVienController } from './giang-vien.controller';
import { GiangVienService }    from './giang-vien.service';
import { GiangVien }           from './entities/giang-vien.entity';

/*
  MODULE: GiangVienModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : giang_vien
  THUỘC TÍNH   : id, nguoi_dung_id, ho_ten, bo_mon
  ENTITY       : GiangVien
  DTO          : CreateGiangVienDto (hoTen, boMon?, nguoiDungId?)
  SERVICE      : findAll | findOne | findByNguoiDung | create | update
  CONTROLLER   :
    VIEW  GET /giang-vien            → giang-vien.html
    API   GET  /api/giang-vien
          GET  /api/giang-vien/me/:uid
          GET  /api/giang-vien/:id
          POST /api/giang-vien
          PUT  /api/giang-vien/:id
  EXPORT       : GiangVienService (dùng bởi LopHocPhanModule, BaiTapModule)
  ──────────────────────────────────────────────────────
*/
@Module({
  imports: [
    TypeOrmModule.forFeature([GiangVien]),
  ],
  controllers: [GiangVienController],
  providers:   [GiangVienService],
  exports:     [GiangVienService],
})
export class GiangVienModule {}
