// DTO cập nhật điểm rèn luyện
import { IsInt, IsString, IsOptional, Min, Max } from 'class-validator';

export class CapNhatDrlDto {
  @IsInt()
  sinhVienId: number;

  // Tổng điểm mới (0–100)
  @IsInt()
  @Min(0)
  @Max(100)
  tongDiem: number;

  @IsOptional()
  @IsString()
  hocKy?: string;
}

export class CongDiemDto {
  @IsInt()
  sinhVienId: number;

  // Điểm cộng hoặc trừ
  @IsInt()
  diemThayDoi: number;

  @IsOptional()
  @IsString()
  lyDo?: string;
}
