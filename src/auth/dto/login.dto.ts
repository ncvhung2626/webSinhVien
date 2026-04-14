// DTO nhận dữ liệu đăng nhập từ client
import { IsEmail, IsString, MinLength } from 'class-validator';

export class LoginDto {
  // Email hợp lệ
  @IsEmail({}, { message: 'Email không hợp lệ' })
  email: string;

  // Mật khẩu tối thiểu 6 ký tự
  @IsString()
  @MinLength(6, { message: 'Mật khẩu tối thiểu 6 ký tự' })
  matKhau: string;
}
