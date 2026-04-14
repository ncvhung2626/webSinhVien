import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository }              from '@nestjs/typeorm';
import { Repository }                    from 'typeorm';
import { HocPhan }          from './entities/hoc-phan.entity';
import { CreateHocPhanDto } from './dto/create-hoc-phan.dto';

/*
  SERVICE: HocPhanService
  BẢNG TRUY VẤN: hoc_phan
  CÁC PHƯƠNG THỨC:
    findAll()      – danh sách học phần (SV chọn khi đăng ký)
    findOne(id)    – chi tiết 1 học phần
    create(dto)    – tạo học phần mới
    update(id,dto) – cập nhật học phần
    remove(id)     – xoá học phần
*/
@Injectable()
export class HocPhanService {
  constructor(
    @InjectRepository(HocPhan)
    private readonly repo: Repository<HocPhan>,
  ) {}

  findAll(): Promise<HocPhan[]> {
    return this.repo.find({ order: { tenHocPhan: 'ASC' } });
  }

  async findOne(id: number): Promise<HocPhan> {
    const hp = await this.repo.findOne({ where: { id } });
    if (!hp) throw new NotFoundException(`Không tìm thấy học phần id=${id}`);
    return hp;
  }

  create(dto: CreateHocPhanDto): Promise<HocPhan> {
    return this.repo.save(this.repo.create(dto));
  }

  async update(id: number, dto: Partial<CreateHocPhanDto>): Promise<HocPhan> {
    await this.findOne(id);
    await this.repo.update(id, dto);
    return this.findOne(id);
  }

  async remove(id: number) {
    await this.findOne(id);
    return this.repo.delete(id);
  }
}
