import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn } from 'typeorm';
import { NguoiDung } from '../../auth/entities/nguoi-dung.entity';

/*
  BẢNG: sinh_vien
  THUỘC TÍNH:
    id            – khoá chính tự tăng
    nguoi_dung_id – FK → nguoi_dung.id (tài khoản đăng nhập)
    mssv          – mã số sinh viên, duy nhất
    ho_ten        – họ và tên đầy đủ
    lop           – lớp học (VD: CNTT22A)
    ma_qr         – mã QR cá nhân dùng cho điểm danh
  VIEW SỬ DỤNG: sinh-vien.html
    - Hiển thị: hoTen, mssv, lop (trang Thông tin cá nhân)
    - maQr dùng khi GV quét QR danh sách SV
*/
@Entity('sinh_vien')
export class SinhVien {
  @PrimaryGeneratedColumn()
  id: number;

  @OneToOne(() => NguoiDung, { eager: false })
  @JoinColumn({ name: 'nguoi_dung_id' })
  nguoiDung: NguoiDung;

  @Column({ name: 'nguoi_dung_id', nullable: true })
  nguoiDungId: number;

  @Column({ length: 20, unique: true })
  mssv: string;

  @Column({ name: 'ho_ten', length: 100 })
  hoTen: string;

  @Column({ length: 20, nullable: true })
  lop: string;

  @Column({ name: 'ma_qr', length: 100, nullable: true })
  maQr: string;
}
