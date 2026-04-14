import {
  Entity, PrimaryGeneratedColumn, Column,
  ManyToOne, JoinColumn, CreateDateColumn, UpdateDateColumn,
} from 'typeorm';
import { SinhVien } from '../../sinh-vien/entities/sinh-vien.entity';

@Entity('phieu_yeu_cau')
export class PhieuYeuCau {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => SinhVien, { eager: true })
  @JoinColumn({ name: 'sinh_vien_id' })
  sinhVien: SinhVien;

  @Column({ name: 'sinh_vien_id' })
  sinhVienId: number;

  @Column({ name: 'loai_yeu_cau', length: 50 })
  loaiYeuCau: string;

  @Column({ name: 'tieu_de', length: 200 })
  tieuDe: string;

  @Column({ name: 'noi_dung', type: 'text' })
  noiDung: string;

  @Column({ name: 'trang_thai', length: 20, default: 'cho_xu_ly' })
  trangThai: string;

  @Column({ name: 'phan_hoi', type: 'text', nullable: true })
  phanHoi: string;

  @Column({ name: 'nguoi_xu_ly', length: 100, nullable: true })
  nguoiXuLy: string;

  @CreateDateColumn({ name: 'ngay_gui' })
  ngayGui: Date;

  @UpdateDateColumn({ name: 'ngay_cap_nhat' })
  ngayCapNhat: Date;
}
