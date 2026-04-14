import { Module } from '@nestjs/common';
import { AdminSinhVienController } from './sinh-vien.controller';
import { AdminSinhVienService } from './sinh-vien.service';

@Module({
  controllers: [AdminSinhVienController],
  providers: [AdminSinhVienService],
})
export class AdminSinhVienModule {}
