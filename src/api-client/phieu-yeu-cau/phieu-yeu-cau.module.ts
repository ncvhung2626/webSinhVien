import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Controller, Get, Post, Put, Body, Param, UseGuards, Request } from '@nestjs/common';
import { PhieuYeuCau } from '../entities';
import { JwtAuthGuard } from '../auth/jwt.guard';
@Injectable()
export class PhieuYeuCauService {
  constructor(@InjectRepository(PhieuYeuCau) private repo: Repository<PhieuYeuCau>) {}
  async tao(svId: number, loai: string, nd: string) { return this.repo.save(this.repo.create({ sinh_vien_id: svId, loai_yeu_cau: loai, noi_dung: nd })); }
  async getCuaSV(id: number) { return this.repo.find({ where: { sinh_vien_id: id }, order: { ngay_tao: 'DESC' } }); }
  async getTatCa() { return this.repo.manager.query(`SELECT pyc.*,sv.mssv,sv.ho_ten,sv.lop FROM phieu_yeu_cau pyc JOIN sinh_vien sv ON sv.id=pyc.sinh_vien_id ORDER BY pyc.ngay_tao DESC`); }
  async capNhat(id: number, tt: string) { await this.repo.update(id, { trang_thai: tt }); return this.repo.findOne({ where: { id } }); }
}
@Controller('phieu-yeu-cau') @UseGuards(JwtAuthGuard)
export class PhieuYeuCauController {
  constructor(private service: PhieuYeuCauService) {}
  @Post() tao(@Body() b: any, @Request() req) { return this.service.tao(req.user.profileId, b.loai_yeu_cau, b.noi_dung); }
  @Get('cua-toi') getCuaToi(@Request() req) { return this.service.getCuaSV(req.user.profileId); }
  @Get('tat-ca') getTatCa() { return this.service.getTatCa(); }
  @Put(':id/trang-thai') capNhat(@Param('id') id: number, @Body() b: any) { return this.service.capNhat(id, b.trang_thai); }
}
@Module({ imports: [TypeOrmModule.forFeature([PhieuYeuCau])], controllers: [PhieuYeuCauController], providers: [PhieuYeuCauService] })
export class PhieuYeuCauModule {}
