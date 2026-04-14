import { Injectable } from '@nestjs/common';

@Injectable()
export class AdminAuthService {
  xuLyDangNhap(duLieuTuClient: any) {
    const email = duLieuTuClient.email;
    const password = duLieuTuClient.password;

    if (email === 'admin' && password === '123456') {
      return {
        thanh_cong: true,
        thong_bao: 'Đăng nhập thành công! Chào mừng bạn.',
      };
    } else {
      return {
        thanh_cong: false,
        thong_bao: 'Sai email hoặc mật khẩu. Vui lòng thử lại!',
      };
    }
  }
}
