import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository }              from '@nestjs/typeorm';
import { Repository }                    from 'typeorm';
import { PhieuYeuCau }    from './entities/phieu-yeu-cau.entity';
import { TaoPhieuDto, XuLyPhieuDto } from './dto/phieu-yeu-cau.dto';

@Injectable()
export class PhieuYeuCauService {
  constructor(
    @InjectRepository(PhieuYeuCau)
    private repo: Repository<PhieuYeuCau>,
  ) {}

  findAll() {
    return this.repo.find({ order: { ngayGui: 'DESC' } });
  }

  findBySinhVien(sinhVienId: number) {
    return this.repo.find({ where: { sinhVienId }, order: { ngayGui: 'DESC' } });
  }

  async findOne(id: number) {
    const p = await this.repo.findOne({ where: { id } });
    if (!p) throw new NotFoundException(`Không tìm thấy phiếu id=${id}`);
    return p;
  }

  create(dto: TaoPhieuDto) {
    const p = this.repo.create(dto);
    return this.repo.save(p);
  }

  async xuLy(id: number, dto: XuLyPhieuDto) {
    await this.findOne(id);
    await this.repo.update(id, dto);
    return this.findOne(id);
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.repo.delete(id);
  }
}
