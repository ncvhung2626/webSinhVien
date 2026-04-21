import { Injectable, BadRequestException, NotFoundException } from '@nestjs/common';
import { InjectRepository }  from '@nestjs/typeorm';
import { Repository }        from 'typeorm';
import * as crypto           from 'crypto';
import * as qs               from 'qs';
import { GiaoDichThanhToan } from './entities/giao-dich-thanh-toan.entity';
import { ChiTietThanhToan }  from './entities/chi-tiet-thanh-toan.entity';
import { TaoUrlVnpayDto }    from './dto/payment.dto';
import { DangKyHocService }  from '../dang-ky-hoc/dang-ky-hoc.service';

@Injectable()
export class PaymentService {
  private readonly vnp_TmnCode    = process.env.VNP_TMN_CODE    || 'DV0LO45L';
  private readonly vnp_HashSecret = process.env.VNP_HASH_SECRET || 'IDHXHU78WQG0P05J15F5TNSFM9O8UI2M';
  private readonly vnp_Url        = 'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html';
  private readonly vnp_ReturnUrl  = process.env.VNP_RETURN_URL  || 'http://localhost:3000/api/payment/vnpay-callback';

  constructor(
    @InjectRepository(GiaoDichThanhToan)
    private giaoDichRepo: Repository<GiaoDichThanhToan>,
    @InjectRepository(ChiTietThanhToan)
    private chiTietRepo: Repository<ChiTietThanhToan>,
    private dangKyHocService: DangKyHocService,
  ) {}

  async taoUrlThanhToan(dto: TaoUrlVnpayDto, ipAddr: string) {
    const soTien = Number(dto.soTien);
    if (!soTien || isNaN(soTien) || soTien <= 0) {
      throw new BadRequestException('Số tiền không hợp lệ');
    }

    // Fix IPv6 ::1 → 127.0.0.1
    const ip = (ipAddr === '::1' || ipAddr === '::ffff:127.0.0.1') ? '127.0.0.1' : ipAddr;

    const maGiaoDich = `${dto.sinhVienId}_${Date.now()}`;

    const giaoDich = this.giaoDichRepo.create({
      sinhVienId: dto.sinhVienId,
      maGiaoDich,
      soTien,
      noiDung: JSON.stringify({
        sinhVienId:    dto.sinhVienId,
        lopHocPhanIds: dto.lopHocPhanIds,
        noiDung:       dto.noiDung,
      }),
      trangThai: 'cho_thanh_toan',
    });
    const saved = await this.giaoDichRepo.save(giaoDich);

    for (const item of dto.chiTiet) {
      const ct = this.chiTietRepo.create({
        giaoDichId:   saved.id,
        dangKyHocId:  item.dangKyHocId,
        lopHocPhanId: item.lopHocPhanId,
        soTinChi:     item.soTinChi,
        donGiaTinChi: 450000,
        thanhTien:    item.soTinChi * 450000,
      });
      await this.chiTietRepo.save(ct);
    }

    const payUrl = this.buildVnpayUrl(maGiaoDich, soTien, ip);
    return { payUrl, maGiaoDich, giaoDichId: saved.id };
  }

  async xuLyCallback(query: Record<string, string>) {
    const secureHash = query['vnp_SecureHash'];
    if (!secureHash) {
      throw new BadRequestException('Thiếu vnp_SecureHash trong callback');
    }

    let vnp_Params = { ...query };
    delete vnp_Params['vnp_SecureHash'];
    delete vnp_Params['vnp_SecureHashType'];

    vnp_Params = this.sortObject(vnp_Params);
    const signData = qs.stringify(vnp_Params, { encode: false });

    const checkHash = crypto
      .createHmac('sha512', this.vnp_HashSecret)
      .update(Buffer.from(signData, 'utf-8'))
      .digest('hex');

    if (checkHash.toLowerCase() !== secureHash.toLowerCase()) {
      console.error('[VNPAY] Chữ ký KHÔNG khớp!');
      console.error('  signData :', signData);
      console.error('  expected :', checkHash);
      console.error('  received :', secureHash);
      throw new BadRequestException('Chữ ký không hợp lệ');
    }

    const txnRef  = query['vnp_TxnRef'];
    const resCode = query['vnp_ResponseCode'];

    const giaoDich = await this.giaoDichRepo.findOne({ where: { maGiaoDich: txnRef } });
    if (!giaoDich) throw new NotFoundException('Không tìm thấy giao dịch');

    if (resCode === '00') {
      await this.giaoDichRepo.update(giaoDich.id, {
        trangThai:       'thanh_cong',
        maPhanHoi:       resCode,
        maGiaoDichVnpay: query['vnp_TransactionNo'],
        maNganHang:      query['vnp_BankCode'],
      });
      try {
        const info = JSON.parse(giaoDich.noiDung || '{}');
        if (info.sinhVienId && info.lopHocPhanIds?.length > 0) {
          await this.dangKyHocService.capNhatThanhToan(info.sinhVienId, info.lopHocPhanIds);
        }
      } catch {}
      return { code: '00', message: 'Thanh toán thành công' };
    }

    await this.giaoDichRepo.update(giaoDich.id, {
      trangThai: 'that_bai',
      maPhanHoi: resCode,
    });
    return { code: resCode, message: 'Thanh toán thất bại' };
  }

  findBySinhVien(sinhVienId: number) {
    return this.giaoDichRepo.find({
      where: { sinhVienId },
      order: { thoiGianTao: 'DESC' },
    });
  }

  async findOne(id: number) {
    const gd = await this.giaoDichRepo.findOne({ where: { id } });
    if (!gd) throw new NotFoundException(`Không tìm thấy giao dịch id=${id}`);
    return gd;
  }

  private buildVnpayUrl(txnRef: string, soTien: number, ipAddr: string): string {
    const now    = new Date();
    const expire = new Date(now.getTime() + 15 * 60 * 1000);

    const params: Record<string, string> = {
      vnp_Amount:     String(soTien * 100),
      vnp_Command:    'pay',
      vnp_CreateDate: this.formatDate(now),
      vnp_CurrCode:   'VND',
      vnp_ExpireDate: this.formatDate(expire),
      vnp_IpAddr:     ipAddr,
      vnp_Locale:     'vn',
      vnp_OrderInfo:  'Thanh toan hoc phi',
      vnp_OrderType:  'other',
      vnp_ReturnUrl:  this.vnp_ReturnUrl,
      vnp_TmnCode:    this.vnp_TmnCode,
      vnp_TxnRef:     txnRef,
      vnp_Version:    '2.1.0',
    };

    let vnp_Params = { ...params };
    vnp_Params = this.sortObject(vnp_Params);

    const signData = qs.stringify(vnp_Params, { encode: false });

    const signed = crypto
      .createHmac('sha512', this.vnp_HashSecret)
      .update(Buffer.from(signData, 'utf-8'))
      .digest('hex');

    vnp_Params['vnp_SecureHash'] = signed;
    return `${this.vnp_Url}?${qs.stringify(vnp_Params, { encode: false })}`;
  }

  private sortObject(obj: Record<string, any>): Record<string, string> {
    const sorted: Record<string, string> = {};
    const str = [];
    let key;
    for (key in obj) {
      if (obj.hasOwnProperty(key)) {
        str.push(encodeURIComponent(key));
      }
    }
    str.sort();
    for (key = 0; key < str.length; key++) {
      // Decode key again because str[key] is encodeURIComponent version,
      // but VNPAY standard implementation incorrectly indexes obj[str[key]]!
      // To strictly follow VNPAY, we use decodeURIComponent or assume keys are alphanumeric.
      // Since vnp_ keys are alphanumeric, str[key] == key
      const decodedKey = decodeURIComponent(str[key]);
      sorted[str[key]] = encodeURIComponent(obj[decodedKey]).replace(/%20/g, '+');
    }
    return sorted;
  }

  private formatDate(date: Date): string {
    const pad = (n: number) => String(n).padStart(2, '0');
    return (
      date.getFullYear() +
      pad(date.getMonth() + 1) +
      pad(date.getDate()) +
      pad(date.getHours()) +
      pad(date.getMinutes()) +
      pad(date.getSeconds())
    );
  }
}
