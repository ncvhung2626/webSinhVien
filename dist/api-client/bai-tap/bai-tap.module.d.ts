import { Repository } from 'typeorm';
import { BaiTap, NopBai } from '../entities';
export declare class BaiTapService {
    private btRepo;
    private nbRepo;
    constructor(btRepo: Repository<BaiTap>, nbRepo: Repository<NopBai>);
    taoBaiTap(dto: Partial<BaiTap>): Promise<BaiTap>;
    getBaiTapTheoLop(lopId: number): Promise<BaiTap[]>;
    getBaiTapSinhVien(svId: number, lopId: number): Promise<any>;
    nopBai(svId: number, btId: number): Promise<NopBai>;
    getDanhSachNopBai(btId: number): Promise<any>;
    private guiEmail;
}
export declare class BaiTapController {
    private service;
    constructor(service: BaiTapService);
    taoBaiTap(b: any, req: any): Promise<BaiTap>;
    getBaiTapLop(lopId: number): Promise<BaiTap[]>;
    getBaiTapSV(lopId: number, req: any): Promise<any>;
    nopBai(id: number, req: any): Promise<NopBai>;
    getDSNop(id: number): Promise<any>;
}
export declare class BaiTapModule {
}
