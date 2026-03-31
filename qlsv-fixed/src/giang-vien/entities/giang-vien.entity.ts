import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn } from 'typeorm';
import { NguoiDung } from '../../auth/entities/nguoi-dung.entity';

/*
  BẢNG: giang_vien
  THUỘC TÍNH:
    id            – khoá chính tự tăng
    nguoi_dung_id – FK → nguoi_dung.id
    ho_ten        – họ tên giảng viên
    bo_mon        – bộ môn giảng dạy
  VIEW SỬ DỤNG: giang-vien.html
    - Hiển thị: hoTen, boMon (sidebar, trang thông tin cá nhân)
    - giangVienId dùng để lọc lop_hoc_phan, bai_tap
*/
@Entity('giang_vien')
export class GiangVien {
  @PrimaryGeneratedColumn()
  id: number;

  @OneToOne(() => NguoiDung, { eager: false })
  @JoinColumn({ name: 'nguoi_dung_id' })
  nguoiDung: NguoiDung;

  @Column({ name: 'nguoi_dung_id', nullable: true })
  nguoiDungId: number;

  @Column({ name: 'ho_ten', length: 100 })
  hoTen: string;

  @Column({ name: 'bo_mon', length: 100, nullable: true })
  boMon: string;
}
