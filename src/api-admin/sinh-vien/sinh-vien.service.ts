import { Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';
import * as bcrypt from 'bcrypt';
import * as xlsx from 'xlsx';

const BCRYPT_ROUNDS = 10;

@Injectable()
export class AdminSinhVienService {
  constructor(private dataSource: DataSource) {}

  async layDanhSachAdminSinhVien(page: string = '1', limit: string = '10', search: string = '') {
    const pageNum = parseInt(page);
    const limitNum = parseInt(limit);
    const offset = (pageNum - 1) * limitNum;

    try {
      let danhSach = [];
      let ketQuaDem = [];

      if (search) {
        const queryStr = `
          SELECT sv.id, sv.mssv, sv.ho_ten, sv.lop, nd.email, nd.mat_khau
          FROM sinh_vien sv
          JOIN nguoi_dung nd ON sv.nguoi_dung_id = nd.id
          WHERE sv.mssv ILIKE $1 OR sv.ho_ten ILIKE $1 
          ORDER BY sv.id DESC LIMIT $2 OFFSET $3
        `;
        danhSach = await this.dataSource.query(queryStr, [`%${search}%`, limitNum, offset]);

        const countQueryStr = `
          SELECT COUNT(*) as tong_so 
          FROM sinh_vien sv
          JOIN nguoi_dung nd ON sv.nguoi_dung_id = nd.id
          WHERE sv.mssv ILIKE $1 OR sv.ho_ten ILIKE $1
        `;
        ketQuaDem = await this.dataSource.query(countQueryStr, [`%${search}%`]);
      } else {
        danhSach = await this.dataSource.query(
          `
          SELECT sv.id, sv.mssv, sv.ho_ten, sv.lop, nd.email, nd.mat_khau
          FROM sinh_vien sv
          JOIN nguoi_dung nd ON sv.nguoi_dung_id = nd.id
          ORDER BY sv.id DESC LIMIT $1 OFFSET $2
        `,
          [limitNum, offset],
        );

        ketQuaDem = await this.dataSource.query('SELECT COUNT(*) as tong_so FROM sinh_vien');
      }

      const tongSo = parseInt(ketQuaDem[0].tong_so);
      const tongSoTrang = Math.ceil(tongSo / limitNum);

      return {
        thanh_cong: true,
        du_lieu: danhSach,
        tong_so_sinh_vien: tongSo,
        tong_so_trang: tongSoTrang,
        trang_hien_tai: pageNum,
      };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi Backend: ' + error.message };
    }
  }

  async themAdminSinhVien(body: any) {
    const { mssv, ho_ten, lop, email, mat_khau } = body;

    if (!mssv || !ho_ten) {
      return { thanh_cong: false, thong_bao: 'MSSV và Họ tên không được để trống!' };
    }
    if (!mat_khau) {
      return { thanh_cong: false, thong_bao: 'Mật khẩu không được để trống khi thêm mới!' };
    }

    const idVaiTroAdminSinhVien = 3;

    try {
      const kiemTraMssv = await this.dataSource.query(`SELECT id FROM sinh_vien WHERE mssv = $1`, [mssv]);
      if (kiemTraMssv.length > 0) return { thanh_cong: false, thong_bao: `MSSV "${mssv}" đã tồn tại trong hệ thống! Vui lòng kiểm tra lại.` };

      if (email) {
        const kiemTraEmail = await this.dataSource.query(`SELECT id FROM nguoi_dung WHERE email = $1`, [email]);
        if (kiemTraEmail.length > 0) return { thanh_cong: false, thong_bao: `Email "${email}" đã được dùng bởi tài khoản khác!` };
      }

      const matKhauDaMaHoa = await bcrypt.hash(mat_khau, BCRYPT_ROUNDS);
      const taiKhoanMoi = await this.dataSource.query(
        `INSERT INTO nguoi_dung (email, mat_khau, vai_tro_id) VALUES ($1, $2, $3) RETURNING id`,
        [email, matKhauDaMaHoa, idVaiTroAdminSinhVien],
      );

      const nguoiDungId = taiKhoanMoi[0].id;
      await this.dataSource.query(
        `INSERT INTO sinh_vien (mssv, ho_ten, lop, nguoi_dung_id) VALUES ($1, $2, $3, $4)`,
        [mssv, ho_ten, lop, nguoiDungId],
      );

      return { thanh_cong: true, thong_bao: `Đã thêm sinh viên "${ho_ten}" thành công!` };
    } catch (error: any) {
      if (error.message.includes('sinh_vien_mssv_key')) return { thanh_cong: false, thong_bao: `MSSV "${mssv}" đã tồn tại trong hệ thống!` };
      if (error.message.includes('nguoi_dung') && error.message.includes('unique')) return { thanh_cong: false, thong_bao: `Email "${email}" đã được sử dụng!` };
      return { thanh_cong: false, thong_bao: 'Lỗi hệ thống: ' + error.message };
    }
  }

  async xoaAdminSinhVien(id: string) {
    try {
      const timSv = await this.dataSource.query(`SELECT nguoi_dung_id FROM sinh_vien WHERE id = $1`, [id]);
      if (timSv.length === 0) return { thanh_cong: false, thong_bao: 'Không tìm thấy sinh viên!' };

      const nguoiDungId = timSv[0].nguoi_dung_id;
      await this.dataSource.query(`DELETE FROM sinh_vien WHERE id = $1`, [id]);
      await this.dataSource.query(`DELETE FROM nguoi_dung WHERE id = $1`, [nguoiDungId]);

      return { thanh_cong: true, thong_bao: 'Đã xóa sinh viên và tài khoản liên quan!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Không thể xóa (có thể SV đang có dữ liệu liên quan): ' + error.message };
    }
  }

  async suaAdminSinhVien(id: string, body: any) {
    const { mssv, ho_ten, lop, email, mat_khau } = body;
    try {
      await this.dataSource.query(`UPDATE sinh_vien SET mssv = $1, ho_ten = $2, lop = $3 WHERE id = $4`, [mssv, ho_ten, lop, id]);

      if (mat_khau && mat_khau.trim() !== '') {
        const matKhauDaMaHoa = await bcrypt.hash(mat_khau, BCRYPT_ROUNDS);
        await this.dataSource.query(
          `UPDATE nguoi_dung SET email = $1, mat_khau = $2 WHERE id = (SELECT nguoi_dung_id FROM sinh_vien WHERE id = $3)`,
          [email, matKhauDaMaHoa, id],
        );
      } else {
        await this.dataSource.query(
          `UPDATE nguoi_dung SET email = $1 WHERE id = (SELECT nguoi_dung_id FROM sinh_vien WHERE id = $2)`,
          [email, id],
        );
      }
      return { thanh_cong: true, thong_bao: 'Cập nhật thông tin thành công!' };
    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi hệ thống khi sửa sinh viên!' };
    }
  }

  async importAdminSinhVienTuExcel(buffer: Buffer) {
    try {
      const workbook = xlsx.read(buffer, { type: 'buffer' });
      const sheetName = workbook.SheetNames[0];
      const sheet = workbook.Sheets[sheetName];
      const data: any[] = xlsx.utils.sheet_to_json(sheet);

      if (!data || data.length === 0) {
        return { thanh_cong: false, thong_bao: 'File Excel không có dữ liệu!' };
      }

      let soThanhCong = 0;
      let soThatBai = 0;
      let loiChiTiet: string[] = [];

      for (let i = 0; i < data.length; i++) {
        const row = data[i];
        // Hỗ trợ các tên cột phổ biến
        const mssv = row['mssv'] || row['MSSV'] || row['Mã SV'] || row['Mã Sinh Viên'];
        const ho_ten = row['ho_ten'] || row['Họ Tên'] || row['Họ và Tên'] || row['hoten'];
        const lop = row['lop'] || row['Lớp'] || row['Lop'];
        const email = row['email'] || row['Email'] || row['EMAIL'];
        const mat_khau = row['mat_khau'] || row['Mật khẩu'] || row['Mat khau'] || row['matkhau'] || row['Mật Khẩu'];

        if (!mssv || !ho_ten) {
          soThatBai++;
          loiChiTiet.push(`Dòng ${i + 2}: Thiếu MSSV hoặc Họ tên`);
          continue;
        }

        if (!mat_khau) {
          soThatBai++;
          loiChiTiet.push(`Dòng ${i + 2}: Thiếu mật khẩu (MSSV: ${mssv})`);
          continue;
        }

        try {
          const kiemTraMssv = await this.dataSource.query(`SELECT id FROM sinh_vien WHERE mssv = $1`, [mssv]);
          if (kiemTraMssv.length > 0) {
            soThatBai++;
            loiChiTiet.push(`Dòng ${i + 2}: MSSV ${mssv} đã tồn tại`);
            continue;
          }

          if (email) {
            const kiemTraEmail = await this.dataSource.query(`SELECT id FROM nguoi_dung WHERE email = $1`, [email]);
            if (kiemTraEmail.length > 0) {
              soThatBai++;
              loiChiTiet.push(`Dòng ${i + 2}: Email ${email} đã tồn tại (MSSV: ${mssv})`);
              continue;
            }
          }

          const idVaiTroAdminSinhVien = 3;
          
          const taiKhoanMoi = await this.dataSource.query(
            `INSERT INTO nguoi_dung (email, mat_khau, vai_tro_id) VALUES ($1, $2, $3) RETURNING id`,
            [email ? email.toString() : null, mat_khau.toString(), idVaiTroAdminSinhVien],
          );

          const nguoiDungId = taiKhoanMoi[0].id;
          await this.dataSource.query(
            `INSERT INTO sinh_vien (mssv, ho_ten, lop, nguoi_dung_id) VALUES ($1, $2, $3, $4)`,
            [mssv.toString(), ho_ten.toString(), lop ? lop.toString() : null, nguoiDungId],
          );

          soThanhCong++;
        } catch (err: any) {
          soThatBai++;
          loiChiTiet.push(`Dòng ${i + 2}: Lỗi khi thêm MSSV ${mssv} - ${err.message}`);
        }
      }

      let thongBao = `Import hoàn tất! Thành công: ${soThanhCong}, Thất bại: ${soThatBai}.`;
      if (soThatBai > 0) {
        thongBao += `\\nChi tiết lỗi:\\n- ${loiChiTiet.join('\\n- ')}`;
      }

      return {
        thanh_cong: soThanhCong > 0,
        thong_bao: thongBao
      };

    } catch (error: any) {
      return { thanh_cong: false, thong_bao: 'Lỗi đọc file Excel: ' + error.message };
    }
  }
}
