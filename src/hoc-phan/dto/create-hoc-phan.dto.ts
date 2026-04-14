// DTO tạo / cập nhật học phần
import { IsString, IsInt, Min, Length } from 'class-validator';

export class CreateHocPhanDto {
  // Tên học phần
  @IsString()
  @Length(1, 100)
  tenHocPhan: string;

  // Số tín chỉ tối thiểu 1
  @IsInt()
  @Min(1)
  soTinChi: number;
}
