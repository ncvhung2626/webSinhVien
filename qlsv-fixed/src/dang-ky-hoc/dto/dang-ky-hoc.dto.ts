// DTO đăng ký học phần
import { IsInt, IsArray, ArrayMinSize } from 'class-validator';

export class DangKyHocDto {
  // ID sinh viên đăng ký
  @IsInt()
  sinhVienId: number;

  // Danh sách ID lớp học phần muốn đăng ký
  @IsArray()
  @ArrayMinSize(1, { message: 'Phải chọn ít nhất 1 học phần' })
  @IsInt({ each: true })
  lopHocPhanIds: number[];
}
