import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Controller, Get, Param, UseGuards, Request } from '@nestjs/common';
import { SinhVien } from '../entities';
import { JwtAuthGuard } from '../auth/jwt.guard';
@Injectable()
export class SinhVienService {
  constructor(@InjectRepository(SinhVien) private repo: Repository<SinhVien>) {}
  async getThongTinCaNhan(id: number) { return this.repo.findOne({ where: { id } }); }
  async getDanhSachTheoLop(lopId: number) {
    return this.repo.manager.query(`SELECT sv.id,sv.mssv,sv.ho_ten,sv.lop,sv.ma_qr,nd.email FROM dang_ky_hoc dkh JOIN sinh_vien sv ON sv.id=dkh.sinh_vien_id JOIN nguoi_dung nd ON nd.id=sv.nguoi_dung_id WHERE dkh.lop_hoc_phan_id=$1 ORDER BY sv.ho_ten`, [lopId]);
  }
  async getDanhSachTatCa() {
    return this.repo.manager.query(`SELECT sv.id,sv.mssv,sv.ho_ten,sv.lop,sv.ma_qr,nd.email FROM sinh_vien sv JOIN nguoi_dung nd ON nd.id=sv.nguoi_dung_id ORDER BY sv.ho_ten`);
  }
}
@Controller('sinh-vien') @UseGuards(JwtAuthGuard)
export class SinhVienController {
  constructor(private service: SinhVienService) {}
  @Get('ca-nhan') getCaNhan(@Request() req) { return this.service.getThongTinCaNhan(req.user.profileId); }
  @Get('lop/:lopId') getDanhSach(@Param('lopId') lopId: number) { return this.service.getDanhSachTheoLop(lopId); }
  @Get('tat-ca') getTatCa() { return this.service.getDanhSachTatCa(); }
}
@Module({ imports: [TypeOrmModule.forFeature([SinhVien])], controllers: [SinhVienController], providers: [SinhVienService], exports: [SinhVienService] })
export class SinhVienModule {}
