// Entity – bang giao_dich_thanh_toan
// Luu toan bo 1 giao dich VNPay: ma giao dich, so tien, trang thai, ma phan hoi
import {
  Entity, PrimaryGeneratedColumn, Column,
  ManyToOne, JoinColumn, CreateDateColumn,
  UpdateDateColumn, OneToMany,
} from 'typeorm';
import { SinhVien }         from '../../sinh-vien/entities/sinh-vien.entity';
import { ChiTietThanhToan } from './chi-tiet-thanh-toan.entity';

@Entity('giao_dich_thanh_toan')
export class GiaoDichThanhToan {
  @PrimaryGeneratedColumn()
  id: number;

  // Khoa ngoai sinh_vien_id -> bang sinh_vien
  @ManyToOne(() => SinhVien, { eager: true })
  @JoinColumn({ name: 'sinh_vien_id' })
  sinhVien: SinhVien;

  @Column({ name: 'sinh_vien_id', nullable: true })
  sinhVienId: number;

  // Ma giao dich noi bo dang SinhVienId_timestamp – duy nhat
  @Column({ name: 'ma_giao_dich', length: 100, unique: true })
  maGiaoDich: string;

  // Ma giao dich VNPay tra ve (vnp_TransactionNo)
  @Column({ name: 'ma_giao_dich_vnpay', length: 100, nullable: true })
  maGiaoDichVnpay: string;

  // So tien thuc te (VND – khong nhan 100 nhu VNPay)
  @Column({ name: 'so_tien', type: 'bigint' })
  soTien: number;

  // Noi dung chua JSON (lopHocPhanIds, noiDung)
  @Column({ name: 'noi_dung', type: 'text', nullable: true })
  noiDung: string;

  // Trang thai: cho_thanh_toan | thanh_cong | that_bai | hoan_tien
  @Column({ name: 'trang_thai', length: 20, default: 'cho_thanh_toan' })
  trangThai: string;

  // Ma phan hoi VNPay: 00 = thanh cong, cac ma khac = loi
  @Column({ name: 'ma_phan_hoi', length: 10, nullable: true })
  maPhanHoi: string;

  // Ma ngan hang (vnp_BankCode)
  @Column({ name: 'ma_ngan_hang', length: 20, nullable: true })
  maNganHang: string;

  @CreateDateColumn({ name: 'thoi_gian_tao' })
  thoiGianTao: Date;

  @UpdateDateColumn({ name: 'thoi_gian_cap_nhat' })
  thoiGianCapNhat: Date;

  // Quan he 1-N voi bang chi_tiet_thanh_toan
  @OneToMany(() => ChiTietThanhToan, ct => ct.giaoDich, { cascade: true, eager: false })
  chiTiet: ChiTietThanhToan[];
}
