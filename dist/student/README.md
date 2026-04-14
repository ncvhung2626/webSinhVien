# 🎓 QLSV - Hệ thống Quản lý Sinh viên (Public Portal)

## Cấu trúc project

```
qlsv_final/
├── admin/                  ← Backend NestJS
│   ├── src/
│   │   ├── main.ts
│   │   ├── app.module.ts
│   │   ├── entities.ts     ← Tất cả entities
│   │   ├── auth/
│   │   ├── sinh-vien/
│   │   ├── giang-vien/
│   │   ├── lop-hoc-phan/
│   │   ├── diem-danh/
│   │   ├── bai-tap/
│   │   ├── diem-ren-luyen/
│   │   └── phieu-yeu-cau/
│   ├── dist/               ← Đã build sẵn
│   ├── .env                ← Cấu hình DB & email
│   └── package.json
│
└── frontend/               ← Frontend HTML
    ├── login.html          ← Đăng nhập
    ├── js/api.js
    ├── giang-vien/
    │   └── dashboard.html  ← Dashboard Giảng viên
    └── sinh-vien/
        └── dashboard.html  ← Dashboard Sinh viên
```

---

## ⚡ HƯỚNG DẪN CHẠY (Chỉ 3 bước)

### Bước 1: Import Database

```bash
# Tạo database
psql -U postgres -c "CREATE DATABASE qlsv;"

# Import SQL
psql -U postgres -d qlsv -f qlsv.sql
```

### Bước 2: Cấu hình & Chạy Backend

```bash
cd admin

# Sửa file .env theo thông tin DB của bạn:
# DB_HOST=localhost
# DB_PORT=5432
# DB_USER=postgres
# DB_PASS=MẬT_KHẨU_CỦA_BẠN
# DB_NAME=qlsv

# Cài dependencies
npm install

# Chạy server (development - có hot reload)
npm run start:dev

# HOẶC chạy production (nhanh hơn, đã build sẵn)
npm run start:prod
```

✅ Server chạy tại: **http://localhost:3000**

> **Lưu ý:** Lần đầu chạy, TypeORM sẽ tự động tạo bảng `phieu_yeu_cau` nếu chưa có.

### Bước 3: Mở Frontend

Mở file `frontend/login.html` bằng trình duyệt.
Hoặc dùng **Live Server** (VS Code extension) để tránh lỗi CORS.

---

## 🔑 Tài khoản đăng nhập

Tài khoản nằm trong bảng `nguoi_dung` của database.

- Mật khẩu trong DB được hash bằng **bcryptjs**
- Vai trò: `sinh_vien` hoặc `giang_vien` (bảng `vai_tro`)

Nếu muốn tạo tài khoản test, chạy SQL sau:

```sql
-- Thêm vai trò nếu chưa có
INSERT INTO vai_tro (ten_vai_tro) VALUES ('sinh_vien'), ('giang_vien') ON CONFLICT DO NOTHING;

-- Tạo tài khoản giảng viên (password: 123456)
INSERT INTO nguoi_dung (email, mat_khau, vai_tro_id)
VALUES ('gv@test.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 
        (SELECT id FROM vai_tro WHERE ten_vai_tro = 'giang_vien'));

-- Tạo tài khoản sinh viên (password: 123456)
INSERT INTO nguoi_dung (email, mat_khau, vai_tro_id)
VALUES ('sv@test.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
        (SELECT id FROM vai_tro WHERE ten_vai_tro = 'sinh_vien'));
```

---

## 📡 API Endpoints

| Method | Endpoint | Mô tả | Auth |
|--------|----------|-------|------|
| POST | /api/auth/login | Đăng nhập | ❌ |
| GET | /api/auth/me | Thông tin user hiện tại | ✅ |
| GET | /api/sinh-vien/ca-nhan | Thông tin cá nhân SV | ✅ |
| GET | /api/sinh-vien/lop/:lopId | DS sinh viên theo lớp | ✅ |
| GET | /api/giang-vien/ca-nhan | Thông tin GV | ✅ |
| GET | /api/lop-hoc-phan/giang-vien | Lớp của GV | ✅ |
| GET | /api/lop-hoc-phan/sinh-vien | Lớp của SV | ✅ |
| GET | /api/lop-hoc-phan/:id/chi-tiet | Chi tiết lớp | ✅ |
| GET | /api/lop-hoc-phan/:id/thong-ke | Thống kê buổi học | ✅ |
| POST | /api/lop-hoc-phan/:id/buoi-hoc | Tạo buổi học | ✅ |
| POST | /api/lop-hoc-phan/buoi-hoc/:id/phien-diem-danh | Tạo QR điểm danh | ✅ |
| POST | /api/diem-danh/qr | SV quét QR | ✅ |
| GET | /api/diem-danh/buoi/:buoiId | Điểm danh 1 buổi | ✅ |
| GET | /api/diem-danh/lich-su-vang | Lịch sử vắng SV | ✅ |
| GET | /api/diem-danh/thong-ke-vang/:lopId | Thống kê vắng lớp | ✅ |
| GET | /api/bai-tap/lop/:lopId | BT theo lớp (GV) | ✅ |
| GET | /api/bai-tap/sinh-vien/:lopId | BT của SV | ✅ |
| POST | /api/bai-tap | Tạo bài tập | ✅ |
| POST | /api/bai-tap/:id/nop | Nộp bài | ✅ |
| GET | /api/bai-tap/:id/danh-sach-nop | DS đã nộp (GV) | ✅ |
| GET | /api/diem-ren-luyen/ca-nhan | Điểm RL của SV | ✅ |
| GET | /api/diem-ren-luyen/tat-ca | Điểm RL tất cả | ✅ |
| POST | /api/phieu-yeu-cau | Tạo phiếu YC | ✅ |
| GET | /api/phieu-yeu-cau/cua-toi | Phiếu của SV | ✅ |
| GET | /api/phieu-yeu-cau/tat-ca | Tất cả phiếu (GV) | ✅ |
| PUT | /api/phieu-yeu-cau/:id/trang-thai | Cập nhật trạng thái | ✅ |

---

## 🔧 Công nghệ

- **Backend:** NestJS 10 + TypeORM + PostgreSQL
- **Frontend:** HTML5 + Bootstrap 5 + Vanilla JS
- **Auth:** JWT (24h)
- **QR:** qrcode npm package
- **Email:** Nodemailer (Gmail App Password)
- **Password:** bcryptjs
