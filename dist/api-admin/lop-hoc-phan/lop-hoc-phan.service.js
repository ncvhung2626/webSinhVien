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
exports.AdminLopHocPhanService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("typeorm");
let AdminLopHocPhanService = class AdminLopHocPhanService {
    constructor(dataSource) {
        this.dataSource = dataSource;
    }
    async layDanhSachAdminLopHocPhan(page = '1', limit = '10', search = '') {
        const pageNum = parseInt(page);
        const limitNum = parseInt(limit);
        const offset = (pageNum - 1) * limitNum;
        try {
            let danhSach = [];
            let ketQuaDem = [];
            const baseSelect = `
        SELECT lhp.id, lhp.hoc_phan_id, lhp.giang_vien_id, lhp.hoc_ky, 
               hp.ten_hoc_phan, hp.so_tin_chi, 
               gv.ho_ten
        FROM lop_hoc_phan lhp
        LEFT JOIN hoc_phan hp ON lhp.hoc_phan_id = hp.id
        LEFT JOIN giang_vien gv ON lhp.giang_vien_id = gv.id
      `;
            if (search) {
                const queryStr = `
          ${baseSelect}
          WHERE hp.ten_hoc_phan ILIKE $1 
             OR gv.ho_ten ILIKE $1 
             OR CAST(lhp.hoc_ky AS TEXT) ILIKE $1
          ORDER BY lhp.id DESC LIMIT $2 OFFSET $3
        `;
                danhSach = await this.dataSource.query(queryStr, [`%${search}%`, limitNum, offset]);
                const countQueryStr = `
          SELECT COUNT(*) as tong_so 
          FROM lop_hoc_phan lhp
          LEFT JOIN hoc_phan hp ON lhp.hoc_phan_id = hp.id
          LEFT JOIN giang_vien gv ON lhp.giang_vien_id = gv.id
          WHERE hp.ten_hoc_phan ILIKE $1 OR gv.ho_ten ILIKE $1 OR CAST(lhp.hoc_ky AS TEXT) ILIKE $1
        `;
                ketQuaDem = await this.dataSource.query(countQueryStr, [`%${search}%`]);
            }
            else {
                danhSach = await this.dataSource.query(`${baseSelect} ORDER BY lhp.id DESC LIMIT $1 OFFSET $2`, [limitNum, offset]);
                ketQuaDem = await this.dataSource.query('SELECT COUNT(*) as tong_so FROM lop_hoc_phan');
            }
            return {
                thanh_cong: true,
                du_lieu: danhSach,
                tong_so_trang: Math.ceil(parseInt(ketQuaDem[0].tong_so) / limitNum),
                trang_hien_tai: pageNum,
            };
        }
        catch (error) {
            return { thanh_cong: false, thong_bao: 'Lỗi Database: ' + error.message };
        }
    }
    async themAdminLopHocPhan(body) {
        const { hoc_phan_id, giang_vien_id, hoc_ky } = body;
        try {
            await this.dataSource.query(`INSERT INTO lop_hoc_phan (hoc_phan_id, giang_vien_id, hoc_ky) VALUES ($1, $2, $3)`, [hoc_phan_id, giang_vien_id, hoc_ky]);
            return { thanh_cong: true, thong_bao: 'Đã thêm lớp học phần thành công!' };
        }
        catch (error) {
            return { thanh_cong: false, thong_bao: 'Lỗi khi thêm: ' + error.message };
        }
    }
    async suaAdminLopHocPhan(id, body) {
        const { hoc_phan_id, giang_vien_id, hoc_ky } = body;
        try {
            await this.dataSource.query(`UPDATE lop_hoc_phan SET hoc_phan_id = $1, giang_vien_id = $2, hoc_ky = $3 WHERE id = $4`, [hoc_phan_id, giang_vien_id, hoc_ky, id]);
            return { thanh_cong: true, thong_bao: 'Cập nhật thành công!' };
        }
        catch (error) {
            return { thanh_cong: false, thong_bao: 'Lỗi cập nhật: ' + error.message };
        }
    }
    async xoaAdminLopHocPhan(id) {
        try {
            await this.dataSource.query(`DELETE FROM lop_hoc_phan WHERE id = $1`, [id]);
            return { thanh_cong: true, thong_bao: 'Đã xóa lớp học phần thành công!' };
        }
        catch (error) {
            return { thanh_cong: false, thong_bao: 'Không thể xóa: ' + error.message };
        }
    }
    async layDanhSachChoDropdown() {
        try {
            const hocPhan = await this.dataSource.query(`SELECT id, ten_hoc_phan FROM hoc_phan ORDER BY ten_hoc_phan ASC`);
            const giangVien = await this.dataSource.query(`SELECT id, ho_ten FROM giang_vien ORDER BY ho_ten ASC`);
            return { thanh_cong: true, hocPhan: hocPhan, giangVien: giangVien };
        }
        catch (error) {
            return { thanh_cong: false, thong_bao: 'Lỗi lấy danh sách Dropdown: ' + error.message };
        }
    }
};
exports.AdminLopHocPhanService = AdminLopHocPhanService;
exports.AdminLopHocPhanService = AdminLopHocPhanService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [typeorm_1.DataSource])
], AdminLopHocPhanService);
//# sourceMappingURL=lop-hoc-phan.service.js.map