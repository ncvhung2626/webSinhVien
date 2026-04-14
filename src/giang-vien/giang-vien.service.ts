import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository }              from '@nestjs/typeorm';
import { Repository }                    from 'typeorm';
import { GiangVien }          from './entities/giang-vien.entity';
import { CreateGiangVienDto } from './dto/create-giang-vien.dto';

/*
  SERVICE: GiangVienService
  BẢNG TRUY VẤN: giang_vien
  CÁC PHƯƠNG THỨC:
    findAll()            – danh sách giảng viên
    findOne(id)          – chi tiết 1 giảng viên
    findByNguoiDung(uid) – GV theo nguoi_dung_id (dùng sau login)
    create(dto)          – tạo mới giảng viên
    update(id, dto)      – cập nhật thông tin
*/
@Injectable()
export class GiangVienService {
  constructor(
    @InjectRepository(GiangVien)
    private readonly repo: Repository<GiangVien>,
  ) {}

  findAll(): Promise<GiangVien[]> {
    return this.repo.find();
  }

  async findOne(id: number): Promise<GiangVien> {
    const gv = await this.repo.findOne({ where: { id } });
    if (!gv) throw new NotFoundException(`Không tìm thấy giảng viên id=${id}`);
    return gv;
  }

  findByNguoiDung(nguoiDungId: number): Promise<GiangVien> {
    return this.repo.findOne({ where: { nguoiDungId } });
  }

  create(dto: CreateGiangVienDto): Promise<GiangVien> {
    return this.repo.save(this.repo.create(dto));
  }

  async update(id: number, dto: Partial<CreateGiangVienDto>): Promise<GiangVien> {
    await this.findOne(id);
    await this.repo.update(id, dto);
    return this.findOne(id);
  }
}
