// Entity – bảng su_kien (id, ten_su_kien, mo_ta, ngay_to_chuc, dia_diem, diem_cong, admin_id)
import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

@Entity('su_kien')
export class SuKien {
  @PrimaryGeneratedColumn()
  id: number;

  // Tên sự kiện
  @Column({ name: 'ten_su_kien', length: 150 })
  tenSuKien: string;

  // Mô tả chi tiết
  @Column({ type: 'text', nullable: true })
  moTa: string;

  // Ngày tổ chức
  @Column({ name: 'ngay_to_chuc', type: 'date' })
  ngayToChuc: Date;

  // Địa điểm tổ chức
  @Column({ name: 'dia_diem', length: 100, nullable: true })
  diaDiem: string;

  // Số điểm rèn luyện được cộng khi tham gia
  @Column({ name: 'diem_cong', default: 0 })
  diemCong: number;

  // ID admin tạo sự kiện
  @Column({ name: 'admin_id', nullable: true })
  adminId: number;
}
