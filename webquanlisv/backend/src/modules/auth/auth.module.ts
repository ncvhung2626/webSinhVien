import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { NguoiDung } from './nguoi-dung.entity';

@Module({
  imports: [TypeOrmModule.forFeature([NguoiDung])],
  controllers: [AuthController],
  providers: [AuthService],
})
export class AuthModule {}
