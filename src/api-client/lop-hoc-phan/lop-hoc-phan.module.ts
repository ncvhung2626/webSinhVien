import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Controller, Get, Post, Body, Param, UseGuards, Request } from '@nestjs/common';
import { LopHocPhan, BuoiHoc, PhienDiemDanh, DangKyHoc, LichHoc } from '../entities';
import { JwtAuthGuard } from '../auth/jwt.guard';
import * as QRCode from 'qrcode';
import { v4 as uuidv4 } from 'uuid';

@Injectable()
export class LopHocPhanService {
  constructor(
    @InjectRepository(LopHocPhan) private lopRepo: Repository<LopHocPhan>,
    @InjectRepository(BuoiHoc) private buoiHocRepo: Repository<BuoiHoc>,
    @InjectRepository(PhienDiemDanh) private phienRepo: Repository<PhienDiemDanh>,
    @InjectRepository(DangKyHoc) private dangKyRepo: Repository<DangKyHoc>,
  ) {}

  // Lớp của giảng viên (qua phan_cong_giang_day hoặc giang_vien_id)
  async getLopCuaGiangVien(giangVienId: number) {
    return this.lopRepo
      .createQueryBuilder('lhp')
      .leftJoinAndSelect('lhp.hocPhan', 'hp')
      .leftJoinAndSelect('lhp.giangVien', 'gv')
      .where('lhp.giang_vien_id = :id', { id: giangVienId })
      .getMany();
  }

  // Lớp của sinh viên
  async getLopCuaSinhVien(sinhVienId: number) {
    return this.lopRepo
      .createQueryBuilder('lhp')
      .leftJoinAndSelect('lhp.hocPhan', 'hp')
      .innerJoin(DangKyHoc, 'dkh', 'dkh.lop_hoc_phan_id = lhp.id AND dkh.sinh_vien_id = :id', { id: sinhVienId })
      .getMany();
  }

  // Chi tiết lớp
  async getChiTiet(lopId: number) {
    const lop = await this.lopRepo
      .createQueryBuilder('lhp')
      .leftJoinAndSelect('lhp.hocPhan', 'hp')
      .leftJoinAndSelect('lhp.giangVien', 'gv')
      .where('lhp.id = :id', { id: lopId })
      .getOne();

    const tongSV = await this.dangKyRepo.count({ where: { lop_hoc_phan_id: lopId } });
    const buoiHocs = await this.buoiHocRepo.find({ where: { lop_hoc_phan_id: lopId }, order: { ngay_hoc: 'DESC' } });
    const lichHoc = await this.lopRepo.manager.query(`SELECT * FROM lich_hoc WHERE lop_hoc_phan_id = $1`, [lopId]);

    return { lop, tongSinhVien: tongSV, buoiHocs, lichHoc };
  }

  // Thống kê buổi học
  async getThongKeBuoiHoc(lopId: number) {
    return this.lopRepo.manager.query(`
      SELECT bh.id, bh.ngay_hoc, bh.trang_thai,
        COUNT(CASE WHEN dd.trang_thai = 'co_mat' THEN 1 END)::int as so_co_mat,
        COUNT(CASE WHEN dd.trang_thai != 'co_mat' OR dd.id IS NULL THEN 1 END)::int as so_vang,
        (SELECT COUNT(*) FROM dang_ky_hoc WHERE lop_hoc_phan_id = $1)::int as tong_sv
      FROM buoi_hoc bh
      LEFT JOIN diem_danh dd ON dd.buoi_hoc_id = bh.id
      WHERE bh.lop_hoc_phan_id = $1
      GROUP BY bh.id, bh.ngay_hoc, bh.trang_thai
      ORDER BY bh.ngay_hoc DESC
    `, [lopId]);
  }

  // Tạo buổi học
  async taoBuoiHoc(lopId: number, ngayHoc: string, trangThai: string = 'hoc') {
    const buoi = this.buoiHocRepo.create({ lop_hoc_phan_id: lopId, ngay_hoc: new Date(ngayHoc), trang_thai: trangThai });
    return this.buoiHocRepo.save(buoi);
  }

  // Tạo phiên điểm danh QR
  async taoPhienDiemDanh(buoiHocId: number, thoiGianPhut: number = 15) {
    const buoi = await this.buoiHocRepo.findOne({ where: { id: buoiHocId } });
    if (!buoi) throw new BadRequestException('Buổi học không tồn tại');

    const maQR = uuidv4();
    const batDau = new Date();
    const ketThuc = new Date(batDau.getTime() + thoiGianPhut * 60000);

    const phien = this.phienRepo.create({ buoi_hoc_id: buoiHocId, ma_qr_phien: maQR, bat_dau: batDau, ket_thuc: ketThuc });
    const saved = await this.phienRepo.save(phien);

    const qrImage = await QRCode.toDataURL(maQR);
    return { phien: saved, qrImage, maQR, ketThuc };
  }

  // Điểm học phần theo lớp (tính từ % điểm danh + số bài nộp)
  async getDiemHocPhan(lopId: number) {
    return this.lopRepo.manager.query(`
      SELECT
        sv.id, sv.mssv, sv.ho_ten, sv.lop,
        COUNT(DISTINCT bh.id)::int as tong_buoi,
        COUNT(DISTINCT CASE WHEN dd.trang_thai = 'co_mat' THEN dd.id END)::int as so_co_mat,
        CASE WHEN COUNT(DISTINCT bh.id) > 0
          THEN ROUND(COUNT(DISTINCT CASE WHEN dd.trang_thai = 'co_mat' THEN dd.id END)::numeric
               / COUNT(DISTINCT bh.id)::numeric * 10, 1)
          ELSE 0 END as diem_chuyen_can,
        COUNT(DISTINCT bt.id)::int as tong_bai_tap,
        COUNT(DISTINCT nb.id)::int as so_bai_da_nop
      FROM dang_ky_hoc dkh
      JOIN sinh_vien sv ON sv.id = dkh.sinh_vien_id
      LEFT JOIN buoi_hoc bh ON bh.lop_hoc_phan_id = $1
      LEFT JOIN diem_danh dd ON dd.buoi_hoc_id = bh.id AND dd.sinh_vien_id = sv.id
      LEFT JOIN bai_tap bt ON bt.lop_hoc_phan_id = $1
      LEFT JOIN nop_bai nb ON nb.bai_tap_id = bt.id AND nb.sinh_vien_id = sv.id
      WHERE dkh.lop_hoc_phan_id = $1
      GROUP BY sv.id, sv.mssv, sv.ho_ten, sv.lop
      ORDER BY sv.ho_ten ASC
    `, [lopId]);
  }

  // Điểm học phần cá nhân sinh viên (tất cả lớp đã đăng ký)
  async getDiemCaNhanSV(sinhVienId: number) {
    return this.lopRepo.manager.query(`
      SELECT
        hp.ten_hoc_phan, hp.so_tin_chi, lhp.ma_lop, lhp.hoc_ky,
        COUNT(DISTINCT bh.id)::int as tong_buoi,
        COUNT(DISTINCT CASE WHEN dd.trang_thai = 'co_mat' THEN dd.id END)::int as so_co_mat,
        CASE WHEN COUNT(DISTINCT bh.id) > 0
          THEN ROUND(COUNT(DISTINCT CASE WHEN dd.trang_thai = 'co_mat' THEN dd.id END)::numeric
               / COUNT(DISTINCT bh.id)::numeric * 10, 1)
          ELSE 0 END as diem_chuyen_can,
        COUNT(DISTINCT bt.id)::int as tong_bai_tap,
        COUNT(DISTINCT nb.id)::int as so_bai_da_nop
      FROM dang_ky_hoc dkh
      JOIN lop_hoc_phan lhp ON lhp.id = dkh.lop_hoc_phan_id
      JOIN hoc_phan hp ON hp.id = lhp.hoc_phan_id
      LEFT JOIN buoi_hoc bh ON bh.lop_hoc_phan_id = lhp.id
      LEFT JOIN diem_danh dd ON dd.buoi_hoc_id = bh.id AND dd.sinh_vien_id = $1
      LEFT JOIN bai_tap bt ON bt.lop_hoc_phan_id = lhp.id
      LEFT JOIN nop_bai nb ON nb.bai_tap_id = bt.id AND nb.sinh_vien_id = $1
      WHERE dkh.sinh_vien_id = $1
      GROUP BY hp.ten_hoc_phan, hp.so_tin_chi, lhp.ma_lop, lhp.hoc_ky
      ORDER BY lhp.hoc_ky DESC, hp.ten_hoc_phan ASC
    `, [sinhVienId]);
  }

  // Lấy phiên QR còn hiệu lực
  async getPhienHienTai(buoiHocId: number) {
    const phien = await this.phienRepo
      .createQueryBuilder('p')
      .where('p.buoi_hoc_id = :id AND p.ket_thuc > NOW()', { id: buoiHocId })
      .orderBy('p.bat_dau', 'DESC')
      .getOne();

    if (!phien) return { active: false };

    const qrImage = await QRCode.toDataURL(phien.ma_qr_phien);
    return { active: true, phien, qrImage };
  }
}

@Controller('lop-hoc-phan')
@UseGuards(JwtAuthGuard)
export class LopHocPhanController {
  constructor(private service: LopHocPhanService) {}

  @Get('giang-vien')
  getLopGV(@Request() req) { return this.service.getLopCuaGiangVien(req.user.profileId); }

  @Get('sinh-vien')
  getLopSV(@Request() req) { return this.service.getLopCuaSinhVien(req.user.profileId); }

  @Get(':id/chi-tiet')
  getChiTiet(@Param('id') id: number) { return this.service.getChiTiet(id); }

  @Get(':id/thong-ke')
  getThongKe(@Param('id') id: number) { return this.service.getThongKeBuoiHoc(id); }

  @Post(':id/buoi-hoc')
  taoBuoiHoc(@Param('id') id: number, @Body() body: { ngay_hoc: string; trang_thai?: string }) {
    return this.service.taoBuoiHoc(id, body.ngay_hoc, body.trang_thai);
  }

  @Post('buoi-hoc/:buoiId/phien-diem-danh')
  taoPhien(@Param('buoiId') buoiId: number, @Body() body: { thoi_gian_phut?: number }) {
    return this.service.taoPhienDiemDanh(buoiId, body.thoi_gian_phut || 15);
  }

  @Get('buoi-hoc/:buoiId/phien-hien-tai')
  getPhienHienTai(@Param('buoiId') buoiId: number) {
    return this.service.getPhienHienTai(buoiId);
  }

  @Get(':id/diem-hoc-phan')
  getDiemHP(@Param('id') id: number) { return this.service.getDiemHocPhan(id); }

  @Get('diem-ca-nhan/sinh-vien')
  getDiemCaNhan(@Request() req) { return this.service.getDiemCaNhanSV(req.user.profileId); }
}

@Module({
  imports: [TypeOrmModule.forFeature([LopHocPhan, BuoiHoc, PhienDiemDanh, DangKyHoc])],
  controllers: [LopHocPhanController],
  providers: [LopHocPhanService],
  exports: [LopHocPhanService],
})
export class LopHocPhanModule {}
