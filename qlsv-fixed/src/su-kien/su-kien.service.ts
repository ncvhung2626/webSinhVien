// Service SuKien – quản lý sự kiện và đăng ký tham gia
import { Injectable, NotFoundException, ConflictException } from '@nestjs/common';
import { InjectRepository }                                  from '@nestjs/typeorm';
import { Repository }                                        from 'typeorm';
import { SuKien }                         from './entities/su-kien.entity';
import { DangKySuKien }                   from './entities/dang-ky-su-kien.entity';
import { CreateSuKienDto, DangKySuKienDto } from './dto/su-kien.dto';
import { DiemRenLuyenService }            from '../diem-ren-luyen/diem-ren-luyen.service';

@Injectable()
export class SuKienService {
  constructor(
    // Repository bảng su_kien
    @InjectRepository(SuKien)
    private suKienRepo: Repository<SuKien>,

    // Repository bảng dang_ky_su_kien
    @InjectRepository(DangKySuKien)
    private dangKyRepo: Repository<DangKySuKien>,

    // Inject DiemRenLuyenService để cộng điểm sau khi đăng ký
    private diemRenLuyenService: DiemRenLuyenService,
  ) {}

  // GET tất cả sự kiện (sắp xếp theo ngày)
  findAll() {
    return this.suKienRepo.find({ order: { ngayToChuc: 'ASC' } });
  }

  // GET chi tiết một sự kiện
  async findOne(id: number) {
    const sk = await this.suKienRepo.findOne({ where: { id } });
    if (!sk) throw new NotFoundException(`Không tìm thấy sự kiện id=${id}`);
    return sk;
  }

  // GET danh sách sự kiện sinh viên đã đăng ký
  findBySinhVien(sinhVienId: number) {
    return this.dangKyRepo.find({
      where: { sinhVienId },
      relations: ['suKien'],
    });
  }

  // GET danh sách sinh viên đăng ký một sự kiện
  findDanhSachDangKy(suKienId: number) {
    return this.dangKyRepo.find({
      where: { suKienId },
      relations: ['sinhVien'],
    });
  }

  // POST tạo sự kiện mới
  create(dto: CreateSuKienDto) {
    const sk = this.suKienRepo.create(dto);
    return this.suKienRepo.save(sk);
  }

  // DELETE xoá sự kiện
  async remove(id: number) {
    await this.findOne(id);
    return this.suKienRepo.delete(id);
  }

  // POST sinh viên đăng ký sự kiện – cộng điểm rèn luyện ngay khi đăng ký
  async dangKy(dto: DangKySuKienDto) {
    // Kiểm tra đã đăng ký chưa
    const exists = await this.dangKyRepo.findOne({
      where: { suKienId: dto.suKienId, sinhVienId: dto.sinhVienId },
    });
    if (exists) throw new ConflictException('Bạn đã đăng ký sự kiện này rồi');

    const suKien = await this.findOne(dto.suKienId);
    const dk = this.dangKyRepo.create({ ...dto, trangThai: 'da_duyet' });
    await this.dangKyRepo.save(dk);

    // Cộng điểm rèn luyện cho sinh viên sau khi đăng ký thành công
    if (suKien.diemCong > 0) {
      await this.diemRenLuyenService.congDiem({
        sinhVienId:  dto.sinhVienId,
        diemThayDoi: suKien.diemCong,
        lyDo:        `Tham gia sự kiện: ${suKien.tenSuKien}`,
      });
    }

    return { message: `Đăng ký thành công! Cộng ${suKien.diemCong} điểm rèn luyện.` };
  }

  // DELETE huỷ đăng ký sự kiện
  async huyDangKy(id: number) {
    const dk = await this.dangKyRepo.findOne({ where: { id } });
    if (!dk) throw new NotFoundException(`Không tìm thấy đăng ký id=${id}`);
    return this.dangKyRepo.delete(id);
  }
}
