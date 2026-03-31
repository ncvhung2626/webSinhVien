import { Module } from '@nestjs/common';
import { PhanCongGiangDayController } from './phan-cong-giang-day.controller';
import { PhanCongGiangDayService } from './phan-cong-giang-day.service';

@Module({
  controllers: [PhanCongGiangDayController],
  providers: [PhanCongGiangDayService],
})
export class PhanCongGiangDayModule {}
