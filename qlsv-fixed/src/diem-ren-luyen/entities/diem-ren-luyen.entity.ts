// Entity – bảng diem_ren_luyen (id, sinh_vien_id, tong_diem, xep_loai, hoc_ky)
import {
  Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn,
} from 'typeorm';
import { SinhVien } from '../../sinh-vien/entities/sinh-vien.entity';

@Entity('diem_ren_luyen')
export class DiemRenLuyen {
  @PrimaryGeneratedColumn()
  id: number;

  // Khoá ngoại sinh_vien_id → bảng sinh_vien
  @ManyToOne(() => SinhVien, { eager: true })
  @JoinColumn({ name: 'sinh_vien_id' })
  sinhVien: SinhVien;

  @Column({ name: 'sinh_vien_id' })
  sinhVienId: number;

  // Tổng điểm rèn luyện (0–100, check constraint trong DB)
  @Column({ name: 'tong_diem' })
  tongDiem: number;

  // Xếp loại: xuat_sac | tot | kha | trung_binh | yeu
  @Column({ name: 'xep_loai', length: 20, nullable: true })
  xepLoai: string;

  // Học kỳ (VD: HK2-2024-2025)
  @Column({ name: 'hoc_ky', length: 20, nullable: true })
  hocKy: string;
}
