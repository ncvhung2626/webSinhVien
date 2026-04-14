"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppModule = void 0;
const common_1 = require("@nestjs/common");
const config_1 = require("@nestjs/config");
const typeorm_1 = require("@nestjs/typeorm");
const auth_module_1 = require("./auth/auth.module");
const sinh_vien_module_1 = require("./sinh-vien/sinh-vien.module");
const giang_vien_module_1 = require("./giang-vien/giang-vien.module");
const hoc_phan_module_1 = require("./hoc-phan/hoc-phan.module");
const lop_hoc_phan_module_1 = require("./lop-hoc-phan/lop-hoc-phan.module");
const dang_ky_hoc_module_1 = require("./dang-ky-hoc/dang-ky-hoc.module");
const diem_danh_module_1 = require("./diem-danh/diem-danh.module");
const bai_tap_module_1 = require("./bai-tap/bai-tap.module");
const diem_ren_luyen_module_1 = require("./diem-ren-luyen/diem-ren-luyen.module");
const su_kien_module_1 = require("./su-kien/su-kien.module");
const payment_module_1 = require("./payment/payment.module");
const phieu_yeu_cau_module_1 = require("./phieu-yeu-cau/phieu-yeu-cau.module");
const auth_module_2 = require("./api-admin/admin-auth/auth.module");
const dashboard_module_1 = require("./api-admin/dashboard/dashboard.module");
const sinh_vien_module_2 = require("./api-admin/sinh-vien/sinh-vien.module");
const giang_vien_module_2 = require("./api-admin/giang-vien/giang-vien.module");
const lop_hoc_phan_module_2 = require("./api-admin/lop-hoc-phan/lop-hoc-phan.module");
const phan_cong_giang_day_module_1 = require("./api-admin/phan-cong-giang-day/phan-cong-giang-day.module");
const su_kien_module_2 = require("./api-admin/su-kien/su-kien.module");
let AppModule = class AppModule {
};
exports.AppModule = AppModule;
exports.AppModule = AppModule = __decorate([
    (0, common_1.Module)({
        imports: [
            config_1.ConfigModule.forRoot({ isGlobal: true }),
            typeorm_1.TypeOrmModule.forRoot({
                type: 'postgres',
                host: process.env.DB_HOST || 'localhost',
                port: +process.env.DB_PORT || 5432,
                username: process.env.DB_USER || 'postgres',
                password: process.env.DB_PASS || 'Ncvhung@2626',
                database: process.env.DB_NAME || 'quan_li_sv',
                autoLoadEntities: true,
                synchronize: false,
            }),
            auth_module_1.AuthModule,
            sinh_vien_module_1.SinhVienModule,
            giang_vien_module_1.GiangVienModule,
            hoc_phan_module_1.HocPhanModule,
            lop_hoc_phan_module_1.LopHocPhanModule,
            dang_ky_hoc_module_1.DangKyHocModule,
            diem_danh_module_1.DiemDanhModule,
            bai_tap_module_1.BaiTapModule,
            diem_ren_luyen_module_1.DiemRenLuyenModule,
            su_kien_module_1.SuKienModule,
            payment_module_1.PaymentModule,
            phieu_yeu_cau_module_1.PhieuYeuCauModule,
            auth_module_2.AdminAuthModule,
            dashboard_module_1.AdminDashboardModule,
            sinh_vien_module_2.AdminSinhVienModule,
            giang_vien_module_2.AdminGiangVienModule,
            lop_hoc_phan_module_2.AdminLopHocPhanModule,
            phan_cong_giang_day_module_1.AdminPhanCongGiangDayModule,
            su_kien_module_2.AdminSuKienModule,
        ],
    })
], AppModule);
//# sourceMappingURL=app.module.js.map