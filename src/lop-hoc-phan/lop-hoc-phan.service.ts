import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository }              from '@nestjs/typeorm';
import { Repository }                    from 'typeorm';
import { LopHocPhan }          from './entities/lop-hoc-phan.entity';
import { CreateLopHocPhanDto } from './dto/create-lop-hoc-phan.dto';

/*
  SERVICE: LopHocPhanService
  BẢNG TRUY VẤN: lop_hoc_phan (JOIN hoc_phan, giang_vien)
  CÁC PHƯƠNG THỨC:
    findAll()              – tất cả lớp (kèm hocPhan, giangVien)
    findByGiangVien(gvId)  – lớp của 1 GV (dùng trang GV)
    findOne(id)            – chi tiết lớp
    create(dto)            – tạo lớp mới
    update(id, dto)        – cập nhật lớp
    remove(id)             – xoá lớp
*/
@Injectable()
export class LopHocPhanService {
  constructor(
    @InjectRepository(LopHocPhan)
    private readonly repo: Repository<LopHocPhan>,
  ) {}

  findAll(): Promise<LopHocPhan[]> {
    return this.repo.find({ relations: ['hocPhan', 'giangVien'] });
  }

  findByGiangVien(giangVienId: number): Promise<LopHocPhan[]> {
    return this.repo.find({
      where: { giangVienId },
      relations: ['hocPhan', 'giangVien'],
    });
  }

  async findOne(id: number): Promise<LopHocPhan> {
    const lhp = await this.repo.findOne({
      where: { id },
      relations: ['hocPhan', 'giangVien'],
    });
    if (!lhp) throw new NotFoundException(`Không tìm thấy lớp học phần id=${id}`);
    return lhp;
  }

  create(dto: CreateLopHocPhanDto): Promise<LopHocPhan> {
    return this.repo.save(this.repo.create(dto));
  }

  async update(id: number, dto: Partial<CreateLopHocPhanDto>): Promise<LopHocPhan> {
    await this.findOne(id);
    await this.repo.update(id, dto);
    return this.findOne(id);
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.repo.delete(id);
  }
}
