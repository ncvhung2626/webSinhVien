// DTO tạo mới sinh viên
import { IsString, IsOptional, Length } from 'class-validator';

export class CreateSinhVienDto {
  @IsString()
  @Length(1, 20)
  mssv: string;

  @IsString()
  @Length(1, 100)
  hoTen: string;

  @IsOptional()
  @IsString()
  lop?: string;

  @IsOptional()
  nguoiDungId?: number;
}
