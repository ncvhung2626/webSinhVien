"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PhieuYeuCau = exports.SuKien = exports.PhanCongGiangDay = exports.DiemRenLuyen = exports.NopBai = exports.BaiTap = exports.DiemDanh = exports.PhienDiemDanh = exports.BuoiHoc = exports.LichHoc = exports.DangKyHoc = exports.LopHocPhan = exports.HocPhan = exports.NguoiDung = exports.GiangVien = exports.SinhVien = exports.VaiTro = void 0;
const typeorm_1 = require("typeorm");
let VaiTro = class VaiTro {
};
exports.VaiTro = VaiTro;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], VaiTro.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ten_vai_tro" }),
    __metadata("design:type", String)
], VaiTro.prototype, "ten_vai_tro", void 0);
exports.VaiTro = VaiTro = __decorate([
    (0, typeorm_1.Entity)("vai_tro")
], VaiTro);
let SinhVien = class SinhVien {
};
exports.SinhVien = SinhVien;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], SinhVien.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "nguoi_dung_id", nullable: true }),
    __metadata("design:type", Number)
], SinhVien.prototype, "nguoi_dung_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], SinhVien.prototype, "mssv", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ho_ten", nullable: true }),
    __metadata("design:type", String)
], SinhVien.prototype, "ho_ten", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], SinhVien.prototype, "lop", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ma_qr", nullable: true }),
    __metadata("design:type", String)
], SinhVien.prototype, "ma_qr", void 0);
exports.SinhVien = SinhVien = __decorate([
    (0, typeorm_1.Entity)("sinh_vien")
], SinhVien);
let GiangVien = class GiangVien {
};
exports.GiangVien = GiangVien;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], GiangVien.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "nguoi_dung_id", nullable: true }),
    __metadata("design:type", Number)
], GiangVien.prototype, "nguoi_dung_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ho_ten", nullable: true }),
    __metadata("design:type", String)
], GiangVien.prototype, "ho_ten", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "bo_mon", nullable: true }),
    __metadata("design:type", String)
], GiangVien.prototype, "bo_mon", void 0);
exports.GiangVien = GiangVien = __decorate([
    (0, typeorm_1.Entity)("giang_vien")
], GiangVien);
let NguoiDung = class NguoiDung {
};
exports.NguoiDung = NguoiDung;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], NguoiDung.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)(),
    __metadata("design:type", String)
], NguoiDung.prototype, "email", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "mat_khau" }),
    __metadata("design:type", String)
], NguoiDung.prototype, "mat_khau", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "vai_tro_id", nullable: true }),
    __metadata("design:type", Number)
], NguoiDung.prototype, "vai_tro_id", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => VaiTro),
    (0, typeorm_1.JoinColumn)({ name: "vai_tro_id" }),
    __metadata("design:type", VaiTro)
], NguoiDung.prototype, "vaiTro", void 0);
exports.NguoiDung = NguoiDung = __decorate([
    (0, typeorm_1.Entity)("nguoi_dung")
], NguoiDung);
let HocPhan = class HocPhan {
};
exports.HocPhan = HocPhan;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], HocPhan.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ten_hoc_phan", nullable: true }),
    __metadata("design:type", String)
], HocPhan.prototype, "ten_hoc_phan", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "so_tin_chi", nullable: true }),
    __metadata("design:type", Number)
], HocPhan.prototype, "so_tin_chi", void 0);
exports.HocPhan = HocPhan = __decorate([
    (0, typeorm_1.Entity)("hoc_phan")
], HocPhan);
let LopHocPhan = class LopHocPhan {
};
exports.LopHocPhan = LopHocPhan;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], LopHocPhan.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "hoc_phan_id", nullable: true }),
    __metadata("design:type", Number)
], LopHocPhan.prototype, "hoc_phan_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "giang_vien_id", nullable: true }),
    __metadata("design:type", Number)
], LopHocPhan.prototype, "giang_vien_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "hoc_ky", nullable: true }),
    __metadata("design:type", String)
], LopHocPhan.prototype, "hoc_ky", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "si_so_toi_da", default: 50 }),
    __metadata("design:type", Number)
], LopHocPhan.prototype, "si_so_toi_da", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ma_lop", nullable: true }),
    __metadata("design:type", String)
], LopHocPhan.prototype, "ma_lop", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => HocPhan),
    (0, typeorm_1.JoinColumn)({ name: "hoc_phan_id" }),
    __metadata("design:type", HocPhan)
], LopHocPhan.prototype, "hocPhan", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => GiangVien),
    (0, typeorm_1.JoinColumn)({ name: "giang_vien_id" }),
    __metadata("design:type", GiangVien)
], LopHocPhan.prototype, "giangVien", void 0);
exports.LopHocPhan = LopHocPhan = __decorate([
    (0, typeorm_1.Entity)("lop_hoc_phan")
], LopHocPhan);
let DangKyHoc = class DangKyHoc {
};
exports.DangKyHoc = DangKyHoc;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], DangKyHoc.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "sinh_vien_id", nullable: true }),
    __metadata("design:type", Number)
], DangKyHoc.prototype, "sinh_vien_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "lop_hoc_phan_id", nullable: true }),
    __metadata("design:type", Number)
], DangKyHoc.prototype, "lop_hoc_phan_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ngay_dang_ky", type: "date", default: () => "CURRENT_DATE" }),
    __metadata("design:type", Date)
], DangKyHoc.prototype, "ngay_dang_ky", void 0);
exports.DangKyHoc = DangKyHoc = __decorate([
    (0, typeorm_1.Entity)("dang_ky_hoc")
], DangKyHoc);
let LichHoc = class LichHoc {
};
exports.LichHoc = LichHoc;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], LichHoc.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "lop_hoc_phan_id", nullable: true }),
    __metadata("design:type", Number)
], LichHoc.prototype, "lop_hoc_phan_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", Number)
], LichHoc.prototype, "thu", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "gio_bat_dau", type: "time", nullable: true }),
    __metadata("design:type", String)
], LichHoc.prototype, "gio_bat_dau", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "gio_ket_thuc", type: "time", nullable: true }),
    __metadata("design:type", String)
], LichHoc.prototype, "gio_ket_thuc", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], LichHoc.prototype, "phong", void 0);
exports.LichHoc = LichHoc = __decorate([
    (0, typeorm_1.Entity)("lich_hoc")
], LichHoc);
let BuoiHoc = class BuoiHoc {
};
exports.BuoiHoc = BuoiHoc;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], BuoiHoc.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "lop_hoc_phan_id", nullable: true }),
    __metadata("design:type", Number)
], BuoiHoc.prototype, "lop_hoc_phan_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ngay_hoc", type: "date", nullable: true }),
    __metadata("design:type", Date)
], BuoiHoc.prototype, "ngay_hoc", void 0);
__decorate([
    (0, typeorm_1.Column)({ default: "hoc" }),
    __metadata("design:type", String)
], BuoiHoc.prototype, "trang_thai", void 0);
exports.BuoiHoc = BuoiHoc = __decorate([
    (0, typeorm_1.Entity)("buoi_hoc")
], BuoiHoc);
let PhienDiemDanh = class PhienDiemDanh {
};
exports.PhienDiemDanh = PhienDiemDanh;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], PhienDiemDanh.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "buoi_hoc_id", nullable: true }),
    __metadata("design:type", Number)
], PhienDiemDanh.prototype, "buoi_hoc_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ma_qr_phien", nullable: true }),
    __metadata("design:type", String)
], PhienDiemDanh.prototype, "ma_qr_phien", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: "timestamp", nullable: true }),
    __metadata("design:type", Date)
], PhienDiemDanh.prototype, "bat_dau", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: "timestamp", nullable: true }),
    __metadata("design:type", Date)
], PhienDiemDanh.prototype, "ket_thuc", void 0);
exports.PhienDiemDanh = PhienDiemDanh = __decorate([
    (0, typeorm_1.Entity)("phien_diem_danh")
], PhienDiemDanh);
let DiemDanh = class DiemDanh {
};
exports.DiemDanh = DiemDanh;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], DiemDanh.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "buoi_hoc_id", nullable: true }),
    __metadata("design:type", Number)
], DiemDanh.prototype, "buoi_hoc_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "sinh_vien_id", nullable: true }),
    __metadata("design:type", Number)
], DiemDanh.prototype, "sinh_vien_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], DiemDanh.prototype, "trang_thai", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: "timestamp", default: () => "CURRENT_TIMESTAMP" }),
    __metadata("design:type", Date)
], DiemDanh.prototype, "thoi_gian", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "hinh_thuc", nullable: true }),
    __metadata("design:type", String)
], DiemDanh.prototype, "hinh_thuc", void 0);
exports.DiemDanh = DiemDanh = __decorate([
    (0, typeorm_1.Entity)("diem_danh")
], DiemDanh);
let BaiTap = class BaiTap {
};
exports.BaiTap = BaiTap;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], BaiTap.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "lop_hoc_phan_id", nullable: true }),
    __metadata("design:type", Number)
], BaiTap.prototype, "lop_hoc_phan_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ten_bai_tap", nullable: true }),
    __metadata("design:type", String)
], BaiTap.prototype, "ten_bai_tap", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "han_nop", type: "date", nullable: true }),
    __metadata("design:type", Date)
], BaiTap.prototype, "han_nop", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "giang_vien_id", nullable: true }),
    __metadata("design:type", Number)
], BaiTap.prototype, "giang_vien_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: "text", nullable: true }),
    __metadata("design:type", String)
], BaiTap.prototype, "mo_ta", void 0);
__decorate([
    (0, typeorm_1.Column)({
        name: "ngay_tao",
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP",
    }),
    __metadata("design:type", Date)
], BaiTap.prototype, "ngay_tao", void 0);
exports.BaiTap = BaiTap = __decorate([
    (0, typeorm_1.Entity)("bai_tap")
], BaiTap);
let NopBai = class NopBai {
};
exports.NopBai = NopBai;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], NopBai.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "bai_tap_id", nullable: true }),
    __metadata("design:type", Number)
], NopBai.prototype, "bai_tap_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "sinh_vien_id", nullable: true }),
    __metadata("design:type", Number)
], NopBai.prototype, "sinh_vien_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ngay_nop", type: "date", nullable: true }),
    __metadata("design:type", Date)
], NopBai.prototype, "ngay_nop", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], NopBai.prototype, "trang_thai", void 0);
exports.NopBai = NopBai = __decorate([
    (0, typeorm_1.Entity)("nop_bai")
], NopBai);
let DiemRenLuyen = class DiemRenLuyen {
};
exports.DiemRenLuyen = DiemRenLuyen;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], DiemRenLuyen.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "sinh_vien_id", nullable: true }),
    __metadata("design:type", Number)
], DiemRenLuyen.prototype, "sinh_vien_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "tong_diem", nullable: true }),
    __metadata("design:type", Number)
], DiemRenLuyen.prototype, "tong_diem", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "xep_loai", nullable: true }),
    __metadata("design:type", String)
], DiemRenLuyen.prototype, "xep_loai", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "hoc_ky", nullable: true }),
    __metadata("design:type", String)
], DiemRenLuyen.prototype, "hoc_ky", void 0);
exports.DiemRenLuyen = DiemRenLuyen = __decorate([
    (0, typeorm_1.Entity)("diem_ren_luyen")
], DiemRenLuyen);
let PhanCongGiangDay = class PhanCongGiangDay {
};
exports.PhanCongGiangDay = PhanCongGiangDay;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], PhanCongGiangDay.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "giang_vien_id", nullable: true }),
    __metadata("design:type", Number)
], PhanCongGiangDay.prototype, "giang_vien_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "lop_hoc_phan_id", nullable: true }),
    __metadata("design:type", Number)
], PhanCongGiangDay.prototype, "lop_hoc_phan_id", void 0);
exports.PhanCongGiangDay = PhanCongGiangDay = __decorate([
    (0, typeorm_1.Entity)("phan_cong_giang_day")
], PhanCongGiangDay);
let SuKien = class SuKien {
};
exports.SuKien = SuKien;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], SuKien.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ten_su_kien", nullable: true }),
    __metadata("design:type", String)
], SuKien.prototype, "ten_su_kien", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: "text", nullable: true }),
    __metadata("design:type", String)
], SuKien.prototype, "mo_ta", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "ngay_to_chuc", type: "date", nullable: true }),
    __metadata("design:type", Date)
], SuKien.prototype, "ngay_to_chuc", void 0);
__decorate([
    (0, typeorm_1.Column)({ nullable: true }),
    __metadata("design:type", String)
], SuKien.prototype, "dia_diem", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "diem_ren_luyen", nullable: true }),
    __metadata("design:type", Number)
], SuKien.prototype, "diem_ren_luyen", void 0);
exports.SuKien = SuKien = __decorate([
    (0, typeorm_1.Entity)("su_kien")
], SuKien);
let PhieuYeuCau = class PhieuYeuCau {
};
exports.PhieuYeuCau = PhieuYeuCau;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], PhieuYeuCau.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "sinh_vien_id", nullable: true }),
    __metadata("design:type", Number)
], PhieuYeuCau.prototype, "sinh_vien_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: "loai_yeu_cau", nullable: true }),
    __metadata("design:type", String)
], PhieuYeuCau.prototype, "loai_yeu_cau", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: "text", nullable: true }),
    __metadata("design:type", String)
], PhieuYeuCau.prototype, "noi_dung", void 0);
__decorate([
    (0, typeorm_1.Column)({ default: "cho_xu_ly" }),
    __metadata("design:type", String)
], PhieuYeuCau.prototype, "trang_thai", void 0);
__decorate([
    (0, typeorm_1.Column)({
        name: "ngay_tao",
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP",
    }),
    __metadata("design:type", Date)
], PhieuYeuCau.prototype, "ngay_tao", void 0);
exports.PhieuYeuCau = PhieuYeuCau = __decorate([
    (0, typeorm_1.Entity)("phieu_yeu_cau")
], PhieuYeuCau);
//# sourceMappingURL=entities.js.map