import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { HocPhanController } from './hoc-phan.controller';
import { HocPhanService }    from './hoc-phan.service';
import { HocPhan }           from './entities/hoc-phan.entity';

/*
  MODULE: HocPhanModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : hoc_phan
  THUỘC TÍNH   : id, ten_hoc_phan, so_tin_chi
  ENTITY       : HocPhan
  DTO          : CreateHocPhanDto (tenHocPhan, soTinChi)
  SERVICE      : findAll | findOne | create | update | remove
  CONTROLLER   :
    API   GET    /api/hoc-phan
          GET    /api/hoc-phan/:id
          POST   /api/hoc-phan
          PUT    /api/hoc-phan/:id
          DELETE /api/hoc-phan/:id
  VIEW DÙNG    : sinh-vien.html (tab Đăng ký học phần)
                 → fetch /api/hoc-phan để render danh sách
  EXPORT       : HocPhanService (dùng bởi LopHocPhanModule)
  ──────────────────────────────────────────────────────
*/
@Module({
  imports:     [TypeOrmModule.forFeature([HocPhan])],
  controllers: [HocPhanController],
  providers:   [HocPhanService],
  exports:     [HocPhanService],
})
export class HocPhanModule {}
