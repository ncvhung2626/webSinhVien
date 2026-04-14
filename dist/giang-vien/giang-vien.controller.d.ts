import { Response } from 'express';
import { GiangVienService } from './giang-vien.service';
import { CreateGiangVienDto } from './dto/create-giang-vien.dto';
export declare class GiangVienController {
    private readonly giangVienService;
    constructor(giangVienService: GiangVienService);
    showView(res: Response): void;
    findAll(): Promise<import("./entities/giang-vien.entity").GiangVien[]>;
    findMe(uid: number): Promise<import("./entities/giang-vien.entity").GiangVien>;
    findOne(id: number): Promise<import("./entities/giang-vien.entity").GiangVien>;
    create(dto: CreateGiangVienDto): Promise<import("./entities/giang-vien.entity").GiangVien>;
    update(id: number, dto: Partial<CreateGiangVienDto>): Promise<import("./entities/giang-vien.entity").GiangVien>;
}
