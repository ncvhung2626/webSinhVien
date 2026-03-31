import { IsString, IsInt, IsDateString, IsOptional, Length } from 'class-validator';

export class CreateBaiTapDto {
  @IsInt()
  lopHocPhanId: number;

  @IsString()
  @Length(1, 100)
  tenBaiTap: string;

  @IsDateString()
  hanNop: string;

  @IsInt()
  giangVienId: number;

  @IsOptional()
  @IsString()
  moTa?: string;

  @IsOptional()
  @IsString()
  fileDinhKem?: string;
}

export class NopBaiDto {
  @IsInt()
  baiTapId: number;

  @IsInt()
  sinhVienId: number;

  @IsOptional()
  @IsString()
  mssv?: string;

  @IsOptional()
  @IsString()
  ghiChu?: string;
}

export class ChamDiemDto {
  diem: number;
}
