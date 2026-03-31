import { Module } from '@nestjs/common';
import { GiangVienController } from './giang-vien.controller';
import { GiangVienService } from './giang-vien.service';

@Module({
  controllers: [GiangVienController],
  providers: [GiangVienService],
})
export class GiangVienModule {}
