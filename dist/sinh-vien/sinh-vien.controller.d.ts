import { Response } from 'express';
import { SinhVienService } from './sinh-vien.service';
import { CreateSinhVienDto } from './dto/create-sinh-vien.dto';
export declare class SinhVienController {
    private readonly sinhVienService;
    constructor(sinhVienService: SinhVienService);
    showView(res: Response): void;
    findAll(): Promise<import("./entities/sinh-vien.entity").SinhVien[]>;
    findMe(uid: number): Promise<import("./entities/sinh-vien.entity").SinhVien>;
    findOne(id: number): Promise<import("./entities/sinh-vien.entity").SinhVien>;
    create(dto: CreateSinhVienDto): Promise<import("./entities/sinh-vien.entity").SinhVien>;
    update(id: number, dto: Partial<CreateSinhVienDto>): Promise<import("./entities/sinh-vien.entity").SinhVien>;
}
