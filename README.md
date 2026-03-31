# QLSV (Quan Ly Sinh Vien)

Monorepo gồm:
- `qlsv-fixed`: Backend NestJS (EduPortal) + PostgreSQL
- `webquanlisv/backend`: Backend NestJS (Admin) + PostgreSQL
- `webquanlisv/fontend`: Frontend Admin (static HTML/JS)

## Requirements

- Node.js + npm
- PostgreSQL

## Cấu hình môi trường

### 1) `qlsv-fixed`

Tạo file `.env` theo mẫu `qlsv-fixed/.env.example`.

Các biến chính:
- `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASS`, `DB_NAME`
- `JWT_SECRET`

### 2) `webquanlisv/backend`

Tạo file `.env` theo mẫu `webquanlisv/backend/.env.example`.

## Chạy local

Cài dependencies ở root:

```bash
cd QLSV
npm install
```

Chạy từng service:

```bash
# EduPortal backend (qlsv-fixed)
npm run start:qlsv

# Admin backend
npm run start:admin
```

Chạy cả 2 cùng lúc:

```bash
npm run dev
```

## Frontend Admin

Mở các file trong `webquanlisv/fontend/` (ví dụ `login.html`).

Mặc định frontend gọi API local `http://localhost:3001`.
Khi deploy, chỉnh `webquanlisv/fontend/js/config.js` hoặc set runtime:

```js
localStorage.setItem('API_BASE_URL', 'https://your-backend-url');
```

## Deploy Vercel (frontend)

Deploy thư mục `webquanlisv/fontend` như static site.
File `vercel.json` đã có rewrite `/` → `login.html`.

