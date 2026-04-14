import { Repository } from 'typeorm';
import { PhieuYeuCau } from '../entities';
export declare class PhieuYeuCauService {
    private repo;
    constructor(repo: Repository<PhieuYeuCau>);
    tao(svId: number, loai: string, nd: string): Promise<PhieuYeuCau>;
    getCuaSV(id: number): Promise<PhieuYeuCau[]>;
    getTatCa(): Promise<any>;
    capNhat(id: number, tt: string): Promise<PhieuYeuCau>;
}
export declare class PhieuYeuCauController {
    private service;
    constructor(service: PhieuYeuCauService);
    tao(b: any, req: any): Promise<PhieuYeuCau>;
    getCuaToi(req: any): Promise<PhieuYeuCau[]>;
    getTatCa(): Promise<any>;
    capNhat(id: number, b: any): Promise<PhieuYeuCau>;
}
export declare class PhieuYeuCauModule {
}
