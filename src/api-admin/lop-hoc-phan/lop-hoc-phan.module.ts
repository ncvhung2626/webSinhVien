import { Module } from '@nestjs/common';
import { AdminLopHocPhanController } from './lop-hoc-phan.controller';
import { AdminLopHocPhanService } from './lop-hoc-phan.service';

@Module({
  controllers: [AdminLopHocPhanController],
  providers: [AdminLopHocPhanService],
})
export class AdminLopHocPhanModule {}
