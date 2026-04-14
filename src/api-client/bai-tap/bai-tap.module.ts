import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Controller, Get, Post, Body, Param, UseGuards, Request } from '@nestjs/common';
import { BaiTap, NopBai } from '../entities';
import { JwtAuthGuard } from '../auth/jwt.guard';
import * as nodemailer from 'nodemailer';
@Injectable()
export class BaiTapService {
  constructor(@InjectRepository(BaiTap) private btRepo: Repository<BaiTap>, @InjectRepository(NopBai) private nbRepo: Repository<NopBai>) {}
  async taoBaiTap(dto: Partial<BaiTap>) { return this.btRepo.save(this.btRepo.create(dto)); }
  async getBaiTapTheoLop(lopId: number) { return this.btRepo.find({ where: { lop_hoc_phan_id: lopId }, order: { han_nop: 'ASC' } }); }
  async getBaiTapSinhVien(svId: number, lopId: number) {
    return this.btRepo.manager.query(`SELECT bt.id,bt.ten_bai_tap,bt.mo_ta,bt.han_nop,bt.ngay_tao,nb.id as nop_bai_id,nb.ngay_nop,nb.trang_thai as trang_thai_nop,CASE WHEN nb.id IS NOT NULL THEN true ELSE false END as da_nop FROM bai_tap bt LEFT JOIN nop_bai nb ON nb.bai_tap_id=bt.id AND nb.sinh_vien_id=$1 WHERE bt.lop_hoc_phan_id=$2 ORDER BY bt.han_nop`, [svId, lopId]);
  }
  async nopBai(svId: number, btId: number) {
    const bt = await this.btRepo.findOne({ where: { id: btId } });
    if (!bt) throw new BadRequestException('Bai tap khong ton tai');
    const ex = await this.nbRepo.findOne({ where: { bai_tap_id: btId, sinh_vien_id: svId } });
    if (ex) throw new BadRequestException('Ban da nop bai nay roi');
    const saved = await this.nbRepo.save(this.nbRepo.create({ bai_tap_id: btId, sinh_vien_id: svId, ngay_nop: new Date(), trang_thai: 'da_nop' }));
    this.guiEmail(svId, btId).catch(e => console.log('Email error:', e.message));
    return saved;
  }
  async getDanhSachNopBai(btId: number) {
    return this.nbRepo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,nb.ngay_nop,nb.trang_thai,bt.ten_bai_tap,bt.han_nop,CASE WHEN nb.ngay_nop<=bt.han_nop THEN 'dung_han' ELSE 'tre_han' END as ket_qua FROM nop_bai nb JOIN sinh_vien sv ON sv.id=nb.sinh_vien_id JOIN bai_tap bt ON bt.id=nb.bai_tap_id WHERE nb.bai_tap_id=$1 ORDER BY nb.ngay_nop DESC`, [btId]);
  }
  private async guiEmail(svId: number, btId: number) {
    if (!process.env.MAIL_USER || !process.env.MAIL_PASS) return;
    const d = await this.nbRepo.manager.query(`SELECT sv.ho_ten,nd.email,bt.ten_bai_tap,bt.han_nop,hp.ten_hoc_phan FROM sinh_vien sv JOIN nguoi_dung nd ON nd.id=sv.nguoi_dung_id JOIN bai_tap bt ON bt.id=$2 JOIN lop_hoc_phan lhp ON lhp.id=bt.lop_hoc_phan_id JOIN hoc_phan hp ON hp.id=lhp.hoc_phan_id WHERE sv.id=$1`, [svId, btId]);
    if (!d.length || !d[0].email) return;
    const t = nodemailer.createTransport({ service: 'gmail', auth: { user: process.env.MAIL_USER, pass: process.env.MAIL_PASS } });
    await t.sendMail({ from: `"QLSV" <${process.env.MAIL_USER}>`, to: d[0].email, subject: `Nop bai thanh cong - ${d[0].ten_bai_tap}`, html: `<p>Xin chao ${d[0].ho_ten}, ban da nop bai <b>${d[0].ten_bai_tap}</b> thanh cong!</p>` });
  }
}
@Controller('bai-tap') @UseGuards(JwtAuthGuard)
export class BaiTapController {
  constructor(private service: BaiTapService) {}
  @Post() taoBaiTap(@Body() b: any, @Request() req) { return this.service.taoBaiTap({ ...b, giang_vien_id: req.user.profileId }); }
  @Get('lop/:lopId') getBaiTapLop(@Param('lopId') lopId: number) { return this.service.getBaiTapTheoLop(lopId); }
  @Get('sinh-vien/:lopId') getBaiTapSV(@Param('lopId') lopId: number, @Request() req) { return this.service.getBaiTapSinhVien(req.user.profileId, lopId); }
  @Post(':id/nop') nopBai(@Param('id') id: number, @Request() req) { return this.service.nopBai(req.user.profileId, id); }
  @Get(':id/danh-sach-nop') getDSNop(@Param('id') id: number) { return this.service.getDanhSachNopBai(id); }
}
@Module({ imports: [TypeOrmModule.forFeature([BaiTap, NopBai])], controllers: [BaiTapController], providers: [BaiTapService] })
export class BaiTapModule {}
