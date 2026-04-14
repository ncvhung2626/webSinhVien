import { Repository } from 'typeorm';
import { DiemDanh, PhienDiemDanh } from '../entities';
export declare class DiemDanhService {
    private repo;
    private phienRepo;
    constructor(repo: Repository<DiemDanh>, phienRepo: Repository<PhienDiemDanh>);
    diemDanhQR(maQR: string, svId: number): Promise<DiemDanh>;
    getDiemDanhBuoi(buoiId: number): Promise<any>;
    getThongKeVang(lopId: number): Promise<any>;
    getLichSuVang(svId: number): Promise<any>;
    ghiVang(buoiId: number, svId: number): Promise<DiemDanh | {
        message: string;
    }>;
}
export declare class DiemDanhController {
    private service;
    constructor(service: DiemDanhService);
    diemDanhQR(b: {
        ma_qr: string;
    }, req: any): Promise<DiemDanh>;
    getDiemDanhBuoi(buoiId: number): Promise<any>;
    getThongKeVang(lopId: number): Promise<any>;
    getLichSuVang(req: any): Promise<any>;
    ghiVang(b: {
        buoi_hoc_id: number;
        sinh_vien_id: number;
    }): Promise<DiemDanh | {
        message: string;
    }>;
}
export declare class DiemDanhModule {
}
