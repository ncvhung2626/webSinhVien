import { Repository } from 'typeorm';
import { PhieuYeuCau } from './entities/phieu-yeu-cau.entity';
import { TaoPhieuDto, XuLyPhieuDto } from './dto/phieu-yeu-cau.dto';
export declare class PhieuYeuCauService {
    private repo;
    constructor(repo: Repository<PhieuYeuCau>);
    findAll(): Promise<PhieuYeuCau[]>;
    findBySinhVien(sinhVienId: number): Promise<PhieuYeuCau[]>;
    findOne(id: number): Promise<PhieuYeuCau>;
    create(dto: TaoPhieuDto): Promise<PhieuYeuCau>;
    xuLy(id: number, dto: XuLyPhieuDto): Promise<PhieuYeuCau>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
}
