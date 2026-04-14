import { Module } from '@nestjs/common';
import { AdminPhanCongGiangDayController } from './phan-cong-giang-day.controller';
import { AdminPhanCongGiangDayService } from './phan-cong-giang-day.service';

@Module({
  controllers: [AdminPhanCongGiangDayController],
  providers: [AdminPhanCongGiangDayService],
})
export class AdminPhanCongGiangDayModule {}
