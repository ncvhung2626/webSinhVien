import {
  Entity, PrimaryGeneratedColumn, Column,
  ManyToOne, JoinColumn, CreateDateColumn,
} from 'typeorm';
import { LopHocPhan } from '../../lop-hoc-phan/entities/lop-hoc-phan.entity';
import { GiangVien }  from '../../giang-vien/entities/giang-vien.entity';

@Entity('bai_tap')
export class BaiTap {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => LopHocPhan, { eager: true })
  @JoinColumn({ name: 'lop_hoc_phan_id' })
  lopHocPhan: LopHocPhan;

  @Column({ name: 'lop_hoc_phan_id' })
  lopHocPhanId: number;

  @Column({ name: 'ten_bai_tap', length: 100 })
  tenBaiTap: string;

  @Column({ name: 'han_nop', type: 'date' })
  hanNop: Date;

  @ManyToOne(() => GiangVien, { eager: true })
  @JoinColumn({ name: 'giang_vien_id' })
  giangVien: GiangVien;

  @Column({ name: 'giang_vien_id', nullable: true })
  giangVienId: number;

  @Column({ type: 'text', nullable: true })
  moTa: string;

  @Column({ name: 'file_dinh_kem', length: 500, nullable: true })
  fileDinhKem: string;

  @CreateDateColumn({ name: 'ngay_tao' })
  ngayTao: Date;
}
