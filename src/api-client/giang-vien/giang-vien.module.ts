import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Controller, Get, UseGuards, Request } from '@nestjs/common';
import { GiangVien } from '../entities';
import { JwtAuthGuard } from '../auth/jwt.guard';
@Injectable()
export class GiangVienService {
  constructor(@InjectRepository(GiangVien) private repo: Repository<GiangVien>) {}
  async getThongTin(id: number) { return this.repo.findOne({ where: { id } }); }
  async getDanhSachTatCa() { return this.repo.manager.query(`SELECT gv.id,gv.ho_ten,gv.bo_mon,nd.email FROM giang_vien gv JOIN nguoi_dung nd ON nd.id=gv.nguoi_dung_id ORDER BY gv.ho_ten`); }
}
@Controller('giang-vien') @UseGuards(JwtAuthGuard)
export class GiangVienController {
  constructor(private service: GiangVienService) {}
  @Get('ca-nhan') getCaNhan(@Request() req) { return this.service.getThongTin(req.user.profileId); }
  @Get('tat-ca') getTatCa() { return this.service.getDanhSachTatCa(); }
}
@Module({ imports: [TypeOrmModule.forFeature([GiangVien])], controllers: [GiangVienController], providers: [GiangVienService], exports: [GiangVienService] })
export class GiangVienModule {}
