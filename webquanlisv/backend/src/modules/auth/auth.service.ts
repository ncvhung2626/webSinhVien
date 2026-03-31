import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { NguoiDung } from './nguoi-dung.entity';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(NguoiDung)
    private nguoiDungRepo: Repository<NguoiDung>,
  ) {}

  async xuLyDangNhap(duLieuTuClient: any) {
    const { email, password } = duLieuTuClient;

    console.log('Email nhận được:', email);
    console.log('Password nhận được:', password);

    const nguoiDung = await this.nguoiDungRepo.findOne({ where: { email } });

    console.log('Tìm thấy user:', nguoiDung);

    if (!nguoiDung) {
      return { thanh_cong: false, thong_bao: 'Sai email hoặc mật khẩu!' };
    }

    if (nguoiDung.mat_khau !== password) {
      return { thanh_cong: false, thong_bao: 'Sai email hoặc mật khẩu!' };
    }

    return {
      thanh_cong: true,
      thong_bao: 'Đăng nhập thành công! Chào mừng bạn.',
    };
  }
}
