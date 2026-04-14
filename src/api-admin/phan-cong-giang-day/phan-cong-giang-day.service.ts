import { Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';

@Injectable()
export class AdminPhanCongGiangDayService {
  constructor(private dataSource: DataSource) {}

  async layDanhSachPhanCong(page: string = '1', limit: string = '10', search: string = '') {
    const pageNum = parseInt(page);
    const limitNum = parseInt(limit);
    const offset = (pageNum - 1) * limitNum;

    try {
      const baseSelect = `
      SELECT 
        pc.id, pc.giang_vien_id, pc.lop_hoc_phan_id,
        gv.ho_ten AS ten_giang_vien, gv.bo_mon,
        hp.ten_hoc_phan, hp.so_tin_chi, lhp.hoc_ky
      FROM phan_cong_giang_day pc
      JOIN giang_vien gv ON pc.giang_vien_id = gv.id
      JOIN lop_hoc_phan lhp ON pc.lop_hoc_phan_id = lhp.id
      JOIN hoc_phan hp ON lhp.hoc_phan_id = hp.id
    `;

      let danhSach = [];
      let ketQuaDem = [];

      if (search) {
        const q = `
        ${baseSelect}
        WHERE gv.ho_ten ILIKE $1 OR hp.ten_hoc_phan ILIKE $1 OR gv.bo_mon ILIKE $1
        ORDER BY pc.id DESC LIMIT $2 OFFSET $3
      `;
        danhSach = await this.dataSource.query(q, [`%${search}%`, limitNum, offset]);

        const qCount = `
        SELECT COUNT(*) AS tong_so
        FROM phan_cong_giang_day pc
        JOIN giang_vien gv ON pc.giang_vien_id = gv.id
        JOIN lop_hoc_phan lhp ON pc.lop_hoc_phan_id = lhp.id
        JOIN hoc_phan hp ON lhp.hoc_phan_id = hp.id
        WHERE gv.ho_ten ILIKE $1 OR hp.ten_hoc_phan ILIKE $1 OR gv.bo_mon ILIKE $1
      `;
        ketQuaDem = await this.dataSource.query(qCount, [`%${search}%`]);
      } else {
        danhSach = await this.dataSource.query(`${baseSelect} ORDER BY pc.id DESC LIMIT $1 OFFSET $2`, [limitNum, offset]);
        ketQuaDem = await this.dataSource.query('SELECT COUNT(*) AS tong_so FROM phan_cong_giang_day');
      }

      const tongSo = parseInt(ketQuaDem[0].tong_so);
      const kqGV = await this.dataSource.query('SELECT COUNT(DISTINCT giang_vien_id) AS so_gv FROM phan_cong_giang_day');
      const kqLop = await this.dataSource.query('SELECT COUNT(DISTINCT lop_hoc_phan_id) AS so_lop FROM phan_cong_giang_day');

      return {
        thanh_cong: true,
        du_lieu: danhSach,
        tong_so: tongSo,
        tong_so_trang: Math.ceil(tongSo / limitNum),
        trang_hien_tai: pageNum,
        so_giang_vien: kqGV[0].so_gv,
        so_lop: kqLop[0].so_lop,
      };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi Database: ' + error.message };
    }
  }

  async layDropdownPhanCong() {
    try {
      const giangVien = await this.dataSource.query(`SELECT id, ho_ten, bo_mon FROM giang_vien ORDER BY ho_ten ASC`);
      const lopHocPhan = await this.dataSource.query(`
      SELECT lhp.id, hp.ten_hoc_phan, hp.so_tin_chi, lhp.hoc_ky
      FROM lop_hoc_phan lhp
      JOIN hoc_phan hp ON lhp.hoc_phan_id = hp.id
      ORDER BY hp.ten_hoc_phan ASC, lhp.hoc_ky ASC
    `);
      return { thanh_cong: true, giangVien, lopHocPhan };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi lấy dropdown: ' + error.message };
    }
  }

  async themPhanCong(body: any) {
    const { giang_vien_id, lop_hoc_phan_id } = body;
    if (!giang_vien_id || !lop_hoc_phan_id) return { thanh_cong: false, thong_bao: 'Thiếu thông tin Giảng viên hoặc Lớp học phần!' };

    try {
      const kiemTra = await this.dataSource.query(
        `SELECT id FROM phan_cong_giang_day WHERE giang_vien_id = $1 AND lop_hoc_phan_id = $2`,
        [giang_vien_id, lop_hoc_phan_id],
      );
      if (kiemTra.length > 0) return { thanh_cong: false, thong_bao: 'Phân công này đã tồn tại!' };

      await this.dataSource.query(
        `INSERT INTO phan_cong_giang_day (giang_vien_id, lop_hoc_phan_id) VALUES ($1, $2)`,
        [giang_vien_id, lop_hoc_phan_id],
      );
      return { thanh_cong: true, thong_bao: 'Đã thêm phân công giảng dạy thành công!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi khi thêm: ' + error.message };
    }
  }

  async suaPhanCong(id: string, body: any) {
    const { giang_vien_id, lop_hoc_phan_id } = body;
    try {
      const kiemTra = await this.dataSource.query(
        `SELECT id FROM phan_cong_giang_day WHERE giang_vien_id = $1 AND lop_hoc_phan_id = $2 AND id != $3`,
        [giang_vien_id, lop_hoc_phan_id, id],
      );
      if (kiemTra.length > 0) return { thanh_cong: false, thong_bao: 'Phân công này đã tồn tại với một bản ghi khác!' };

      await this.dataSource.query(
        `UPDATE phan_cong_giang_day SET giang_vien_id = $1, lop_hoc_phan_id = $2 WHERE id = $3`,
        [giang_vien_id, lop_hoc_phan_id, id],
      );
      return { thanh_cong: true, thong_bao: 'Cập nhật phân công thành công!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi cập nhật: ' + error.message };
    }
  }

  async xoaPhanCong(id: string) {
    try {
      await this.dataSource.query(`DELETE FROM phan_cong_giang_day WHERE id = $1`, [id]);
      return { thanh_cong: true, thong_bao: 'Đã xóa phân công thành công!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi khi xóa: ' + error.message };
    }
  }
}
