import { Module }        from '@nestjs/common';
import { ConfigModule }  from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';

// --- Modules User (từ qlsv-fixed) ---
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

// --- Modules Admin (từ webquanlisv) ---
import { AdminAuthModule }              from './api-admin/admin-auth/auth.module';
import { AdminDashboardModule }         from './api-admin/dashboard/dashboard.module';
import { AdminSinhVienModule }          from './api-admin/sinh-vien/sinh-vien.module';
import { AdminGiangVienModule }         from './api-admin/giang-vien/giang-vien.module';
import { AdminLopHocPhanModule }        from './api-admin/lop-hoc-phan/lop-hoc-phan.module';
import { AdminPhanCongGiangDayModule }  from './api-admin/phan-cong-giang-day/phan-cong-giang-day.module';
import { AdminSuKienModule }            from './api-admin/su-kien/su-kien.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),

    TypeOrmModule.forRootAsync({
      useFactory: () => {
        const url = process.env.DATABASE_URL;
        if (url) {
          return {
            type:             'postgres',
            url:              url,
            autoLoadEntities: true,
            synchronize:      true,
            ssl:              { rejectUnauthorized: false },
          };
        }
        return {
          type:             'postgres',
          host:             process.env.DB_HOST  || 'localhost',
          port:             +process.env.DB_PORT || 5432,
          username:         process.env.DB_USER  || 'postgres',
          password:         process.env.DB_PASS  || 'Ncvhung@2626',
          database:         process.env.DB_NAME  || 'quan_li_sv',
          autoLoadEntities: true,
          synchronize:      true,
        };
      },
    }),

    // User modules
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

    // Admin modules
    AdminAuthModule,
    AdminDashboardModule,
    AdminSinhVienModule,
    AdminGiangVienModule,
    AdminLopHocPhanModule,
    AdminPhanCongGiangDayModule,
    AdminSuKienModule,
  ],
})
export class AppModule {}
