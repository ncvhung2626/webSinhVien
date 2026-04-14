import {
  Entity, PrimaryGeneratedColumn, Column,
  ManyToOne, JoinColumn,
} from 'typeorm';
import { BaiTap }   from './bai-tap.entity';
import { SinhVien } from '../../sinh-vien/entities/sinh-vien.entity';

@Entity('nop_bai')
export class NopBai {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => BaiTap, { eager: true })
  @JoinColumn({ name: 'bai_tap_id' })
  baiTap: BaiTap;

  @Column({ name: 'bai_tap_id' })
  baiTapId: number;

  @ManyToOne(() => SinhVien, { eager: true })
  @JoinColumn({ name: 'sinh_vien_id' })
  sinhVien: SinhVien;

  @Column({ name: 'sinh_vien_id' })
  sinhVienId: number;

  @Column({ name: 'mssv', length: 20, nullable: true })
  mssv: string;

  @Column({ name: 'file_nop', length: 500, nullable: true })
  fileNop: string;

  @Column({ name: 'ghi_chu', type: 'text', nullable: true })
  ghiChu: string;

  @Column({ name: 'ngay_nop', type: 'date', nullable: true })
  ngayNop: Date;

  @Column({ name: 'trang_thai', length: 20, default: 'da_nop' })
  trangThai: string;

  @Column({ name: 'diem', type: 'numeric', precision: 4, scale: 1, nullable: true })
  diem: number;
}
