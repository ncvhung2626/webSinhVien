import { Injectable, ConflictException, NotFoundException } from '@nestjs/common';
import { InjectRepository }                                  from '@nestjs/typeorm';
import { Repository, In }                                    from 'typeorm';
import { DangKyHoc }    from './entities/dang-ky-hoc.entity';
import { DangKyHocDto } from './dto/dang-ky-hoc.dto';

/*
  SERVICE: DangKyHocService
  BẢNG TRUY VẤN: dang_ky_hoc (JOIN sinh_vien, lop_hoc_phan)
  CÁC PHƯƠNG THỨC:
    findBySinhVien(svId)              – học phần SV đã đăng ký
                                        → dùng cho tab Lịch sử đăng ký
    findByLopHocPhan(lopId)           – SV đăng ký theo lớp
                                        → dùng cho GV xem danh sách SV
    dangKyNhieu(dto)                  – đăng ký nhiều học phần cùng lúc
    capNhatThanhToan(svId, lopIds[])  – cập nhật da_thanh_toan sau VNPay callback
    huyDangKy(id)                     – huỷ đăng ký
*/
@Injectable()
export class DangKyHocService {
  constructor(
    @InjectRepository(DangKyHoc)
    private readonly repo: Repository<DangKyHoc>,
  ) {}

  findBySinhVien(sinhVienId: number): Promise<DangKyHoc[]> {
    return this.repo.find({
      where: { sinhVienId },
      relations: ['lopHocPhan', 'lopHocPhan.hocPhan', 'lopHocPhan.giangVien'],
    });
  }

  findByLopHocPhan(lopHocPhanId: number): Promise<DangKyHoc[]> {
    return this.repo.find({
      where: { lopHocPhanId },
      relations: ['sinhVien'],
    });
  }

  async dangKyNhieu(dto: DangKyHocDto): Promise<DangKyHoc[]> {
    const results: DangKyHoc[] = [];
    for (const lopId of dto.lopHocPhanIds) {
      const exists = await this.repo.findOne({
        where: { sinhVienId: dto.sinhVienId, lopHocPhanId: lopId },
      });
      if (exists) throw new ConflictException(`Đã đăng ký lớp ${lopId} rồi`);
      const dk = this.repo.create({ sinhVienId: dto.sinhVienId, lopHocPhanId: lopId });
      results.push(await this.repo.save(dk));
    }
    return results;
  }

  async capNhatThanhToan(sinhVienId: number, lopHocPhanIds: number[]) {
    await this.repo.update(
      { sinhVienId, lopHocPhanId: In(lopHocPhanIds) },
      { daThanhToan: true },
    );
    return { message: 'Cập nhật thanh toán thành công' };
  }

  async huyDangKy(id: number) {
    const dk = await this.repo.findOne({ where: { id } });
    if (!dk) throw new NotFoundException(`Không tìm thấy đăng ký id=${id}`);
    return this.repo.delete(id);
  }
}
