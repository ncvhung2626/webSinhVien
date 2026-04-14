import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PaymentController }  from './payment.controller';
import { PaymentService }     from './payment.service';
import { GiaoDichThanhToan }  from './entities/giao-dich-thanh-toan.entity';
import { ChiTietThanhToan }   from './entities/chi-tiet-thanh-toan.entity';
import { DangKyHocModule }    from '../dang-ky-hoc/dang-ky-hoc.module';

/*
  MODULE: PaymentModule
  ──────────────────────────────────────────────────────
  BẢNG SỬ DỤNG : giao_dich_thanh_toan, chi_tiet_thanh_toan
  THUỘC TÍNH giao_dich_thanh_toan:
    id, sinh_vien_id (FK), ma_giao_dich (unique),
    ma_giao_dich_vnpay, so_tien, noi_dung (JSON),
    trang_thai (cho_thanh_toan|thanh_cong|that_bai),
    ma_phan_hoi, ma_ngan_hang, thoi_gian_tao, thoi_gian_cap_nhat
  THUỘC TÍNH chi_tiet_thanh_toan:
    id, giao_dich_id (FK), dang_ky_hoc_id (FK),
    lop_hoc_phan_id (FK), so_tin_chi, don_gia_tin_chi, thanh_tien
  VNPAY CONFIG : TmnCode=LFOD1X7N | HashSecret=Z2KOQK9TE54N9ARX63BMVIUFEC7HAOY6
                 URL=https://sandbox.vnpayment.vn/paymentv2/vpcpay.html
                 Thuật toán: HMAC-SHA512
  ENTITY      : GiaoDichThanhToan (1-N ChiTietThanhToan), ChiTietThanhToan
  DTO         : TaoUrlVnpayDto (sinhVienId, lopHocPhanIds[], chiTiet[], soTien, noiDung)
                VnpayCallbackDto (vnp_TxnRef, vnp_ResponseCode, vnp_SecureHash, ...)
  SERVICE     : taoUrlThanhToan | xuLyCallback | findBySinhVien | findOne
  CONTROLLER  :
    API   POST /api/payment/tao-url          → tạo URL VNPay, redirect SV
          GET  /api/payment/vnpay-callback    → VNPay gọi về, cập nhật DB
                                               redirect → /sinh-vien?payment=success
          GET  /api/payment/lich-su/:svId     → lịch sử giao dịch
          GET  /api/payment/giao-dich/:id     → chi tiết 1 giao dịch
  VIEW DÙNG   :
    sinh-vien.html tab "Đăng ký học phần":
      → Nút "Thanh toán VNPay" → POST /api/payment/tao-url
      → redirect sang VNPay sandbox
      → callback → /sinh-vien?payment=success → toast thông báo
    sinh-vien.html tab "Lịch sử đăng ký":
      → GET /api/payment/lich-su/:svId
      Hiển thị: maGiaoDich, soTien, trangThai, thoi_gian_tao,
                chiTiet[].lopHocPhan.tenHocPhan
  IMPORT      : DangKyHocModule (capNhatThanhToan sau callback)
  ──────────────────────────────────────────────────────
*/
@Module({
  imports: [
    TypeOrmModule.forFeature([GiaoDichThanhToan, ChiTietThanhToan]),
    DangKyHocModule,
  ],
  controllers: [PaymentController],
  providers:   [PaymentService],
})
export class PaymentModule {}
