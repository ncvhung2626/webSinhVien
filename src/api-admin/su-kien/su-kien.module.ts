import { Module } from '@nestjs/common';
import { AdminSuKienController } from './su-kien.controller';
import { AdminSuKienService } from './su-kien.service';

@Module({
  controllers: [AdminSuKienController],
  providers: [AdminSuKienService],
})
export class AdminSuKienModule {}
