// Entity – bảng password_reset_otps (lưu mã OTP quên mật khẩu)
import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { NguoiDung } from './nguoi-dung.entity';

@Entity('password_reset_otps')
export class PasswordResetOtp {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'user_id' })
  userId: number;

  @ManyToOne(() => NguoiDung, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'user_id' })
  user: NguoiDung;

  @Column({ name: 'otp_code', length: 6 })
  otpCode: string;

  @Column({ name: 'expires_at', type: 'timestamp' })
  expiresAt: Date;

  @Column({ name: 'is_verified', default: false })
  isVerified: boolean;

  @Column({ name: 'created_at', type: 'timestamp', default: () => 'NOW()' })
  createdAt: Date;
}
