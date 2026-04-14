import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PassportModule } from '@nestjs/passport';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { JwtStrategy } from './jwt.strategy';
import { NguoiDung, SinhVien, GiangVien } from '../entities';
@Module({
  imports: [PassportModule, TypeOrmModule.forFeature([NguoiDung, SinhVien, GiangVien])],
  controllers: [AuthController],
  providers: [AuthService, JwtStrategy],
  exports: [AuthService],
})
export class AuthModule {}
