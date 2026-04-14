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
exports.AdminDashboardService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("typeorm");
let AdminDashboardService = class AdminDashboardService {
    constructor(dataSource) {
        this.dataSource = dataSource;
    }
    async layDuLieuAdminDashboard() {
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
        }
        catch (error) {
            console.error('Lỗi lấy dữ liệu AdminDashboard:', error);
            return {
                thanh_cong: false,
                thong_bao: 'Lỗi truy xuất cơ sở dữ liệu!',
                chi_tiet: error.message,
            };
        }
    }
};
exports.AdminDashboardService = AdminDashboardService;
exports.AdminDashboardService = AdminDashboardService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [typeorm_1.DataSource])
], AdminDashboardService);
//# sourceMappingURL=dashboard.service.js.map