import { Repository } from 'typeorm';
import { LopHocPhan, BuoiHoc, PhienDiemDanh, DangKyHoc } from '../entities';
export declare class LopHocPhanService {
    private lopRepo;
    private buoiHocRepo;
    private phienRepo;
    private dangKyRepo;
    constructor(lopRepo: Repository<LopHocPhan>, buoiHocRepo: Repository<BuoiHoc>, phienRepo: Repository<PhienDiemDanh>, dangKyRepo: Repository<DangKyHoc>);
    getLopCuaGiangVien(giangVienId: number): Promise<LopHocPhan[]>;
    getLopCuaSinhVien(sinhVienId: number): Promise<LopHocPhan[]>;
    getChiTiet(lopId: number): Promise<{
        lop: LopHocPhan;
        tongSinhVien: number;
        buoiHocs: BuoiHoc[];
        lichHoc: any;
    }>;
    getThongKeBuoiHoc(lopId: number): Promise<any>;
    taoBuoiHoc(lopId: number, ngayHoc: string, trangThai?: string): Promise<BuoiHoc>;
    taoPhienDiemDanh(buoiHocId: number, thoiGianPhut?: number): Promise<{
        phien: PhienDiemDanh;
        qrImage: string;
        maQR: string;
        ketThuc: Date;
    }>;
    getDiemHocPhan(lopId: number): Promise<any>;
    getDiemCaNhanSV(sinhVienId: number): Promise<any>;
    getPhienHienTai(buoiHocId: number): Promise<{
        active: boolean;
        phien?: undefined;
        qrImage?: undefined;
    } | {
        active: boolean;
        phien: PhienDiemDanh;
        qrImage: string;
    }>;
}
export declare class LopHocPhanController {
    private service;
    constructor(service: LopHocPhanService);
    getLopGV(req: any): Promise<LopHocPhan[]>;
    getLopSV(req: any): Promise<LopHocPhan[]>;
    getChiTiet(id: number): Promise<{
        lop: LopHocPhan;
        tongSinhVien: number;
        buoiHocs: BuoiHoc[];
        lichHoc: any;
    }>;
    getThongKe(id: number): Promise<any>;
    taoBuoiHoc(id: number, body: {
        ngay_hoc: string;
        trang_thai?: string;
    }): Promise<BuoiHoc>;
    taoPhien(buoiId: number, body: {
        thoi_gian_phut?: number;
    }): Promise<{
        phien: PhienDiemDanh;
        qrImage: string;
        maQR: string;
        ketThuc: Date;
    }>;
    getPhienHienTai(buoiId: number): Promise<{
        active: boolean;
        phien?: undefined;
        qrImage?: undefined;
    } | {
        active: boolean;
        phien: PhienDiemDanh;
        qrImage: string;
    }>;
    getDiemHP(id: number): Promise<any>;
    getDiemCaNhan(req: any): Promise<any>;
}
export declare class LopHocPhanModule {
}
