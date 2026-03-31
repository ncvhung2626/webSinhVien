// DTO tạo lớp học phần
import { IsInt, IsString, IsOptional } from 'class-validator';

export class CreateLopHocPhanDto {
  // ID học phần liên kết
  @IsInt()
  hocPhanId: number;

  // ID giảng viên được phân công
  @IsInt()
  giangVienId: number;

  // Học kỳ (VD: HK2-2024-2025)
  @IsOptional()
  @IsString()
  hocKy?: string;
}
