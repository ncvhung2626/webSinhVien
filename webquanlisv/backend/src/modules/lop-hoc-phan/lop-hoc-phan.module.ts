import { Module } from '@nestjs/common';
import { LopHocPhanController } from './lop-hoc-phan.controller';
import { LopHocPhanService } from './lop-hoc-phan.service';

@Module({
  controllers: [LopHocPhanController],
  providers: [LopHocPhanService],
})
export class LopHocPhanModule {}
