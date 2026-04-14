import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

@Entity('phien_diem_danh')
export class PhienDiemDanh {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'lop_hoc_phan_id', nullable: true })
  lopHocPhanId: number;

  @Column({ name: 'buoi_hoc_id', nullable: true })
  buoiHocId: number;

  // BUG FIX: đổi 'ma_qr_phien' → 'ma_qr_session' để khớp với service/DB
  @Column({ name: 'ma_qr_session', length: 100, unique: true })
  maQrSession: string;

  @Column({ name: 'bat_dau', type: 'timestamp', nullable: true })
  batDau: Date;

  @Column({ name: 'ket_thuc', type: 'timestamp', nullable: true })
  thoiGianHetHan: Date;

  // BUG FIX: thêm cột da_dong thật sự trong DB thay vì chỉ là getter JS
  // Getter JS thuần không lưu vào DB, TypeORM không thể update được
  @Column({ name: 'da_dong', default: false })
  daDong: boolean;
}
