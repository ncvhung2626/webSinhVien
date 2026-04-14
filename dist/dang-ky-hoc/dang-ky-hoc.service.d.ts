import { Repository } from 'typeorm';
import { DangKyHoc } from './entities/dang-ky-hoc.entity';
import { DangKyHocDto } from './dto/dang-ky-hoc.dto';
export declare class DangKyHocService {
    private readonly repo;
    constructor(repo: Repository<DangKyHoc>);
    findBySinhVien(sinhVienId: number): Promise<DangKyHoc[]>;
    findByLopHocPhan(lopHocPhanId: number): Promise<DangKyHoc[]>;
    dangKyNhieu(dto: DangKyHocDto): Promise<DangKyHoc[]>;
    capNhatThanhToan(sinhVienId: number, lopHocPhanIds: number[]): Promise<{
        message: string;
    }>;
    huyDangKy(id: number): Promise<import("typeorm").DeleteResult>;
}
