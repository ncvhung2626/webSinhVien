export declare class ChiTietDto {
    dangKyHocId?: number;
    lopHocPhanId: number;
    soTinChi: number;
}
export declare class TaoUrlVnpayDto {
    sinhVienId: number;
    lopHocPhanIds: number[];
    chiTiet: ChiTietDto[];
    soTien: number;
    noiDung: string;
}
export declare class VnpayCallbackDto {
    vnp_TxnRef: string;
    vnp_ResponseCode: string;
    vnp_Amount: string;
    vnp_OrderInfo: string;
    vnp_SecureHash: string;
    vnp_TransactionNo: string;
    vnp_BankCode: string;
    [key: string]: string;
}
