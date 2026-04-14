import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

/*
  BẢNG: hoc_phan
  THUỘC TÍNH:
    id          – khoá chính tự tăng
    ten_hoc_phan – tên học phần (VD: Lập Trình Java)
    so_tin_chi  – số tín chỉ (VD: 3)
  VIEW SỬ DỤNG: sinh-vien.html
    - Tab Đăng ký học phần: hiển thị tenHocPhan, soTinChi
    - Tab Thời khoá biểu: hiển thị tenHocPhan qua lop_hoc_phan
*/
@Entity('hoc_phan')
export class HocPhan {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'ten_hoc_phan', length: 100 })
  tenHocPhan: string;

  @Column({ name: 'so_tin_chi' })
  soTinChi: number;
}
