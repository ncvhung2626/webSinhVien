import { Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';

@Injectable()
export class AdminSuKienService {
  constructor(private dataSource: DataSource) {}

  async layDanhSachAdminSuKien(page: string = '1', limit: string = '10', search: string = '') {
    const pageNum = parseInt(page);
    const limitNum = parseInt(limit);
    const offset = (pageNum - 1) * limitNum;

    try {
      let danhSach = [];
      let ketQuaDem = [];

      const baseSelect = `
      SELECT sk.id, sk.ten_su_kien, sk.mo_ta, sk.ngay_to_chuc, sk.dia_diem, sk.diem_cong, sk.admin_id, COUNT(dk.id) AS so_dang_ky
      FROM su_kien sk
      LEFT JOIN dang_ky_su_kien dk ON dk.su_kien_id = sk.id
    `;

      if (search) {
        danhSach = await this.dataSource.query(
          `${baseSelect} WHERE sk.ten_su_kien ILIKE $1 OR sk.dia_diem ILIKE $1 GROUP BY sk.id ORDER BY sk.ngay_to_chuc DESC LIMIT $2 OFFSET $3`,
          [`%${search}%`, limitNum, offset],
        );
        ketQuaDem = await this.dataSource.query(`SELECT COUNT(*) AS tong_so FROM su_kien WHERE ten_su_kien ILIKE $1 OR dia_diem ILIKE $1`, [`%${search}%`]);
      } else {
        danhSach = await this.dataSource.query(`${baseSelect} GROUP BY sk.id ORDER BY sk.ngay_to_chuc DESC LIMIT $1 OFFSET $2`, [limitNum, offset]);
        ketQuaDem = await this.dataSource.query('SELECT COUNT(*) AS tong_so FROM su_kien');
      }

      const tongSo = parseInt(ketQuaDem[0].tong_so);
      const kqTongDK = await this.dataSource.query('SELECT COUNT(*) AS tong FROM dang_ky_su_kien');
      const kqSapToi = await this.dataSource.query(`SELECT COUNT(*) AS tong FROM su_kien WHERE ngay_to_chuc >= CURRENT_DATE`);

      return {
        thanh_cong: true,
        du_lieu: danhSach,
        tong_so: tongSo,
        tong_so_trang: Math.ceil(tongSo / limitNum),
        trang_hien_tai: pageNum,
        tong_dang_ky: parseInt(kqTongDK[0].tong),
        sap_toi: parseInt(kqSapToi[0].tong),
      };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi Database: ' + error.message };
    }
  }

  async layDanhSachDangKy(id: string, trangThai: string = '') {
    try {
      let danhSach = [];
      const baseQuery = `
      SELECT dk.id AS dang_ky_id, dk.trang_thai, dk.thoi_gian_dang_ky, sv.id AS sinh_vien_id, sv.mssv, sv.ho_ten, sv.lop
      FROM dang_ky_su_kien dk
      JOIN sinh_vien sv ON dk.sinh_vien_id = sv.id
      WHERE dk.su_kien_id = $1
    `;

      if (trangThai) {
        danhSach = await this.dataSource.query(`${baseQuery} AND dk.trang_thai = $2 ORDER BY dk.thoi_gian_dang_ky DESC`, [id, trangThai]);
      } else {
        danhSach = await this.dataSource.query(`${baseQuery} ORDER BY dk.thoi_gian_dang_ky DESC`, [id]);
      }

      const kqThongKe = await this.dataSource.query(
        `SELECT COUNT(*) AS tong, COUNT(*) FILTER (WHERE trang_thai = 'xac_nhan') AS xac_nhan,
                COUNT(*) FILTER (WHERE trang_thai = 'cho_xet')  AS cho_xet, COUNT(*) FILTER (WHERE trang_thai = 'huy') AS huy
         FROM dang_ky_su_kien WHERE su_kien_id = $1`, [id]
      );

      const tk = kqThongKe[0];
      return { thanh_cong: true, du_lieu: danhSach, thong_ke: { tong: parseInt(tk.tong), xac_nhan: parseInt(tk.xac_nhan), cho_xet: parseInt(tk.cho_xet), huy: parseInt(tk.huy) } };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi: ' + error.message };
    }
  }

  async themAdminSuKien(body: any) {
    const { ten_su_kien, mo_ta, ngay_to_chuc, dia_diem, diem_cong } = body;
    if (!ten_su_kien || !ngay_to_chuc) return { thanh_cong: false, thong_bao: 'Tên sự kiện và Ngày tổ chức không được để trống!' };

    try {
      await this.dataSource.query(
        `INSERT INTO su_kien (ten_su_kien, mo_ta, ngay_to_chuc, dia_diem, diem_cong) VALUES ($1, $2, $3, $4, $5)`,
        [ten_su_kien, mo_ta || null, ngay_to_chuc, dia_diem || null, diem_cong || null]
      );
      return { thanh_cong: true, thong_bao: 'Đã tạo sự kiện thành công!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi khi thêm: ' + error.message };
    }
  }

  async suaAdminSuKien(id: string, body: any) {
    const { ten_su_kien, mo_ta, ngay_to_chuc, dia_diem, diem_cong } = body;
    if (!ten_su_kien || !ngay_to_chuc) return { thanh_cong: false, thong_bao: 'Tên sự kiện và Ngày tổ chức không được để trống!' };

    try {
      await this.dataSource.query(
        `UPDATE su_kien SET ten_su_kien = $1, mo_ta = $2, ngay_to_chuc = $3, dia_diem = $4, diem_cong = $5 WHERE id = $6`,
        [ten_su_kien, mo_ta || null, ngay_to_chuc, dia_diem || null, diem_cong || null, id]
      );
      return { thanh_cong: true, thong_bao: 'Cập nhật sự kiện thành công!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi cập nhật: ' + error.message };
    }
  }

  async xoaAdminSuKien(id: string) {
    try {
      await this.dataSource.query('DELETE FROM dang_ky_su_kien WHERE su_kien_id = $1', [id]);
      await this.dataSource.query('DELETE FROM su_kien WHERE id = $1', [id]);
      return { thanh_cong: true, thong_bao: 'Đã xóa sự kiện thành công!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi khi xóa: ' + error.message };
    }
  }

  async capNhatTrangThaiDangKy(id: string, body: any) {
    const { trang_thai } = body;
    const cacTrangThaiHopLe = ['xac_nhan', 'cho_xet', 'huy'];
    if (!cacTrangThaiHopLe.includes(trang_thai)) return { thanh_cong: false, thong_bao: 'Trạng thái không hợp lệ!' };

    try {
      await this.dataSource.query('UPDATE dang_ky_su_kien SET trang_thai = $1 WHERE id = $2', [trang_thai, id]);
      return { thanh_cong: true, thong_bao: 'Đã cập nhật trạng thái!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi: ' + error.message };
    }
  }
}
