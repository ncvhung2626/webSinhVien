import { IsInt, IsString, Length, IsOptional } from 'class-validator';

export class TaoPhieuDto {
  @IsInt()
  sinhVienId: number;

  @IsString()
  @Length(1, 50)
  loaiYeuCau: string;

  @IsString()
  @Length(1, 200)
  tieuDe: string;

  @IsString()
  noiDung: string;
}

export class XuLyPhieuDto {
  @IsString()
  trangThai: string;

  @IsOptional()
  @IsString()
  phanHoi?: string;

  @IsOptional()
  @IsString()
  nguoiXuLy?: string;
}
