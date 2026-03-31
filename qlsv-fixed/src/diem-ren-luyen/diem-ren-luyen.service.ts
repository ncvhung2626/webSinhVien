// Service DiemRenLuyen – xem và cập nhật điểm rèn luyện
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository }              from '@nestjs/typeorm';
import { Repository }                    from 'typeorm';
import { DiemRenLuyen }       from './entities/diem-ren-luyen.entity';
import { LichSuDiemRenLuyen } from './entities/lich-su-drl.entity';
import { CapNhatDrlDto, CongDiemDto } from './dto/diem-ren-luyen.dto';

@Injectable()
export class DiemRenLuyenService {
  constructor(
    // Repository bảng diem_ren_luyen
    @InjectRepository(DiemRenLuyen)
    private drlRepo: Repository<DiemRenLuyen>,

    // Repository bảng lich_su_diem_ren_luyen
    @InjectRepository(LichSuDiemRenLuyen)
    private lichSuRepo: Repository<LichSuDiemRenLuyen>,
  ) {}

  // GET điểm rèn luyện của sinh viên theo tất cả học kỳ
  findBySinhVien(sinhVienId: number) {
    return this.drlRepo.find({
      where: { sinhVienId },
      order: { hocKy: 'DESC' },
    });
  }

  // GET điểm rèn luyện học kỳ hiện tại của sinh viên
  async findHienTai(sinhVienId: number, hocKy: string) {
    const drl = await this.drlRepo.findOne({ where: { sinhVienId, hocKy } });
    if (!drl) throw new NotFoundException('Chưa có điểm rèn luyện học kỳ này');
    return drl;
  }

  // GET lịch sử thay đổi điểm rèn luyện của sinh viên
  findLichSu(sinhVienId: number) {
    return this.lichSuRepo.find({
      where: { sinhVienId },
      order: { ngayCapNhat: 'DESC' },
    });
  }

  // PUT cập nhật tổng điểm rèn luyện – tự tính xếp loại
  async capNhat(dto: CapNhatDrlDto) {
    const xepLoai = this.tinhXepLoai(dto.tongDiem);
    let drl = await this.drlRepo.findOne({
      where: { sinhVienId: dto.sinhVienId, hocKy: dto.hocKy },
    });
    if (drl) {
      await this.drlRepo.update(drl.id, { tongDiem: dto.tongDiem, xepLoai });
    } else {
      drl = this.drlRepo.create({ ...dto, xepLoai });
      await this.drlRepo.save(drl);
    }
    return this.drlRepo.findOne({ where: { sinhVienId: dto.sinhVienId, hocKy: dto.hocKy } });
  }

  // PUT cộng / trừ điểm rèn luyện và ghi lịch sử
  async congDiem(dto: CongDiemDto) {
    // Tìm bản ghi điểm hiện tại (học kỳ mới nhất)
    const drl = await this.drlRepo.findOne({
      where: { sinhVienId: dto.sinhVienId },
      order: { hocKy: 'DESC' },
    });
    if (!drl) throw new NotFoundException('Chưa có bản ghi điểm rèn luyện');

    const tongMoi = Math.min(100, Math.max(0, drl.tongDiem + dto.diemThayDoi));
    await this.drlRepo.update(drl.id, { tongDiem: tongMoi, xepLoai: this.tinhXepLoai(tongMoi) });

    // Ghi lịch sử
    const ls = this.lichSuRepo.create({
      sinhVienId:   dto.sinhVienId,
      diemThayDoi:  dto.diemThayDoi,
      lyDo:         dto.lyDo,
    });
    await this.lichSuRepo.save(ls);

    return { tongDiem: tongMoi, xepLoai: this.tinhXepLoai(tongMoi) };
  }

  // Tính xếp loại từ tổng điểm
  private tinhXepLoai(diem: number): string {
    if (diem >= 90) return 'xuat_sac';
    if (diem >= 80) return 'tot';
    if (diem >= 65) return 'kha';
    if (diem >= 50) return 'trung_binh';
    return 'yeu';
  }
}
