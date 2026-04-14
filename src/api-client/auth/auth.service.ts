import { Injectable, UnauthorizedException } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { JwtService } from "@nestjs/jwt";
import { NguoiDung, SinhVien, GiangVien } from "../entities";

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(NguoiDung) private nguoiDungRepo: Repository<NguoiDung>,
    @InjectRepository(SinhVien) private sinhVienRepo: Repository<SinhVien>,
    @InjectRepository(GiangVien) private giangVienRepo: Repository<GiangVien>,
    private jwtService: JwtService,
  ) {}

  async login(email: string, matKhau: string) {
    const user = await this.nguoiDungRepo.findOne({
      where: { email },
      relations: ["vaiTro"],
    });
    if (!user) throw new UnauthorizedException("Email khong ton tai");

    // ✅ So sánh plain text trực tiếp thay vì bcrypt
    if (matKhau !== user.mat_khau) {
      throw new UnauthorizedException("Mat khau khong dung");
    }

    const vaiTro = user.vaiTro?.ten_vai_tro?.toLowerCase() || "sinh_vien";
    let profileId = null,
      hoTen = email;

    if (vaiTro === "sinh_vien") {
      const sv = await this.sinhVienRepo.findOne({
        where: { nguoi_dung_id: user.id },
      });
      if (sv) {
        profileId = sv.id;
        hoTen = sv.ho_ten || email;
      }
    }

    if (vaiTro === "giang_vien") {
      const gv = await this.giangVienRepo.findOne({
        where: { nguoi_dung_id: user.id },
      });
      if (gv) {
        profileId = gv.id;
        hoTen = gv.ho_ten || email;
      }
    }

    const payload = {
      sub: user.id,
      email: user.email,
      vaiTro,
      profileId,
      hoTen,
    };

    return {
      access_token: this.jwtService.sign(payload),
      vaiTro,
      profileId,
      hoTen,
      email: user.email,
    };
  }

  async getMe(userId: number) {
    return this.nguoiDungRepo.findOne({
      where: { id: userId },
      relations: ["vaiTro"],
    });
  }
}
