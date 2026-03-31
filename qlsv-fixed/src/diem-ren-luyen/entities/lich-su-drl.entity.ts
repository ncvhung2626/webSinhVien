// Entity – bảng lich_su_diem_ren_luyen (id, sinh_vien_id, ly_do, diem_thay_doi, ngay_cap_nhat)
import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

@Entity('lich_su_diem_ren_luyen')
export class LichSuDiemRenLuyen {
  @PrimaryGeneratedColumn()
  id: number;

  // Sinh viên được cộng/trừ điểm
  @Column({ name: 'sinh_vien_id' })
  sinhVienId: number;

  // Lý do thay đổi điểm (VD: Tham gia sự kiện, Vắng học...)
  @Column({ name: 'ly_do', length: 255, nullable: true })
  lyDo: string;

  // Số điểm thay đổi (dương: cộng, âm: trừ)
  @Column({ name: 'diem_thay_doi' })
  diemThayDoi: number;

  // Thời điểm cập nhật
  @CreateDateColumn({ name: 'ngay_cap_nhat' })
  ngayCapNhat: Date;
}
