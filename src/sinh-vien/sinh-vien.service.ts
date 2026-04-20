import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository }              from '@nestjs/typeorm';
import { Repository }                    from 'typeorm';
import { SinhVien }                      from './entities/sinh-vien.entity';
import { CreateSinhVienDto }             from './dto/create-sinh-vien.dto';
import { v4 as uuidv4 }                  from 'uuid';

/*
  SERVICE: SinhVienService
  BẢNG TRUY VẤN: sinh_vien
  CÁC PHƯƠNG THỨC:
    findAll()              – lấy toàn bộ sinh viên (dùng cho GV xem danh sách)
    findOne(id)            – lấy 1 sinh viên theo id (dùng cho trang chi tiết)
    findByNguoiDung(uid)   – lấy sinh viên theo nguoi_dung_id (dùng sau login)
    create(dto)            – tạo sinh viên mới, tự sinh maQr
    update(id, dto)        – cập nhật thông tin sinh viên
*/
@Injectable()
export class SinhVienService {
  constructor(
    @InjectRepository(SinhVien)
    private readonly repo: Repository<SinhVien>,
  ) {}

  findAll(): Promise<SinhVien[]> {
    return this.repo.find();
  }

  async findOne(id: number): Promise<SinhVien> {
    const sv = await this.repo.findOne({ where: { id } });
    if (!sv) throw new NotFoundException(`Không tìm thấy sinh viên id=${id}`);
    return sv;
  }

  findByNguoiDung(nguoiDungId: number): Promise<SinhVien> {
    return this.repo.findOne({
      where: { nguoiDungId },
      relations: ['nguoiDung'],
    });
  }

  create(dto: CreateSinhVienDto): Promise<SinhVien> {
    const sv = this.repo.create({ ...dto, maQr: uuidv4() });
    return this.repo.save(sv);
  }

  async update(id: number, dto: Partial<CreateSinhVienDto>): Promise<SinhVien> {
    await this.findOne(id);
    await this.repo.update(id, dto);
    return this.findOne(id);
  }
}
