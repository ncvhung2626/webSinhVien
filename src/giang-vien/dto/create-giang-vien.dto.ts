// DTO tạo / cập nhật giảng viên
import { IsString, IsOptional, Length } from 'class-validator';

export class CreateGiangVienDto {
  @IsString()
  @Length(1, 100)
  hoTen: string;

  @IsOptional()
  @IsString()
  boMon?: string;

  @IsOptional()
  nguoiDungId?: number;
}
