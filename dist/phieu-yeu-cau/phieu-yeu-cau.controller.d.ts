import { PhieuYeuCauService } from './phieu-yeu-cau.service';
import { TaoPhieuDto, XuLyPhieuDto } from './dto/phieu-yeu-cau.dto';
export declare class PhieuYeuCauController {
    private readonly phieuYeuCauService;
    constructor(phieuYeuCauService: PhieuYeuCauService);
    findAll(): Promise<import("./entities/phieu-yeu-cau.entity").PhieuYeuCau[]>;
    findBySinhVien(svId: number): Promise<import("./entities/phieu-yeu-cau.entity").PhieuYeuCau[]>;
    findOne(id: number): Promise<import("./entities/phieu-yeu-cau.entity").PhieuYeuCau>;
    create(dto: TaoPhieuDto): Promise<import("./entities/phieu-yeu-cau.entity").PhieuYeuCau>;
    xuLy(id: number, dto: XuLyPhieuDto): Promise<import("./entities/phieu-yeu-cau.entity").PhieuYeuCau>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
}
