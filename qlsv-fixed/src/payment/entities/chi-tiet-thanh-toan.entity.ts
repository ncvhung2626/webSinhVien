// Entity – bang chi_tiet_thanh_toan
// Luu tung hoc phan trong 1 giao dich: so_tin_chi, don_gia, thanh_tien
import {
  Entity, PrimaryGeneratedColumn, Column,
  ManyToOne, JoinColumn,
} from 'typeorm';
import { GiaoDichThanhToan } from './giao-dich-thanh-toan.entity';
import { LopHocPhan }        from '../../lop-hoc-phan/entities/lop-hoc-phan.entity';
import { DangKyHoc }         from '../../dang-ky-hoc/entities/dang-ky-hoc.entity';

@Entity('chi_tiet_thanh_toan')
export class ChiTietThanhToan {
  @PrimaryGeneratedColumn()
  id: number;

  // Khoa ngoai giao_dich_id -> bang giao_dich_thanh_toan
  @ManyToOne(() => GiaoDichThanhToan, gd => gd.chiTiet, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'giao_dich_id' })
  giaoDich: GiaoDichThanhToan;

  @Column({ name: 'giao_dich_id' })
  giaoDichId: number;

  // Khoa ngoai dang_ky_hoc_id -> bang dang_ky_hoc
  @ManyToOne(() => DangKyHoc, { eager: true, nullable: true })
  @JoinColumn({ name: 'dang_ky_hoc_id' })
  dangKyHoc: DangKyHoc;

  @Column({ name: 'dang_ky_hoc_id', nullable: true })
  dangKyHocId: number;

  // Khoa ngoai lop_hoc_phan_id -> bang lop_hoc_phan
  @ManyToOne(() => LopHocPhan, { eager: true, nullable: true })
  @JoinColumn({ name: 'lop_hoc_phan_id' })
  lopHocPhan: LopHocPhan;

  @Column({ name: 'lop_hoc_phan_id', nullable: true })
  lopHocPhanId: number;

  // So tin chi tai thoi diem thanh toan
  @Column({ name: 'so_tin_chi', nullable: true })
  soTinChi: number;

  // Don gia moi tin chi (mac dinh 450,000 VND)
  @Column({ name: 'don_gia_tin_chi', default: 450000 })
  donGiaTinChi: number;

  // Thanh tien = so_tin_chi * don_gia_tin_chi
  @Column({ name: 'thanh_tien', type: 'bigint', nullable: true })
  thanhTien: number;
}
