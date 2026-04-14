import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
  OneToOne,
} from "typeorm";

@Entity("vai_tro")
export class VaiTro {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "ten_vai_tro" })
  ten_vai_tro: string;
}

@Entity("sinh_vien")
export class SinhVien {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "nguoi_dung_id", nullable: true })
  nguoi_dung_id: number;

  @Column({ nullable: true })
  mssv: string;

  @Column({ name: "ho_ten", nullable: true })
  ho_ten: string;

  @Column({ nullable: true })
  lop: string;

  @Column({ name: "ma_qr", nullable: true })
  ma_qr: string;
}

@Entity("giang_vien")
export class GiangVien {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "nguoi_dung_id", nullable: true })
  nguoi_dung_id: number;

  @Column({ name: "ho_ten", nullable: true })
  ho_ten: string;

  @Column({ name: "bo_mon", nullable: true })
  bo_mon: string;
}

@Entity("nguoi_dung")
export class NguoiDung {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  email: string;

  @Column({ name: "mat_khau" })
  mat_khau: string;

  @Column({ name: "vai_tro_id", nullable: true })
  vai_tro_id: number;

  @ManyToOne(() => VaiTro)
  @JoinColumn({ name: "vai_tro_id" })
  vaiTro: VaiTro;
}

@Entity("hoc_phan")
export class HocPhan {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "ten_hoc_phan", nullable: true })
  ten_hoc_phan: string;

  @Column({ name: "so_tin_chi", nullable: true })
  so_tin_chi: number;
}

@Entity("lop_hoc_phan")
export class LopHocPhan {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "hoc_phan_id", nullable: true })
  hoc_phan_id: number;

  @Column({ name: "giang_vien_id", nullable: true })
  giang_vien_id: number;

  @Column({ name: "hoc_ky", nullable: true })
  hoc_ky: string;

  @Column({ name: "si_so_toi_da", default: 50 })
  si_so_toi_da: number;

  @Column({ name: "ma_lop", nullable: true })
  ma_lop: string;

  @ManyToOne(() => HocPhan)
  @JoinColumn({ name: "hoc_phan_id" })
  hocPhan: HocPhan;

  @ManyToOne(() => GiangVien)
  @JoinColumn({ name: "giang_vien_id" })
  giangVien: GiangVien;
}

@Entity("dang_ky_hoc")
export class DangKyHoc {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "sinh_vien_id", nullable: true })
  sinh_vien_id: number;

  @Column({ name: "lop_hoc_phan_id", nullable: true })
  lop_hoc_phan_id: number;

  @Column({ name: "ngay_dang_ky", type: "date", default: () => "CURRENT_DATE" })
  ngay_dang_ky: Date;
}

@Entity("lich_hoc")
export class LichHoc {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "lop_hoc_phan_id", nullable: true })
  lop_hoc_phan_id: number;

  @Column({ nullable: true })
  thu: number;

  @Column({ name: "gio_bat_dau", type: "time", nullable: true })
  gio_bat_dau: string;

  @Column({ name: "gio_ket_thuc", type: "time", nullable: true })
  gio_ket_thuc: string;

  @Column({ nullable: true })
  phong: string;
}

@Entity("buoi_hoc")
export class BuoiHoc {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "lop_hoc_phan_id", nullable: true })
  lop_hoc_phan_id: number;

  @Column({ name: "ngay_hoc", type: "date", nullable: true })
  ngay_hoc: Date;

  @Column({ default: "hoc" })
  trang_thai: string;
}

@Entity("phien_diem_danh")
export class PhienDiemDanh {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "buoi_hoc_id", nullable: true })
  buoi_hoc_id: number;

  @Column({ name: "ma_qr_phien", nullable: true })
  ma_qr_phien: string;

  @Column({ type: "timestamp", nullable: true })
  bat_dau: Date;

  @Column({ type: "timestamp", nullable: true })
  ket_thuc: Date;
}

@Entity("diem_danh")
export class DiemDanh {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "buoi_hoc_id", nullable: true })
  buoi_hoc_id: number;

  @Column({ name: "sinh_vien_id", nullable: true })
  sinh_vien_id: number;

  @Column({ nullable: true })
  trang_thai: string;

  @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP" })
  thoi_gian: Date;

  @Column({ name: "hinh_thuc", nullable: true })
  hinh_thuc: string;
}

@Entity("bai_tap")
export class BaiTap {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "lop_hoc_phan_id", nullable: true })
  lop_hoc_phan_id: number;

  @Column({ name: "ten_bai_tap", nullable: true })
  ten_bai_tap: string;

  @Column({ name: "han_nop", type: "date", nullable: true })
  han_nop: Date;

  @Column({ name: "giang_vien_id", nullable: true })
  giang_vien_id: number;

  @Column({ type: "text", nullable: true })
  mo_ta: string;

  @Column({
    name: "ngay_tao",
    type: "timestamp",
    default: () => "CURRENT_TIMESTAMP",
  })
  ngay_tao: Date;
}

@Entity("nop_bai")
export class NopBai {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "bai_tap_id", nullable: true })
  bai_tap_id: number;

  @Column({ name: "sinh_vien_id", nullable: true })
  sinh_vien_id: number;

  @Column({ name: "ngay_nop", type: "date", nullable: true })
  ngay_nop: Date;

  @Column({ nullable: true })
  trang_thai: string;
}

@Entity("diem_ren_luyen")
export class DiemRenLuyen {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "sinh_vien_id", nullable: true })
  sinh_vien_id: number;

  @Column({ name: "tong_diem", nullable: true })
  tong_diem: number;

  @Column({ name: "xep_loai", nullable: true })
  xep_loai: string;

  @Column({ name: "hoc_ky", nullable: true })
  hoc_ky: string;
}

@Entity("phan_cong_giang_day")
export class PhanCongGiangDay {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "giang_vien_id", nullable: true })
  giang_vien_id: number;

  @Column({ name: "lop_hoc_phan_id", nullable: true })
  lop_hoc_phan_id: number;
}

@Entity("su_kien")
export class SuKien {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "ten_su_kien", nullable: true })
  ten_su_kien: string;

  @Column({ type: "text", nullable: true })
  mo_ta: string;

  @Column({ name: "ngay_to_chuc", type: "date", nullable: true })
  ngay_to_chuc: Date;

  @Column({ nullable: true })
  dia_diem: string;

  @Column({ name: "diem_ren_luyen", nullable: true })
  diem_ren_luyen: number;
}

@Entity("phieu_yeu_cau")
export class PhieuYeuCau {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "sinh_vien_id", nullable: true })
  sinh_vien_id: number;

  @Column({ name: "loai_yeu_cau", nullable: true })
  loai_yeu_cau: string;

  @Column({ type: "text", nullable: true })
  noi_dung: string;

  @Column({ default: "cho_xu_ly" })
  trang_thai: string;

  @Column({
    name: "ngay_tao",
    type: "timestamp",
    default: () => "CURRENT_TIMESTAMP",
  })
  ngay_tao: Date;
}
