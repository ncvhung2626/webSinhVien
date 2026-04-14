// DTO tạo phiên điểm danh QR (giảng viên dùng)
import { IsInt, IsOptional } from 'class-validator';

export class TaoPhienDto {
  // ID lớp học phần cần điểm danh
  @IsInt()
  lopHocPhanId: number;

  // Thời gian hiệu lực (phút) – mặc định 10
  @IsOptional()
  @IsInt()
  thoiGianPhut?: number;
}

// DTO sinh viên quét QR để điểm danh
export class QuetQrDto {
  // Mã session nhúng trong QR
  maQrSession: string;

  // ID sinh viên thực hiện điểm danh
  @IsInt()
  sinhVienId: number;
}
