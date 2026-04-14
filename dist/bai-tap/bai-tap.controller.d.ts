import { BaiTapService } from './bai-tap.service';
import { CreateBaiTapDto, NopBaiDto, ChamDiemDto } from './dto/bai-tap.dto';
export declare class BaiTapController {
    private readonly baiTapService;
    constructor(baiTapService: BaiTapService);
    findByLop(lopId: number): Promise<import("./entities/bai-tap.entity").BaiTap[]>;
    findNopBaiBySinhVien(svId: number): Promise<import("./entities/nop-bai.entity").NopBai[]>;
    nopBai(dto: NopBaiDto, file: Express.Multer.File): Promise<import("./entities/nop-bai.entity").NopBai>;
    chamDiem(nbId: number, dto: ChamDiemDto): Promise<import("./entities/nop-bai.entity").NopBai>;
    findNopBaiByBaiTap(id: number): Promise<import("./entities/nop-bai.entity").NopBai[]>;
    findOne(id: number): Promise<import("./entities/bai-tap.entity").BaiTap>;
    create(dto: CreateBaiTapDto, file: Express.Multer.File): Promise<import("./entities/bai-tap.entity").BaiTap>;
    update(id: number, dto: Partial<CreateBaiTapDto>): Promise<import("./entities/bai-tap.entity").BaiTap>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
}
