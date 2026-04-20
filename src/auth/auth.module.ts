import { Module }        from '@nestjs/common';
import { JwtModule }     from '@nestjs/jwt';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthController }    from './auth.controller';
import { AuthService }       from './auth.service';
import { NguoiDung }         from './entities/nguoi-dung.entity';
import { VaiTro }            from './entities/vai-tro.entity';
import { PasswordResetOtp }  from './entities/password-reset-otp.entity';

/*
  MODULE: AuthModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : nguoi_dung, vai_tro
  THUỘC TÍNH nguoi_dung:
    id, email (unique), mat_khau (bcrypt), vai_tro_id (FK)
  THUỘC TÍNH vai_tro:
    id, ten_vai_tro ('sinh_vien' | 'giang_vien' | 'admin')
  JOIN      : nguoiDung.vaiTro (eager) → tenVaiTro
  JWT       : secret=qlsv_secret_2025, expiresIn=8h
              payload: { sub: id, email, vaiTro: tenVaiTro }
  ENTITY    : NguoiDung (eager vaiTro), VaiTro
  DTO       : LoginDto (email, matKhau)
  SERVICE   : login(dto) → { accessToken, vaiTro, userId }
              verifyToken(token) → payload
  CONTROLLER:
    VIEW  GET  /           → index.html  (trang đăng nhập)
    API   POST /api/auth/login
              → xác thực email + bcrypt compare matKhau
              → trả { accessToken, vaiTro, redirectUrl }
              → redirectUrl: vaiTro=giang_vien → /giang-vien
                             vaiTro=sinh_vien  → /sinh-vien
  VIEW DÙNG :
    index.html → Form login: email, matKhau, chọn vai trò
                 JS: POST /api/auth/login → lưu token localStorage
                 → window.location = redirectUrl
  EXPORT    : AuthService, JwtModule (các module khác dùng verifyToken)
  ──────────────────────────────────────────────────────
*/
@Module({
  imports: [
    TypeOrmModule.forFeature([NguoiDung, VaiTro, PasswordResetOtp]),
    JwtModule.register({
      secret:      process.env.JWT_SECRET || 'qlsv_secret_2025',
      signOptions: { expiresIn: '8h' },
    }),
  ],
  controllers: [AuthController],
  providers:   [AuthService],
  exports:     [AuthService, JwtModule],
})
export class AuthModule {}
