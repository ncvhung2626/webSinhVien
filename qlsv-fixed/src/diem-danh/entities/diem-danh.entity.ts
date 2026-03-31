import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn, CreateDateColumn } from 'typeorm';
import { SinhVien } from '../../sinh-vien/entities/sinh-vien.entity';

/*
  BẢNG: diem_danh
  THUỘC TÍNH:
    id           – khoá chính tự tăng
    buoi_hoc_id  – FK → phien_diem_danh.id (buổi học tương ứng)
    sinh_vien_id – FK → sinh_vien.id
    trang_thai   – 'co_mat' | 'vang_mat' | 'tre'
    thoi_gian    – thời điểm điểm danh (auto)
    hinh_thuc    – 'qr_code' | 'thu_cong'
  QUAN HỆ:
    sinhVien (eager) → mssv, hoTen
  VIEW SỬ DỤNG:
    sinh-vien.html  – tab Điểm danh QR: lịch sử điểm danh (trangThai, thoiGian)
    giang-vien.html – tab Quản lý điểm danh: hiển thị mssv, hoTen, trangThai,
                      hinhThuc, cho phép GV đổi trạng thái
*/
@Entity('diem_danh')
export class DiemDanh {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'buoi_hoc_id', nullable: true })
  buoiHocId: number;

  @ManyToOne(() => SinhVien, { eager: true })
  @JoinColumn({ name: 'sinh_vien_id' })
  sinhVien: SinhVien;

  @Column({ name: 'sinh_vien_id' })
  sinhVienId: number;

  @Column({ name: 'trang_thai', length: 20, default: 'co_mat' })
  trangThai: string;

  @CreateDateColumn({ name: 'thoi_gian' })
  thoiGian: Date;

  @Column({ name: 'hinh_thuc', length: 20, default: 'qr_code' })
  hinhThuc: string;
}
