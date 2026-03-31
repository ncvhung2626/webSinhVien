import { Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';

@Injectable()
export class DashboardService {
  constructor(private dataSource: DataSource) {}

  async layDuLieuDashboard() {
    try {
      const kqSinhVien = await this.dataSource.query('SELECT COUNT(*) as total FROM sinh_vien');
      const kqGiangVien = await this.dataSource.query('SELECT COUNT(*) as total FROM giang_vien');
      const kqLopHoc = await this.dataSource.query('SELECT COUNT(*) as total FROM lop_hoc_phan');
      const kqSuKien = await this.dataSource.query('SELECT COUNT(*) as total FROM su_kien');

      const kqDiemDanh = await this.dataSource.query(`
        SELECT trang_thai, COUNT(*) as so_luong 
        FROM diem_danh 
        GROUP BY trang_thai
      `);

      const kqNopBai = await this.dataSource.query(`
        SELECT trang_thai, COUNT(*) as so_luong 
        FROM nop_bai 
        GROUP BY trang_thai
      `);

      const topSinhVien = await this.dataSource.query(`
        SELECT sv.mssv, sv.ho_ten, drl.tong_diem, drl.xep_loai
        FROM diem_ren_luyen drl
        JOIN sinh_vien sv ON drl.sinh_vien_id = sv.id
        ORDER BY drl.tong_diem DESC
        LIMIT 5
      `);

      return {
        thanh_cong: true,
        the_thong_ke: {
          tong_sinh_vien: kqSinhVien[0].total,
          tong_giang_vien: kqGiangVien[0].total,
          tong_lop_hoc: kqLopHoc[0].total,
          tong_su_kien: kqSuKien[0].total,
        },
        diem_danh: kqDiemDanh,
        nop_bai: kqNopBai,
        top_sinh_vien: topSinhVien,
      };
    } catch (error: any) {
      console.error('Lỗi lấy dữ liệu Dashboard:', error);
      return {
        thanh_cong: false,
        thong_bao: 'Lỗi truy xuất cơ sở dữ liệu!',
        chi_tiet: error.message,
      };
    }
  }
}
