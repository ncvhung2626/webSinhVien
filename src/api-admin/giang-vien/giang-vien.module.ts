import { Module } from '@nestjs/common';
import { AdminGiangVienController } from './giang-vien.controller';
import { AdminGiangVienService } from './giang-vien.service';

@Module({
  controllers: [AdminGiangVienController],
  providers: [AdminGiangVienService],
})
export class AdminGiangVienModule {}
