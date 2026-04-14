import { DangKyHocService } from './dang-ky-hoc.service';
import { DangKyHocDto } from './dto/dang-ky-hoc.dto';
export declare class DangKyHocController {
    private readonly dangKyHocService;
    constructor(dangKyHocService: DangKyHocService);
    findBySinhVien(svId: number): Promise<import("./entities/dang-ky-hoc.entity").DangKyHoc[]>;
    findByLop(lopId: number): Promise<import("./entities/dang-ky-hoc.entity").DangKyHoc[]>;
    dangKy(dto: DangKyHocDto): Promise<import("./entities/dang-ky-hoc.entity").DangKyHoc[]>;
    capNhatThanhToan(body: {
        sinhVienId: number;
        lopHocPhanIds: number[];
    }): Promise<{
        message: string;
    }>;
    huyDangKy(id: number): Promise<import("typeorm").DeleteResult>;
}
