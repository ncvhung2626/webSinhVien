import { Repository } from 'typeorm';
import { BaiTap } from './entities/bai-tap.entity';
import { NopBai } from './entities/nop-bai.entity';
import { CreateBaiTapDto, NopBaiDto, ChamDiemDto } from './dto/bai-tap.dto';
export declare class BaiTapService {
    private baiTapRepo;
    private nopBaiRepo;
    constructor(baiTapRepo: Repository<BaiTap>, nopBaiRepo: Repository<NopBai>);
    findByLop(lopHocPhanId: number): Promise<BaiTap[]>;
    findBySinhVien(lopHocPhanIds: number[]): Promise<BaiTap[]>;
    findOne(id: number): Promise<BaiTap>;
    create(dto: CreateBaiTapDto): Promise<BaiTap>;
    update(id: number, dto: Partial<CreateBaiTapDto>): Promise<BaiTap>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
    nopBai(dto: NopBaiDto, filePath?: string): Promise<NopBai>;
    findNopBaiByBaiTap(baiTapId: number): Promise<NopBai[]>;
    findNopBaiBySinhVien(sinhVienId: number): Promise<NopBai[]>;
    chamDiem(nopBaiId: number, dto: ChamDiemDto): Promise<NopBai>;
}
