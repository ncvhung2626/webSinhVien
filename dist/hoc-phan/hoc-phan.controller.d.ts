import { HocPhanService } from './hoc-phan.service';
import { CreateHocPhanDto } from './dto/create-hoc-phan.dto';
export declare class HocPhanController {
    private readonly hocPhanService;
    constructor(hocPhanService: HocPhanService);
    findAll(): Promise<import("./entities/hoc-phan.entity").HocPhan[]>;
    findOne(id: number): Promise<import("./entities/hoc-phan.entity").HocPhan>;
    create(dto: CreateHocPhanDto): Promise<import("./entities/hoc-phan.entity").HocPhan>;
    update(id: number, dto: Partial<CreateHocPhanDto>): Promise<import("./entities/hoc-phan.entity").HocPhan>;
    remove(id: number): Promise<import("typeorm").DeleteResult>;
}
