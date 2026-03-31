// DTO tạo sự kiện mới
import { IsString, IsInt, IsDateString, IsOptional, Min } from 'class-validator';

export class CreateSuKienDto {
  @IsString()
  tenSuKien: string;

  @IsOptional()
  @IsString()
  moTa?: string;

  @IsDateString()
  ngayToChuc: string;

  @IsOptional()
  @IsString()
  diaDiem?: string;

  // Điểm cộng rèn luyện khi tham gia
  @IsInt()
  @Min(0)
  diemCong: number;

  @IsOptional()
  adminId?: number;
}

// DTO sinh viên đăng ký sự kiện
export class DangKySuKienDto {
  @IsInt()
  suKienId: number;

  @IsInt()
  sinhVienId: number;
}
