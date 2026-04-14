import { Repository } from 'typeorm';
import { DiemRenLuyen } from '../entities';
export declare class DiemRenLuyenService {
    private repo;
    constructor(repo: Repository<DiemRenLuyen>);
    getDiemCaNhan(id: number): Promise<DiemRenLuyen[]>;
    getDiemTheoLop(lopId: number): Promise<any>;
    getDiemTatCa(): Promise<any>;
}
export declare class DiemRenLuyenController {
    private service;
    constructor(service: DiemRenLuyenService);
    getCaNhan(req: any): Promise<DiemRenLuyen[]>;
    getTheoLop(lopId: number): Promise<any>;
    getTatCa(): Promise<any>;
}
export declare class DiemRenLuyenModule {
}
