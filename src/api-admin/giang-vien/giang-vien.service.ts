import { Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';
import * as bcrypt from 'bcrypt';

const BCRYPT_ROUNDS = 10;

@Injectable()
export class AdminGiangVienService {
  constructor(private dataSource: DataSource) {}

  async layDanhSachAdminGiangVien(page: string = '1', limit: string = '10', search: string = '') {
    const pageNum = parseInt(page);
    const limitNum = parseInt(limit);
    const offset = (pageNum - 1) * limitNum;

    try {
      let danhSach = [];
      let ketQuaDem = [];

      if (search) {
        const queryStr = `
          SELECT gv.id, gv.ho_ten, gv.bo_mon, nd.email, nd.mat_khau
          FROM giang_vien gv
          JOIN nguoi_dung nd ON gv.nguoi_dung_id = nd.id
          WHERE gv.ho_ten ILIKE $1 OR gv.bo_mon ILIKE $1 
          ORDER BY gv.id DESC LIMIT $2 OFFSET $3
        `;
        danhSach = await this.dataSource.query(queryStr, [`%${search}%`, limitNum, offset]);

        const countQueryStr = `
          SELECT COUNT(*) as tong_so 
          FROM giang_vien gv
          JOIN nguoi_dung nd ON gv.nguoi_dung_id = nd.id
          WHERE gv.ho_ten ILIKE $1 OR gv.bo_mon ILIKE $1
        `;
        ketQuaDem = await this.dataSource.query(countQueryStr, [`%${search}%`]);
      } else {
        danhSach = await this.dataSource.query(
          `
          SELECT gv.id, gv.ho_ten, gv.bo_mon, nd.email, nd.mat_khau
          FROM giang_vien gv
          JOIN nguoi_dung nd ON gv.nguoi_dung_id = nd.id
          ORDER BY gv.id DESC LIMIT $1 OFFSET $2
        `,
          [limitNum, offset],
        );

        ketQuaDem = await this.dataSource.query('SELECT COUNT(*) as tong_so FROM giang_vien');
      }

      return {
        thanh_cong: true,
        du_lieu: danhSach,
        tong_so_trang: Math.ceil(parseInt(ketQuaDem[0].tong_so) / limitNum),
        trang_hien_tai: pageNum,
      };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi Backend: ' + error.message };
    }
  }

  async themAdminGiangVien(body: any) {
    const { ho_ten, bo_mon, email, mat_khau } = body;
    if (!mat_khau) return { thanh_cong: false, thong_bao: 'Mật khẩu không được để trống khi thêm mới!' };

    const idVaiTroAdminGiangVien = 2;

    try {
      const matKhauDaMaHoa = await bcrypt.hash(mat_khau, BCRYPT_ROUNDS);
      const taiKhoanMoi = await this.dataSource.query(
        `INSERT INTO nguoi_dung (email, mat_khau, vai_tro_id) VALUES ($1, $2, $3) RETURNING id`,
        [email, matKhauDaMaHoa, idVaiTroAdminGiangVien],
      );

      const nguoiDungId = taiKhoanMoi[0].id;
      await this.dataSource.query(
        `INSERT INTO giang_vien (ho_ten, bo_mon, nguoi_dung_id) VALUES ($1, $2, $3)`,
        [ho_ten, bo_mon, nguoiDungId],
      );

      return { thanh_cong: true, thong_bao: 'Đã thêm giảng viên thành công!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi khi thêm: ' + error.message };
    }
  }

  async suaAdminGiangVien(id: string, body: any) {
    const { ho_ten, bo_mon, email, mat_khau } = body;
    try {
      await this.dataSource.query(`UPDATE giang_vien SET ho_ten = $1, bo_mon = $2 WHERE id = $3`, [ho_ten, bo_mon, id]);

      if (mat_khau && mat_khau.trim() !== '') {
        const matKhauDaMaHoa = await bcrypt.hash(mat_khau, BCRYPT_ROUNDS);
        await this.dataSource.query(
          `UPDATE nguoi_dung SET email = $1, mat_khau = $2 WHERE id = (SELECT nguoi_dung_id FROM giang_vien WHERE id = $3)`,
          [email, matKhauDaMaHoa, id],
        );
      } else {
        await this.dataSource.query(
          `UPDATE nguoi_dung SET email = $1 WHERE id = (SELECT nguoi_dung_id FROM giang_vien WHERE id = $2)`,
          [email, id],
        );
      }
      return { thanh_cong: true, thong_bao: 'Cập nhật thành công!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi cập nhật: ' + error.message };
    }
  }

  async xoaAdminGiangVien(id: string) {
    try {
      const timGv = await this.dataSource.query(`SELECT nguoi_dung_id FROM giang_vien WHERE id = $1`, [id]);
      if (timGv.length === 0) return { thanh_cong: false, thong_bao: 'Không tìm thấy giảng viên!' };

      const nguoiDungId = timGv[0].nguoi_dung_id;
      await this.dataSource.query(`DELETE FROM giang_vien WHERE id = $1`, [id]);
      await this.dataSource.query(`DELETE FROM nguoi_dung WHERE id = $1`, [nguoiDungId]);

      return { thanh_cong: true, thong_bao: 'Đã xóa giảng viên và tài khoản liên quan!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Không thể xóa (có thể GV đang có dữ liệu giảng dạy): ' + error.message };
    }
  }
}
