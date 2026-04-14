// Entity – bảng dang_ky_su_kien (id, su_kien_id, sinh_vien_id, trang_thai, thoi_gian_dang_ky)
import {
  Entity, PrimaryGeneratedColumn, Column,
  ManyToOne, JoinColumn, CreateDateColumn,
} from 'typeorm';
import { SuKien }   from './su-kien.entity';
import { SinhVien } from '../../sinh-vien/entities/sinh-vien.entity';

@Entity('dang_ky_su_kien')
export class DangKySuKien {
  @PrimaryGeneratedColumn()
  id: number;

  // Khoá ngoại su_kien_id → bảng su_kien
  @ManyToOne(() => SuKien, { eager: true })
  @JoinColumn({ name: 'su_kien_id' })
  suKien: SuKien;

  @Column({ name: 'su_kien_id' })
  suKienId: number;

  // Khoá ngoại sinh_vien_id → bảng sinh_vien
  @ManyToOne(() => SinhVien, { eager: true })
  @JoinColumn({ name: 'sinh_vien_id' })
  sinhVien: SinhVien;

  @Column({ name: 'sinh_vien_id' })
  sinhVienId: number;

  // Trạng thái: cho_duyet | da_duyet | tu_choi
  @Column({ name: 'trang_thai', length: 20, default: 'da_duyet' })
  trangThai: string;

  // Thời gian đăng ký
  @CreateDateColumn({ name: 'thoi_gian_dang_ky' })
  thoiGianDangKy: Date;
}
