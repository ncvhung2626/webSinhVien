import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('nguoi_dung')
export class NguoiDung {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  email: string;

  @Column()
  mat_khau: string;
}
