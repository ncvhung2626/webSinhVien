# Hệ thống Quản lý Sinh viên (Web Student Management)

Hệ thống quản lý sinh viên được xây dựng dựa trên kiến trúc NestJS MVC, cung cấp đầy đủ các tính năng cho Sinh viên, Giảng viên và Quản trị viên.

## 🚀 Công nghệ sử dụng

*   **Backend**: NestJS (Node.js framework)
*   **Database**: PostgreSQL với TypeORM
*   **Authentication**: JWT (JSON Web Token) & Passport
*   **Tích hợp**:
    *   EmailJS (Gửi OTP quên mật khẩu)
    *   VNPay (Thanh toán học phí trực tuyến)
    *   XLSX (Xuất nhập dữ liệu Excel)
    *   QRCode (Tạo mã QR cho các giao dịch/thông tin)

## ✨ Tính năng chính

### 1. Dành cho Sinh viên
*   Đăng ký môn học / Học phần.
*   Xem lịch học và kết quả học tập.
*   Thanh toán học phí trực tuyến qua VNPay.
*   Quản lý thông tin cá nhân và đổi mật khẩu.
*   Đăng ký tham gia sự kiện.

### 2. Dành cho Giảng viên
*   Quản lý danh sách lớp học và sinh viên.
*   Sắp xếp lịch dạy và điểm danh sinh viên.
*   Nhập điểm và quản lý kết quả học tập.

### 3. Hệ thống
*   Chức năng quên mật khẩu qua OTP (EmailJS).
*   Giao diện responsive, thân thiện với người dùng.

## 🛠 Cài đặt và Chạy dự án

1. **Clone dự án**:
   ```bash
   git clone https://github.com/ncvhung2626/WebSinhVien.git
   ```

2. **Cài đặt dependencies**:
   ```bash
   npm install
   ```

3. **Cấu hình môi trường**:
   Tạo file `.env` từ `.env.example` và điền các thông tin kết nối Database, EmailJS, VNPay.

4. **Chạy dự án ở chế độ phát triển**:
   ```bash
   npm run start:dev
   ```

## 📄 Giấy phép
Dự án được phát triển phục vụ mục đích học tập.
