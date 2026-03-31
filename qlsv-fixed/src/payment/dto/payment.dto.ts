import { IsInt, IsString, IsArray, IsOptional, ValidateNested, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class ChiTietDto {
  @IsOptional()
  @IsInt()
  @Type(() => Number)
  dangKyHocId?: number;

  @IsInt()
  @Type(() => Number)
  lopHocPhanId: number;

  @IsInt()
  @Min(1)
  @Type(() => Number)
  soTinChi: number;
}

export class TaoUrlVnpayDto {
  @IsInt()
  @Min(1)
  @Type(() => Number)
  sinhVienId: number;

  @IsArray()
  @IsInt({ each: true })
  lopHocPhanIds: number[];

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ChiTietDto)
  chiTiet: ChiTietDto[];

  @IsInt()
  @Min(1)
  @Type(() => Number)
  soTien: number;

  @IsString()
  noiDung: string;
}

export class VnpayCallbackDto {
  vnp_TxnRef:        string;
  vnp_ResponseCode:  string;
  vnp_Amount:        string;
  vnp_OrderInfo:     string;
  vnp_SecureHash:    string;
  vnp_TransactionNo: string;
  vnp_BankCode:      string;
  [key: string]: string;
}
