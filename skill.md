# SKILL: Chức năng Quên Mật Khẩu với EmailJS (OTP)

## Mô tả
Skill này hướng dẫn triển khai chức năng **Quên Mật Khẩu** dùng OTP gửi qua EmailJS,
áp dụng cho hệ thống có **Sinh viên** và **Giảng viên**.
Stack: **NestJS + PostgreSQL + EmailJS**.

Đặc điểm: Vì DB chứa các email chưa được xác thực (sv1@vaa.edu.vn, gv1@vaa.edu.vn...),
hệ thống sẽ **gửi OTP đồng thời về 2 địa chỉ**:
- Mail người dùng nhập (sv1@vaa.edu.vn)
- Mail chính chủ của developer (2431540140@vaa.edu.vn) — để demo/kiểm tra

---

## Thông tin EmailJS

> ⚠️ Khuyến nghị: Lưu các giá trị này vào file `.env`, không hardcode trong code.

```env
VITE_EMAILJS_PUBLIC_KEY=bFM-nD0lVfJ7sTH-X
VITE_EMAILJS_SERVICE_ID=service_du34qah
VITE_EMAILJS_TEMPLATE_ID=template_dkaoehp
VITE_DEVELOPER_EMAIL=2431540140@vaa.edu.vn
```

---

## Workflow tổng quan

```
User nhập email (sv1@vaa.edu.vn)
        ↓
Frontend gọi POST /auth/forgot-password
        ↓
NestJS kiểm tra email → tạo OTP 6 số → lưu DB (TTL 5 phút)
        ↓
NestJS trả về { otpCode, userName, userEmail }
        ↓
Frontend gọi EmailJS gửi song song 2 email:
  ├─ → sv1@vaa.edu.vn        (email người dùng)
  └─ → 2431540140@vaa.edu.vn (email developer để demo)
        ↓
User nhập OTP → POST /auth/verify-otp
        ↓
OTP đúng → User nhập mật khẩu mới → POST /auth/reset-password
        ↓
NestJS cập nhật mật khẩu + xóa OTP → Hoàn tất
```

---

## Bước 1 — Cấu hình EmailJS Template

Vào EmailJS Dashboard → Email Templates → chỉnh template `template_dkaoehp`:

```
Subject: Mã xác nhận đặt lại mật khẩu

Xin chào {{to_name}},

Mã OTP của bạn là:

  {{ otp_code }}

Mã có hiệu lực trong 5 phút.
Không chia sẻ mã này cho bất kỳ ai.
```

**Các biến template cần có:**
| Biến | Mô tả |
|---|---|
| `{{to_name}}` | Tên người dùng |
| `{{to_email}}` | Email nhận (EmailJS tự map) |
| `{{otp_code}}` | Mã OTP 6 số |

---

## Bước 2 — Database PostgreSQL

```sql
CREATE TABLE password_reset_otps (
  id          SERIAL PRIMARY KEY,
  user_id     INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  otp_code    VARCHAR(6) NOT NULL,
  expires_at  TIMESTAMP NOT NULL,
  is_verified BOOLEAN DEFAULT FALSE,
  created_at  TIMESTAMP DEFAULT NOW()
);
```

---

## Bước 3 — NestJS Backend

### 3.1 Entity (TypeORM)

```typescript
// password-reset-otp.entity.ts
import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { User } from './user.entity';

@Entity('password_reset_otps')
export class PasswordResetOtp {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: 'user_id' })
  userId: number;

  @ManyToOne(() => User, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'user_id' })
  user: User;

  @Column({ name: 'otp_code', length: 6 })
  otpCode: string;

  @Column({ name: 'expires_at' })
  expiresAt: Date;

  @Column({ name: 'is_verified', default: false })
  isVerified: boolean;

  @Column({ name: 'created_at', default: () => 'NOW()' })
  createdAt: Date;
}
```

### 3.2 API: Tạo OTP — POST /auth/forgot-password

```typescript
// auth.service.ts
async forgotPassword(email: string) {
  // 1. Tìm user theo email (sinh viên hoặc giảng viên)
  const user = await this.userRepo.findOne({ where: { email } });
  if (!user) throw new NotFoundException('Email không tồn tại trong hệ thống');

  // 2. Tạo OTP 6 số
  const otpCode = Math.floor(100000 + Math.random() * 900000).toString();

  // 3. Xóa OTP cũ (nếu có), lưu OTP mới
  await this.otpRepo.delete({ userId: user.id });
  await this.otpRepo.save({
    userId: user.id,
    otpCode,
    expiresAt: new Date(Date.now() + 5 * 60 * 1000), // 5 phút
  });

  // 4. Trả về để frontend gửi email
  return {
    otpCode,
    userName: user.name,
    userEmail: user.email,
  };
}
```

```typescript
// auth.controller.ts
@Post('forgot-password')
forgotPassword(@Body('email') email: string) {
  return this.authService.forgotPassword(email);
}
```

### 3.3 API: Xác thực OTP — POST /auth/verify-otp

```typescript
// auth.service.ts
async verifyOtp(email: string, otpCode: string) {
  const user = await this.userRepo.findOne({ where: { email } });
  if (!user) throw new NotFoundException('Email không tồn tại');

  const record = await this.otpRepo.findOne({
    where: { userId: user.id, otpCode },
  });

  if (!record) throw new BadRequestException('Mã OTP không đúng');

  if (new Date() > record.expiresAt) {
    await this.otpRepo.delete({ id: record.id });
    throw new BadRequestException('Mã OTP đã hết hạn, vui lòng thử lại');
  }

  await this.otpRepo.update({ id: record.id }, { isVerified: true });

  return { message: 'Xác thực OTP thành công' };
}
```

```typescript
// auth.controller.ts
@Post('verify-otp')
verifyOtp(
  @Body('email') email: string,
  @Body('otpCode') otpCode: string,
) {
  return this.authService.verifyOtp(email, otpCode);
}
```

### 3.4 API: Đặt lại mật khẩu — POST /auth/reset-password

```typescript
// auth.service.ts
async resetPassword(email: string, newPassword: string) {
  const user = await this.userRepo.findOne({ where: { email } });
  if (!user) throw new NotFoundException('Email không tồn tại');

  const record = await this.otpRepo.findOne({
    where: { userId: user.id, isVerified: true },
  });
  if (!record) throw new BadRequestException('Bạn chưa xác thực OTP');

  const hashed = await bcrypt.hash(newPassword, 10);
  await this.userRepo.update(user.id, { password: hashed });
  await this.otpRepo.delete({ userId: user.id });

  return { message: 'Đặt lại mật khẩu thành công' };
}
```

```typescript
// auth.controller.ts
@Post('reset-password')
resetPassword(
  @Body('email') email: string,
  @Body('newPassword') newPassword: string,
) {
  return this.authService.resetPassword(email, newPassword);
}
```

---

## Bước 4 — Frontend: Gửi OTP qua EmailJS (2 đích)

```javascript
// forgotPassword.js
import emailjs from '@emailjs/browser';

const EMAILJS_PUBLIC_KEY   = import.meta.env.VITE_EMAILJS_PUBLIC_KEY;
const EMAILJS_SERVICE_ID   = import.meta.env.VITE_EMAILJS_SERVICE_ID;
const EMAILJS_TEMPLATE_ID  = import.meta.env.VITE_EMAILJS_TEMPLATE_ID;
const DEVELOPER_EMAIL      = import.meta.env.VITE_DEVELOPER_EMAIL; // 2431540140@vaa.edu.vn

export const handleForgotPassword = async (email) => {
  // 1. Gọi NestJS API → tạo OTP
  const res = await fetch(`${import.meta.env.VITE_API_URL}/auth/forgot-password`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email }),
  });

  if (!res.ok) throw new Error('Email không tồn tại trong hệ thống');
  const { otpCode, userName, userEmail } = await res.json();

  // 2. Gửi OTP đồng thời đến 2 địa chỉ email
  await Promise.all([
    // Email 1 → gửi về mail người dùng nhập (sv1@vaa.edu.vn)
    emailjs.send(
      EMAILJS_SERVICE_ID,
      EMAILJS_TEMPLATE_ID,
      {
        to_email: userEmail,
        to_name: userName,
        otp_code: otpCode,
      },
      EMAILJS_PUBLIC_KEY
    ),

    // Email 2 → gửi về mail chính chủ developer (để demo)
    emailjs.send(
      EMAILJS_SERVICE_ID,
      EMAILJS_TEMPLATE_ID,
      {
        to_email: DEVELOPER_EMAIL,
        to_name: `[DEMO] ${userName}`,
        otp_code: otpCode,
      },
      EMAILJS_PUBLIC_KEY
    ),
  ]);

  return { success: true };
};
```

---

## Bước 5 — Frontend: Xác thực OTP + Đổi mật khẩu

```javascript
// verifyOtp.js
export const handleVerifyOtp = async (email, otpCode) => {
  const res = await fetch(`${import.meta.env.VITE_API_URL}/auth/verify-otp`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, otpCode }),
  });

  if (!res.ok) {
    const err = await res.json();
    throw new Error(err.message || 'OTP không đúng hoặc đã hết hạn');
  }

  return { success: true };
};

// resetPassword.js
export const handleResetPassword = async (email, newPassword) => {
  const res = await fetch(`${import.meta.env.VITE_API_URL}/auth/reset-password`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, newPassword }),
  });

  if (!res.ok) {
    const err = await res.json();
    throw new Error(err.message || 'Có lỗi xảy ra, vui lòng thử lại');
  }

  return { success: true };
};
```

---

## Checklist triển khai

| # | Việc cần làm | Ghi chú |
|---|---|---|
| 1 | Cập nhật template EmailJS với biến `{{otp_code}}` | template_dkaoehp |
| 2 | Tạo bảng `password_reset_otps` trong PostgreSQL | Có cột `is_verified` |
| 3 | Tạo Entity TypeORM cho bảng OTP | |
| 4 | API `POST /auth/forgot-password` | Trả về otpCode |
| 5 | API `POST /auth/verify-otp` | Đánh dấu is_verified = true |
| 6 | API `POST /auth/reset-password` | Kiểm tra is_verified trước khi đổi |
| 7 | Frontend gửi 2 email song song bằng `Promise.all` | |
| 8 | Frontend form: nhập email → nhập OTP → nhập mật khẩu mới | |
| 9 | Lưu credentials vào `.env`, không hardcode | Bảo mật |

---

## Lưu ý bảo mật

- **Không trả `otpCode` trong response production** — chỉ dùng khi demo
- Đặt giới hạn **rate limiting** cho API forgot-password (tránh spam)
- OTP chỉ có hiệu lực **5 phút**, sau đó tự hết hạn
- Xóa OTP ngay sau khi đổi mật khẩu thành công
- **Regenerate lại EmailJS Public Key** sau khi demo xong vì key đã bị lộ trong chat

//tiếp tục làm cho tôi chức năng quên mật khẩu cho sinh viên và giảng viên bằng emailjs với  public token: bFM-nD0lVfJ7sTH-X service ID: service_du34qah và temple ID: template_dkaoehp khi tôi bấm quên mk ở mail chưa được xác thực như sv1@vaa.edu.vn hay gv1@vaa.edu.vn thì nó sẽ gửi mã opt về 2 đích đó là mail chính chủ của tôi (2431540140@vaa.edu.vn) và mail đã bấm quên mật khẩu theo chuẩn mô hình mvc sử dụng 