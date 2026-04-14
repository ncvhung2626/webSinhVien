import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn, CreateDateColumn } from 'typeorm';
import { SinhVien }   from '../../sinh-vien/entities/sinh-vien.entity';
import { LopHocPhan } from '../../lop-hoc-phan/entities/lop-hoc-phan.entity';

/*
  BẢNG: dang_ky_hoc
  THUỘC TÍNH:
    id             – khoá chính tự tăng
    sinh_vien_id   – FK → sinh_vien.id
    lop_hoc_phan_id– FK → lop_hoc_phan.id
    ngay_dang_ky   – ngày đăng ký (mặc định ngày hiện tại)
    da_thanh_toan  – trạng thái thanh toán (false/true)
  QUAN HỆ:
    sinhVien  (eager) → mssv, hoTen
    lopHocPhan(eager) → hocPhan.tenHocPhan, hocPhan.soTinChi, giangVien.hoTen
  VIEW SỬ DỤNG:
    sinh-vien.html  – tab Lịch sử đăng ký: hiển thị lopHocPhan.hocPhan.tenHocPhan,
                      ngayDangKy, daThanhToan
    giang-vien.html – tab SV Đăng ký: hiển thị sinhVien.mssv, sinhVien.hoTen,
                      daThanhToan
*/
@Entity('dang_ky_hoc')
export class DangKyHoc {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => SinhVien, { eager: true })
  @JoinColumn({ name: 'sinh_vien_id' })
  sinhVien: SinhVien;

  @Column({ name: 'sinh_vien_id' })
  sinhVienId: number;

  @ManyToOne(() => LopHocPhan, { eager: true })
  @JoinColumn({ name: 'lop_hoc_phan_id' })
  lopHocPhan: LopHocPhan;

  @Column({ name: 'lop_hoc_phan_id' })
  lopHocPhanId: number;

  @Column({ name: 'ngay_dang_ky', type: 'date', default: () => 'CURRENT_DATE' })
  ngayDangKy: Date;

  @Column({ name: 'da_thanh_toan', default: false })
  daThanhToan: boolean;
}
