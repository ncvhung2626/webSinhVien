const { Client } = require('pg');
const client = new Client({
  user: process.env.DB_USER || 'postgres',
  host: process.env.DB_HOST || 'localhost',
  database: process.env.DB_NAME || 'quan_li_sv',
  password: process.env.DB_PASS || 'Ncvhung@2626',
  port: process.env.DB_PORT || 5432
});

async function run() {
  await client.connect();
  
  await client.query(`
    CREATE TABLE IF NOT EXISTS giao_dich_thanh_toan (
      id SERIAL PRIMARY KEY,
      sinh_vien_id INT REFERENCES sinh_vien(id) ON DELETE SET NULL,
      ma_giao_dich VARCHAR(100) UNIQUE NOT NULL,
      ma_giao_dich_vnpay VARCHAR(100),
      so_tien BIGINT NOT NULL,
      noi_dung TEXT,
      trang_thai VARCHAR(20) DEFAULT 'cho_thanh_toan',
      ma_phan_hoi VARCHAR(10),
      ma_ngan_hang VARCHAR(20),
      thoi_gian_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      thoi_gian_cap_nhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
  `);
  
  await client.query(`
    CREATE TABLE IF NOT EXISTS chi_tiet_thanh_toan (
      id SERIAL PRIMARY KEY,
      giao_dich_id INT REFERENCES giao_dich_thanh_toan(id) ON DELETE CASCADE,
      dang_ky_hoc_id INT REFERENCES dang_ky_hoc(id) ON DELETE SET NULL,
      lop_hoc_phan_id INT REFERENCES lop_hoc_phan(id) ON DELETE SET NULL,
      so_tin_chi INT,
      don_gia_tin_chi INT DEFAULT 450000,
      thanh_tien BIGINT
    );
  `);
  
  await client.query(`
    CREATE TABLE IF NOT EXISTS password_reset_otps (
      id          SERIAL PRIMARY KEY,
      user_id     INT NOT NULL REFERENCES nguoi_dung(id) ON DELETE CASCADE,
      otp_code    VARCHAR(6) NOT NULL,
      expires_at  TIMESTAMP NOT NULL,
      is_verified BOOLEAN DEFAULT FALSE,
      created_at  TIMESTAMP DEFAULT NOW()
    );
  `);
  
  console.log('Tables created (including password_reset_otps)');
  process.exit(0);
}

run().catch(console.error);
