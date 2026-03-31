import { Module }        from '@nestjs/common';
import { ConfigModule }  from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';

import { AuthModule }          from './auth/auth.module';
import { SinhVienModule }      from './sinh-vien/sinh-vien.module';
import { GiangVienModule }     from './giang-vien/giang-vien.module';
import { HocPhanModule }       from './hoc-phan/hoc-phan.module';
import { LopHocPhanModule }    from './lop-hoc-phan/lop-hoc-phan.module';
import { DangKyHocModule }     from './dang-ky-hoc/dang-ky-hoc.module';
import { DiemDanhModule }      from './diem-danh/diem-danh.module';
import { BaiTapModule }        from './bai-tap/bai-tap.module';
import { DiemRenLuyenModule }  from './diem-ren-luyen/diem-ren-luyen.module';
import { SuKienModule }        from './su-kien/su-kien.module';
import { PaymentModule }       from './payment/payment.module';
import { PhieuYeuCauModule }   from './phieu-yeu-cau/phieu-yeu-cau.module';

/*
  APP MODULE – Root module kết nối toàn bộ hệ thống
  ════════════════════════════════════════════════════════════

  CẤU TRÚC MODULE THEO CHỨC NĂNG:

  [AUTH]          AuthModule
    Bảng         : nguoi_dung, vai_tro
    View route   : GET /           → index.html
    API          : POST /api/auth/login

  [SINH VIÊN]     SinhVienModule
    Bảng         : sinh_vien
    View route   : GET /sinh-vien  → sinh-vien.html
    API          : /api/sinh-vien/**

  [GIẢNG VIÊN]    GiangVienModule
    Bảng         : giang_vien
    View route   : GET /giang-vien → giang-vien.html
    API          : /api/giang-vien/**

  [HỌC PHẦN]      HocPhanModule
    Bảng         : hoc_phan (tenHocPhan, soTinChi)
    View dùng    : sinh-vien.html tab Đăng ký học phần
    API          : /api/hoc-phan/**

  [LỚP HỌC PHẦN] LopHocPhanModule
    Bảng         : lop_hoc_phan (JOIN hoc_phan, giang_vien)
    View dùng    : sinh-vien.html + giang-vien.html
    API          : /api/lop-hoc-phan/**

  [ĐĂNG KÝ HỌC]  DangKyHocModule
    Bảng         : dang_ky_hoc (JOIN sinh_vien, lop_hoc_phan)
    View dùng    : sinh-vien.html (Đăng ký + Lịch sử)
                   giang-vien.html (SV Đăng ký)
    API          : /api/dang-ky-hoc/**

  [ĐIỂM DANH]     DiemDanhModule
    Bảng         : phien_diem_danh, diem_danh
    View dùng    : giang-vien.html (Tạo QR, Quản lý DD)
                   sinh-vien.html (Quét QR)
    API          : /api/diem-danh/**

  [BÀI TẬP]       BaiTapModule
    Bảng         : bai_tap, nop_bai (hỗ trợ upload file)
    View dùng    : giang-vien.html (Tạo BT + Chấm điểm)
                   sinh-vien.html (Xem + Nộp bài)
    API          : /api/bai-tap/**

  [ĐIỂM RÈN LUYỆN] DiemRenLuyenModule
    Bảng         : diem_ren_luyen, lich_su_diem_ren_luyen
    View dùng    : sinh-vien.html tab Điểm rèn luyện
    API          : /api/diem-ren-luyen/**

  [SỰ KIỆN]       SuKienModule
    Bảng         : su_kien, dang_ky_su_kien
    View dùng    : sinh-vien.html + giang-vien.html tab Sự kiện
    API          : /api/su-kien/**
    Phụ thuộc   : DiemRenLuyenModule (congDiem khi SV đăng ký)

  [THANH TOÁN]    PaymentModule
    Bảng         : giao_dich_thanh_toan, chi_tiet_thanh_toan
    VNPay        : TmnCode=LFOD1X7N, sandbox
    View dùng    : sinh-vien.html (redirect → VNPay → callback)
    API          : /api/payment/**
    Phụ thuộc   : DangKyHocModule (capNhatThanhToan)

  [PHIẾU YÊU CẦU] PhieuYeuCauModule
    Bảng         : phieu_yeu_cau
    View dùng    : sinh-vien.html + giang-vien.html tab Phiếu YC
    API          : /api/phieu-yeu-cau/**

  DATABASE: PostgreSQL
    host     : DB_HOST  (default: localhost)
    port     : DB_PORT  (default: 5432)
    user     : DB_USER  (default: postgres)
    password : DB_PASS  (default: Ncvhung@2626)
    database : DB_NAME  (default: quan_li_sv)
    synchronize: false  (dùng file .sql)
  ════════════════════════════════════════════════════════════
*/
@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),

    TypeOrmModule.forRoot({
      type:             'postgres',
      host:             process.env.DB_HOST  || 'localhost',
      port:             +process.env.DB_PORT || 5432,
      username:         process.env.DB_USER  || 'postgres',
      password:         process.env.DB_PASS  || 'Ncvhung@2626',
      database:         process.env.DB_NAME  || 'quan_li_sv',
      autoLoadEntities: true,
      synchronize:      false,
    }),

    AuthModule,
    SinhVienModule,
    GiangVienModule,
    HocPhanModule,
    LopHocPhanModule,
    DangKyHocModule,
    DiemDanhModule,
    BaiTapModule,
    DiemRenLuyenModule,
    SuKienModule,
    PaymentModule,
    PhieuYeuCauModule,
  ],
})
export class AppModule {}
