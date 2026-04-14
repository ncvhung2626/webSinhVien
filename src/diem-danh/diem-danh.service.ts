import { Injectable, BadRequestException, NotFoundException } from '@nestjs/common';
import { InjectRepository }                                    from '@nestjs/typeorm';
import { Repository }                                          from 'typeorm';
import { v4 as uuidv4 }       from 'uuid';
import { DiemDanh }           from './entities/diem-danh.entity';
import { PhienDiemDanh }      from './entities/phien-diem-danh.entity';
import { TaoPhienDto, QuetQrDto } from './dto/diem-danh.dto';

@Injectable()
export class DiemDanhService {
  constructor(
    @InjectRepository(DiemDanh)
    private readonly diemDanhRepo: Repository<DiemDanh>,
    @InjectRepository(PhienDiemDanh)
    private readonly phienRepo: Repository<PhienDiemDanh>,
  ) {}

  async taoPhien(dto: TaoPhienDto): Promise<PhienDiemDanh> {
    const phut = dto.thoiGianPhut || 10;
    const now  = new Date();
    const phien = this.phienRepo.create({
      lopHocPhanId:   dto.lopHocPhanId,
      maQrSession:    uuidv4(),
      batDau:         now,
      thoiGianHetHan: new Date(now.getTime() + phut * 60 * 1000),
      daDong:         false,  // BUG FIX: khởi tạo tường minh
    });
    return this.phienRepo.save(phien);
  }

  async dongPhien(phienId: number) {
    // BUG FIX: set cả daDong=true lẫn thoiGianHetHan=now để đóng phiên đúng cách
    await this.phienRepo.update(phienId, { daDong: true, thoiGianHetHan: new Date() });
    return { message: 'Đã đóng phiên điểm danh' };
  }

  async quetQr(dto: QuetQrDto) {
    const phien = await this.phienRepo.findOne({ where: { maQrSession: dto.maQrSession } });
    if (!phien) throw new NotFoundException('Mã QR không hợp lệ');

    // BUG FIX: kiểm tra cả cờ daDong lẫn thời gian hết hạn
    const hetHan = phien.thoiGianHetHan && new Date() > phien.thoiGianHetHan;
    if (phien.daDong || hetHan) throw new BadRequestException('Phiên điểm danh đã đóng hoặc hết hạn');

    const exists = await this.diemDanhRepo.findOne({
      where: { sinhVienId: dto.sinhVienId, buoiHocId: phien.id },
    });
    if (exists) throw new BadRequestException('Bạn đã điểm danh phiên này rồi');

    const dd = this.diemDanhRepo.create({
      buoiHocId:  phien.id,
      sinhVienId: dto.sinhVienId,
      trangThai:  'co_mat',
      hinhThuc:   'qr_code',
    });
    await this.diemDanhRepo.save(dd);
    return { message: 'Điểm danh thành công!', thoiGian: dd.thoiGian };
  }

  findBySinhVien(sinhVienId: number): Promise<DiemDanh[]> {
    return this.diemDanhRepo.find({
      where: { sinhVienId },
      order: { thoiGian: 'DESC' },
    });
  }

  findByBuoiHoc(buoiHocId: number): Promise<DiemDanh[]> {
    return this.diemDanhRepo.find({
      where: { buoiHocId },
      relations: ['sinhVien'],
    });
  }

  async suaTrangThai(id: number, trangThai: string): Promise<DiemDanh> {
    const dd = await this.diemDanhRepo.findOne({ where: { id } });
    if (!dd) throw new NotFoundException(`Không tìm thấy bản ghi điểm danh id=${id}`);
    await this.diemDanhRepo.update(id, { trangThai, hinhThuc: 'thu_cong' });
    return this.diemDanhRepo.findOne({ where: { id } });
  }
}
