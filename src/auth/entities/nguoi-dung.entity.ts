// Entity – bảng nguoi_dung (id, email, mat_khau, vai_tro_id)
import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { VaiTro } from './vai-tro.entity';

@Entity('nguoi_dung')
export class NguoiDung {
  @PrimaryGeneratedColumn()
  id: number;

  // Email đăng nhập – duy nhất trong hệ thống
  @Column({ unique: true, length: 100 })
  email: string;

  // Mật khẩu đã băm bcrypt
  @Column({ name: 'mat_khau', length: 255 })
  matKhau: string;

  // Khoá ngoại vai_tro_id → bảng vai_tro
  @ManyToOne(() => VaiTro, { eager: true, nullable: true })
  @JoinColumn({ name: 'vai_tro_id' })
  vaiTro: VaiTro;
}
