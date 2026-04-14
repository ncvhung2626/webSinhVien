import { Repository } from 'typeorm';
import { GiangVien } from '../entities';
export declare class GiangVienService {
    private repo;
    constructor(repo: Repository<GiangVien>);
    getThongTin(id: number): Promise<GiangVien>;
    getDanhSachTatCa(): Promise<any>;
}
export declare class GiangVienController {
    private service;
    constructor(service: GiangVienService);
    getCaNhan(req: any): Promise<GiangVien>;
    getTatCa(): Promise<any>;
}
export declare class GiangVienModule {
}
