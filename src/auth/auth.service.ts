import { Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectRepository }                  from '@nestjs/typeorm';
import { Repository }                        from 'typeorm';
import { JwtService }                        from '@nestjs/jwt';
import * as bcrypt                           from 'bcrypt';
import { NguoiDung }                         from './entities/nguoi-dung.entity';
import { LoginDto }                          from './dto/login.dto';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(NguoiDung)
    private nguoiDungRepo: Repository<NguoiDung>,
    private jwtService: JwtService,
  ) {}

  async login(dto: LoginDto) {
    const user = await this.nguoiDungRepo.findOne({
      where: { email: dto.email },
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
  async resetPassword(email: string): Promise<string> {
    const user = await this.nguoiDungRepo.findOne({ where: { email } });
    if (!user) throw new Error('Email không tồn tại trong hệ thống');
    const newPass = Math.random().toString(36).slice(-8).toUpperCase();
    user.matKhau  = newPass;
    await this.nguoiDungRepo.save(user);
    return newPass;
  }

  // ── Bước 1: kiểm tra email có tồn tại không ──
  async kiemTraEmail(email: string): Promise<void> {
    const user = await this.nguoiDungRepo.findOne({ where: { email } });
    if (!user) throw new Error('Email không tồn tại trong hệ thống');
  }

  // ── Bước 2: đặt lại mật khẩu mới (có hash bcrypt) ──
  async datLaiMatKhau(email: string, matKhauMoi: string): Promise<void> {
    const user = await this.nguoiDungRepo.findOne({ where: { email } });
    if (!user) throw new Error('Email không tồn tại trong hệ thống');
    user.matKhau = await bcrypt.hash(matKhauMoi, 10);
    await this.nguoiDungRepo.save(user);
  }
}
