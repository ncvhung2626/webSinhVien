import { Module } from '@nestjs/common';
import { SuKienController } from './su-kien.controller';
import { SuKienService } from './su-kien.service';

@Module({
  controllers: [SuKienController],
  providers: [SuKienService],
})
export class SuKienModule {}
