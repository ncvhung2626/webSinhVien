import { Repository } from 'typeorm';
import { SinhVien } from '../entities';
export declare class SinhVienService {
    private repo;
    constructor(repo: Repository<SinhVien>);
    getThongTinCaNhan(id: number): Promise<SinhVien>;
    getDanhSachTheoLop(lopId: number): Promise<any>;
    getDanhSachTatCa(): Promise<any>;
}
export declare class SinhVienController {
    private service;
    constructor(service: SinhVienService);
    getCaNhan(req: any): Promise<SinhVien>;
    getDanhSach(lopId: number): Promise<any>;
    getTatCa(): Promise<any>;
}
export declare class SinhVienModule {
}
