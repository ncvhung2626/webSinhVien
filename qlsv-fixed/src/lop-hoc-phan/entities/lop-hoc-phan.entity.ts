import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { HocPhan }  from '../../hoc-phan/entities/hoc-phan.entity';
import { GiangVien } from '../../giang-vien/entities/giang-vien.entity';

/*
  BẢNG: lop_hoc_phan
  THUỘC TÍNH:
    id           – khoá chính tự tăng
    hoc_phan_id  – FK → hoc_phan.id
    giang_vien_id– FK → giang_vien.id
    hoc_ky       – học kỳ (VD: HK2-2024-2025)
  QUAN HỆ:
    hocPhan  (eager) → tenHocPhan, soTinChi
    giangVien(eager) → hoTen, boMon
  VIEW SỬ DỤNG:
    sinh-vien.html  – tab Đăng ký: hiển thị tenHocPhan, soTinChi, hoTen GV, hocKy
    sinh-vien.html  – tab Thời khoá biểu: liệt kê lớp đã đăng ký
    giang-vien.html – tab Lớp học phần: danh sách lớp của GV đang đăng nhập
    giang-vien.html – tab Tạo QR: chọn lớp để tạo phiên điểm danh
*/
@Entity('lop_hoc_phan')
export class LopHocPhan {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => HocPhan, { eager: true })
  @JoinColumn({ name: 'hoc_phan_id' })
  hocPhan: HocPhan;

  @Column({ name: 'hoc_phan_id' })
  hocPhanId: number;

  @ManyToOne(() => GiangVien, { eager: true })
  @JoinColumn({ name: 'giang_vien_id' })
  giangVien: GiangVien;

  @Column({ name: 'giang_vien_id', nullable: true })
  giangVienId: number;

  @Column({ name: 'hoc_ky', length: 20, nullable: true })
  hocKy: string;
}
