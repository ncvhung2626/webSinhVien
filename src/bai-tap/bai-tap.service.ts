import { Injectable, NotFoundException, ConflictException } from '@nestjs/common';
import { InjectRepository }                                  from '@nestjs/typeorm';
import { Repository, In }                                    from 'typeorm';
import { BaiTap }                          from './entities/bai-tap.entity';
import { NopBai }                          from './entities/nop-bai.entity';
import { CreateBaiTapDto, NopBaiDto, ChamDiemDto } from './dto/bai-tap.dto';

@Injectable()
export class BaiTapService {
  constructor(
    @InjectRepository(BaiTap)
    private baiTapRepo: Repository<BaiTap>,

    @InjectRepository(NopBai)
    private nopBaiRepo: Repository<NopBai>,
  ) {}

  findByLop(lopHocPhanId: number) {
    return this.baiTapRepo.find({
      where: { lopHocPhanId },
      order: { hanNop: 'ASC' },
    });
  }

  findBySinhVien(lopHocPhanIds: number[]) {
    return this.baiTapRepo.find({
      where: { lopHocPhanId: In(lopHocPhanIds) },
      order: { hanNop: 'ASC' },
    });
  }

  async findOne(id: number) {
    const bt = await this.baiTapRepo.findOne({ where: { id } });
    if (!bt) throw new NotFoundException(`Không tìm thấy bài tập id=${id}`);
    return bt;
  }

  create(dto: CreateBaiTapDto) {
    const bt = this.baiTapRepo.create(dto);
    return this.baiTapRepo.save(bt);
  }

  async update(id: number, dto: Partial<CreateBaiTapDto>) {
    await this.findOne(id);
    await this.baiTapRepo.update(id, dto);
    return this.findOne(id);
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.baiTapRepo.delete(id);
  }

  async nopBai(dto: NopBaiDto, filePath?: string) {
    const exists = await this.nopBaiRepo.findOne({
      where: { baiTapId: dto.baiTapId, sinhVienId: dto.sinhVienId },
    });
    if (exists) throw new ConflictException('Bạn đã nộp bài tập này rồi');
    const nb = this.nopBaiRepo.create({
      ...dto,
      fileNop:   filePath,
      ngayNop:   new Date(),
      trangThai: 'da_nop',
    });
    return this.nopBaiRepo.save(nb);
  }

  findNopBaiByBaiTap(baiTapId: number) {
    return this.nopBaiRepo.find({
      where: { baiTapId },
      relations: ['sinhVien'],
    });
  }

  findNopBaiBySinhVien(sinhVienId: number) {
    return this.nopBaiRepo.find({
      where: { sinhVienId },
      relations: ['baiTap'],
    });
  }

  async chamDiem(nopBaiId: number, dto: ChamDiemDto) {
    const nb = await this.nopBaiRepo.findOne({ where: { id: nopBaiId } });
    if (!nb) throw new NotFoundException(`Không tìm thấy bài nộp id=${nopBaiId}`);
    await this.nopBaiRepo.update(nopBaiId, { diem: dto.diem, trangThai: 'da_cham' });
    return this.nopBaiRepo.findOne({ where: { id: nopBaiId } });
  }
}
