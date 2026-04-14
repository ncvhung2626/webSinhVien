import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Controller, Get, Param, UseGuards, Request } from '@nestjs/common';
import { DiemRenLuyen } from '../entities';
import { JwtAuthGuard } from '../auth/jwt.guard';
@Injectable()
export class DiemRenLuyenService {
  constructor(@InjectRepository(DiemRenLuyen) private repo: Repository<DiemRenLuyen>) {}
  async getDiemCaNhan(id: number) { return this.repo.find({ where: { sinh_vien_id: id }, order: { hoc_ky: 'DESC' } }); }
  async getDiemTheoLop(lopId: number) { return this.repo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,drl.tong_diem,drl.xep_loai,drl.hoc_ky FROM diem_ren_luyen drl JOIN sinh_vien sv ON sv.id=drl.sinh_vien_id WHERE sv.id IN(SELECT sinh_vien_id FROM dang_ky_hoc WHERE lop_hoc_phan_id=$1) ORDER BY drl.hoc_ky DESC,sv.ho_ten`, [lopId]); }
  async getDiemTatCa() { return this.repo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,drl.tong_diem,drl.xep_loai,drl.hoc_ky FROM diem_ren_luyen drl JOIN sinh_vien sv ON sv.id=drl.sinh_vien_id ORDER BY drl.hoc_ky DESC,sv.ho_ten`); }
}
@Controller('diem-ren-luyen') @UseGuards(JwtAuthGuard)
export class DiemRenLuyenController {
  constructor(private service: DiemRenLuyenService) {}
  @Get('ca-nhan') getCaNhan(@Request() req) { return this.service.getDiemCaNhan(req.user.profileId); }
  @Get('theo-lop/:lopId') getTheoLop(@Param('lopId') lopId: number) { return this.service.getDiemTheoLop(lopId); }
  @Get('tat-ca') getTatCa() { return this.service.getDiemTatCa(); }
}
@Module({ imports: [TypeOrmModule.forFeature([DiemRenLuyen])], controllers: [DiemRenLuyenController], providers: [DiemRenLuyenService] })
export class DiemRenLuyenModule {}
