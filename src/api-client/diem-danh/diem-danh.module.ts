import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Controller, Get, Post, Body, Param, UseGuards, Request } from '@nestjs/common';
import { DiemDanh, PhienDiemDanh } from '../entities';
import { JwtAuthGuard } from '../auth/jwt.guard';
@Injectable()
export class DiemDanhService {
  constructor(@InjectRepository(DiemDanh) private repo: Repository<DiemDanh>, @InjectRepository(PhienDiemDanh) private phienRepo: Repository<PhienDiemDanh>) {}
  async diemDanhQR(maQR: string, svId: number) {
    const phien = await this.phienRepo.createQueryBuilder('p').where('p.ma_qr_phien=:maQR AND p.ket_thuc>NOW()', { maQR }).getOne();
    if (!phien) throw new BadRequestException('Ma QR khong hop le hoac het han');
    const ex = await this.repo.findOne({ where: { buoi_hoc_id: phien.buoi_hoc_id, sinh_vien_id: svId } });
    if (ex) throw new BadRequestException('Ban da diem danh roi');
    return this.repo.save(this.repo.create({ buoi_hoc_id: phien.buoi_hoc_id, sinh_vien_id: svId, trang_thai: 'co_mat', hinh_thuc: 'qr' }));
  }
  async getDiemDanhBuoi(buoiId: number) { return this.repo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,COALESCE(dd.trang_thai,'vang') as trang_thai,dd.thoi_gian,dd.hinh_thuc FROM dang_ky_hoc dkh JOIN sinh_vien sv ON sv.id=dkh.sinh_vien_id JOIN buoi_hoc bh ON bh.id=$1 AND bh.lop_hoc_phan_id=dkh.lop_hoc_phan_id LEFT JOIN diem_danh dd ON dd.buoi_hoc_id=$1 AND dd.sinh_vien_id=sv.id ORDER BY sv.ho_ten`, [buoiId]); }
  async getThongKeVang(lopId: number) { return this.repo.manager.query(`SELECT sv.mssv,sv.ho_ten,sv.lop,COUNT(bh.id)::int as tong_buoi,COUNT(CASE WHEN dd.trang_thai='co_mat' THEN 1 END)::int as so_co_mat,(COUNT(bh.id)-COUNT(CASE WHEN dd.trang_thai='co_mat' THEN 1 END))::int as so_vang FROM dang_ky_hoc dkh JOIN sinh_vien sv ON sv.id=dkh.sinh_vien_id CROSS JOIN buoi_hoc bh LEFT JOIN diem_danh dd ON dd.buoi_hoc_id=bh.id AND dd.sinh_vien_id=sv.id WHERE dkh.lop_hoc_phan_id=$1 AND bh.lop_hoc_phan_id=$1 GROUP BY sv.id,sv.mssv,sv.ho_ten,sv.lop ORDER BY so_vang DESC`, [lopId]); }
  async getLichSuVang(svId: number) { return this.repo.manager.query(`SELECT bh.ngay_hoc,hp.ten_hoc_phan,lhp.ma_lop,COALESCE(dd.trang_thai,'vang') as trang_thai,dd.thoi_gian,dd.hinh_thuc FROM dang_ky_hoc dkh JOIN lop_hoc_phan lhp ON lhp.id=dkh.lop_hoc_phan_id JOIN hoc_phan hp ON hp.id=lhp.hoc_phan_id JOIN buoi_hoc bh ON bh.lop_hoc_phan_id=lhp.id LEFT JOIN diem_danh dd ON dd.buoi_hoc_id=bh.id AND dd.sinh_vien_id=$1 WHERE dkh.sinh_vien_id=$1 ORDER BY bh.ngay_hoc DESC`, [svId]); }
  async ghiVang(buoiId: number, svId: number) {
    const ex = await this.repo.findOne({ where: { buoi_hoc_id: buoiId, sinh_vien_id: svId } });
    if (ex) { await this.repo.update(ex.id, { trang_thai: 'vang' }); return { message: 'Da cap nhat' }; }
    return this.repo.save(this.repo.create({ buoi_hoc_id: buoiId, sinh_vien_id: svId, trang_thai: 'vang', hinh_thuc: 'thu_cong' }));
  }
}
@Controller('diem-danh') @UseGuards(JwtAuthGuard)
export class DiemDanhController {
  constructor(private service: DiemDanhService) {}
  @Post('qr') diemDanhQR(@Body() b: { ma_qr: string }, @Request() req) { return this.service.diemDanhQR(b.ma_qr, req.user.profileId); }
  @Get('buoi/:buoiId') getDiemDanhBuoi(@Param('buoiId') buoiId: number) { return this.service.getDiemDanhBuoi(buoiId); }
  @Get('thong-ke-vang/:lopId') getThongKeVang(@Param('lopId') lopId: number) { return this.service.getThongKeVang(lopId); }
  @Get('lich-su-vang') getLichSuVang(@Request() req) { return this.service.getLichSuVang(req.user.profileId); }
  @Post('ghi-vang') ghiVang(@Body() b: { buoi_hoc_id: number; sinh_vien_id: number }) { return this.service.ghiVang(b.buoi_hoc_id, b.sinh_vien_id); }
}
@Module({ imports: [TypeOrmModule.forFeature([DiemDanh, PhienDiemDanh])], controllers: [DiemDanhController], providers: [DiemDanhService] })
export class DiemDanhModule {}
