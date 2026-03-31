// Entity – bảng vai_tro (id, ten_vai_tro)
import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('vai_tro')
export class VaiTro {
  @PrimaryGeneratedColumn()
  id: number;

  // Giá trị: sinh_vien | giang_vien | admin
  @Column({ name: 'ten_vai_tro', length: 50 })
  tenVaiTro: string;
}
