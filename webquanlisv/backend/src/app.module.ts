import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './modules/auth/auth.module';
import { DashboardModule } from './modules/dashboard/dashboard.module';
import { SinhVienModule } from './modules/sinh-vien/sinh-vien.module';
import { GiangVienModule } from './modules/giang-vien/giang-vien.module';
import { LopHocPhanModule } from './modules/lop-hoc-phan/lop-hoc-phan.module';
import { PhanCongGiangDayModule } from './modules/phan-cong-giang-day/phan-cong-giang-day.module';
import { SuKienModule } from './modules/su-kien/su-kien.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST || 'localhost',
      port: +(process.env.DB_PORT || 5432),
      username: process.env.DB_USER || 'postgres',
      password: process.env.DB_PASS || 'Ncvhung@2626',
      database: process.env.DB_NAME || 'quan_li_sv',
      autoLoadEntities: true,
      synchronize: false,
    }),
    AuthModule,
    DashboardModule,
    SinhVienModule,
    GiangVienModule,
    LopHocPhanModule,
    PhanCongGiangDayModule,
    SuKienModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
