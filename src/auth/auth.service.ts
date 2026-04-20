import { Injectable, UnauthorizedException, NotFoundException, BadRequestException } from '@nestjs/common';
import { InjectRepository }                  from '@nestjs/typeorm';
import { Repository }                        from 'typeorm';
import { JwtService }                        from '@nestjs/jwt';
import * as bcrypt                           from 'bcrypt';
import { NguoiDung }                         from './entities/nguoi-dung.entity';
import { PasswordResetOtp }                  from './entities/password-reset-otp.entity';
import { LoginDto }                          from './dto/login.dto';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(NguoiDung)
    private nguoiDungRepo: Repository<NguoiDung>,
    @InjectRepository(PasswordResetOtp)
    private otpRepo: Repository<PasswordResetOtp>,
    private jwtService: JwtService,
  ) {}

  async login(dto: LoginDto) {
    const email = dto.email?.trim().toLowerCase();
    const user = await this.nguoiDungRepo.findOne({
      where: { email },
      relations: ['vaiTro'],
    });
    if (!user) throw new UnauthorizedException('Email không tồn tại');

    let isMatch = false;
    const hash = user.matKhau || '';
    if (hash.startsWith('$2b$') || hash.startsWith('$2a$')) {
      isMatch = await bcrypt.compare(dto.matKhau, hash);
    } else {
      isMatch = dto.matKhau === hash;
    }
    if (!isMatch) throw new UnauthorizedException('Mật khẩu không đúng');

    const vaiTro  = user.vaiTro?.tenVaiTro || '';
    const payload = { sub: user.id, email: user.email, vaiTro };
    return {
      accessToken: this.jwtService.sign(payload),
      vaiTro,
      userId: user.id,
    };
  }

  verifyToken(token: string) {
    return this.jwtService.verify(token);
  }

  // Giữ lại API cũ (không xóa để tránh breaking change)
  async resetPassword(rawEmail: string): Promise<string> {
    const email = rawEmail?.trim().toLowerCase();
    const user = await this.nguoiDungRepo.findOne({ where: { email } });
    if (!user) throw new Error('Email không tồn tại trong hệ thống');
    const newPass = Math.random().toString(36).slice(-8).toUpperCase();
    user.matKhau  = newPass;
    await this.nguoiDungRepo.save(user);
    return newPass;
  }

  // ══════════════════════════════════════════════════════
  //  QUÊN MẬT KHẨU VỚI OTP (EmailJS phía frontend)
  // ══════════════════════════════════════════════════════

  /**
   * Bước 1: Kiểm tra email → Tạo OTP 6 số → trả về để frontend gửi email
   * OTP có hiệu lực 5 phút
   */
  async forgotPassword(rawEmail: string) {
    const email = rawEmail?.trim().toLowerCase();
    const user = await this.nguoiDungRepo.findOne({
      where: { email },
      relations: ['vaiTro'],
    });
    if (!user) {
      throw new NotFoundException('Email không tồn tại trong hệ thống');
    }

    // Tạo OTP 6 số ngẫu nhiên
    const otpCode = Math.floor(100000 + Math.random() * 900000).toString();

    // Xóa OTP cũ (nếu có), lưu OTP mới
    await this.otpRepo.delete({ userId: user.id });
    await this.otpRepo.save({
      userId:    user.id,
      otpCode,
      expiresAt: new Date(Date.now() + 5 * 60 * 1000), // 5 phút
    });

    // Lấy tên hiển thị
    const vaiTro = user.vaiTro?.tenVaiTro || '';
    const userName = user.email.split('@')[0]; // fallback dùng phần trước @ làm tên

    // Trả về OTP để frontend dùng script Browser gọi EmailJS 
    // (do backend gọi REST API sẽ bị block 403 non-browser từ bảng điều khiển emailjs miễn phí)
    return {
      success: true,
      otpCode,
      userName,
      userEmail: user.email,
      vaiTro,
    };
  }

  /**
   * Bước 2: Xác thực OTP
   */
  async verifyOtp(rawEmail: string, otpCode: string) {
    const email = rawEmail?.trim().toLowerCase();
    const user = await this.nguoiDungRepo.findOne({ where: { email } });
    if (!user) {
      throw new NotFoundException('Email không tồn tại');
    }

    const record = await this.otpRepo.findOne({
      where: { userId: user.id, otpCode },
    });

    if (!record) {
      throw new BadRequestException('Mã OTP không đúng');
    }

    if (new Date() > record.expiresAt) {
      await this.otpRepo.delete({ id: record.id });
      throw new BadRequestException('Mã OTP đã hết hạn, vui lòng thử lại');
    }

    // Đánh dấu đã xác thực
    await this.otpRepo.update({ id: record.id }, { isVerified: true });

    return { success: true, message: 'Xác thực OTP thành công' };
  }

  /**
   * Bước 3: Đặt lại mật khẩu mới (chỉ khi OTP đã verified)
   */
  async datLaiMatKhauVoiOtp(rawEmail: string, matKhauMoi: string) {
    const email = rawEmail?.trim().toLowerCase();
    const user = await this.nguoiDungRepo.findOne({ where: { email } });
    if (!user) {
      throw new NotFoundException('Email không tồn tại');
    }

    // Kiểm tra đã xác thực OTP chưa
    const record = await this.otpRepo.findOne({
      where: { userId: user.id, isVerified: true },
    });
    if (!record) {
      throw new BadRequestException('Bạn chưa xác thực OTP');
    }

    // Hash mật khẩu mới + cập nhật
    user.matKhau = await bcrypt.hash(matKhauMoi, 10);
    await this.nguoiDungRepo.save(user);

    // Xóa tất cả OTP của user
    await this.otpRepo.delete({ userId: user.id });

    return { success: true, message: 'Đặt lại mật khẩu thành công' };
  }
}
