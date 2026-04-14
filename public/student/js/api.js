/**
 * api.js - File API dùng chung cho toàn bộ frontend
 * Hệ thống Quản lý Sinh viên
 */

const API_BASE = 'http://localhost:3000/api';

// ===== AUTH =====
function getToken() {
  return localStorage.getItem('token');
}

function getVaiTro() {
  return localStorage.getItem('vaiTro');
}

function getHoTen() {
  return localStorage.getItem('hoTen');
}

function getProfileId() {
  return parseInt(localStorage.getItem('profileId'));
}

function dangXuat() {
  localStorage.clear();
  window.location.href = '../login.html';
}

function kiemTraDangNhap(vaiTroYeuCau = null) {
  const token = getToken();
  if (!token) {
    window.location.href = '../login.html';
    return false;
  }
  if (vaiTroYeuCau && getVaiTro() !== vaiTroYeuCau) {
    window.location.href = '../login.html';
    return false;
  }
  return true;
}

// Alias cho tương thích
function checkAuth(vaiTroYeuCau = null) {
  return kiemTraDangNhap(vaiTroYeuCau);
}

// ===== API FETCH HELPER =====
async function apiFetch(path, options = {}) {
  try {
    const res = await fetch(`${API_BASE}${path}`, {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${getToken()}`
      },
      ...options
    });

    if (res.status === 401) {
      dangXuat();
      return null;
    }

    return await res.json();
  } catch (e) {
    console.error('API Error:', e);
    showToast('Lỗi kết nối máy chủ', 'error');
    return null;
  }
}

// ===== TOAST NOTIFICATION =====
function showToast(msg, type = 'success') {
  let wrap = document.getElementById('toastWrap');
  if (!wrap) {
    wrap = document.createElement('div');
    wrap.id = 'toastWrap';
    wrap.style.cssText = 'position:fixed;top:20px;right:20px;z-index:9999;display:flex;flex-direction:column;gap:8px;';
    document.body.appendChild(wrap);
  }

  const icons = { success: 'check-circle', error: 'times-circle', warning: 'exclamation-circle' };
  const colors = { success: '#1e8449', error: '#c0392b', warning: '#e8a020' };

  const el = document.createElement('div');
  el.style.cssText = `padding:14px 20px;border-radius:12px;font-size:14px;font-weight:600;color:white;background:${colors[type]};box-shadow:0 8px 24px rgba(0,0,0,0.15);animation:slideInRight 0.3s ease;display:flex;align-items:center;gap:8px;`;
  el.innerHTML = `<i class="fas fa-${icons[type]}"></i> ${msg}`;
  wrap.appendChild(el);
  setTimeout(() => el.remove(), 3000);
}

// ===== FORMAT HELPERS =====
function formatDate(d) {
  if (!d) return '--';
  return new Date(d).toLocaleDateString('vi-VN');
}

function formatDateTime(d) {
  if (!d) return '--';
  return new Date(d).toLocaleString('vi-VN');
}

function formatTrangThaiDiemDanh(tt) {
  return tt === 'co_mat'
    ? '<span class="badge-status badge-active">Có mặt</span>'
    : '<span class="badge-status badge-inactive">Vắng</span>';
}

// ===== AUTH API =====
async function apiLogin(email, matKhau) {
  const res = await fetch(`${API_BASE}/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, mat_khau: matKhau })
  });
  return { ok: res.ok, data: await res.json() };
}

async function apiGetMe() {
  return await apiFetch('/auth/me');
}

// ===== SINH VIÊN API =====
async function apiGetThongTinSinhVien() {
  return await apiFetch('/sinh-vien/ca-nhan');
}

async function apiGetDanhSachSinhVienTheoLop(lopId) {
  return await apiFetch(`/sinh-vien/lop/${lopId}`);
}

async function apiGetTatCaSinhVien() {
  return await apiFetch('/sinh-vien/tat-ca');
}

// ===== GIẢNG VIÊN API =====
async function apiGetThongTinGiangVien() {
  return await apiFetch('/giang-vien/ca-nhan');
}

async function apiGetTatCaGiangVien() {
  return await apiFetch('/giang-vien/tat-ca');
}

// ===== LỚP HỌC PHẦN API =====
async function apiGetLopCuaGiangVien() {
  return await apiFetch('/lop-hoc-phan/giang-vien');
}

async function apiGetLopCuaSinhVien() {
  return await apiFetch('/lop-hoc-phan/sinh-vien');
}

async function apiGetChiTietLop(lopId) {
  return await apiFetch(`/lop-hoc-phan/${lopId}/chi-tiet`);
}

async function apiGetThongKeBuoiHoc(lopId) {
  return await apiFetch(`/lop-hoc-phan/${lopId}/thong-ke`);
}

async function apiTaoBuoiHoc(lopId, ngayHoc, trangThai = 'hoc') {
  return await apiFetch(`/lop-hoc-phan/${lopId}/buoi-hoc`, {
    method: 'POST',
    body: JSON.stringify({ ngay_hoc: ngayHoc, trang_thai: trangThai })
  });
}

async function apiTaoPhienDiemDanh(buoiHocId, thoiGianPhut = 15) {
  return await apiFetch(`/lop-hoc-phan/buoi-hoc/${buoiHocId}/phien-diem-danh`, {
    method: 'POST',
    body: JSON.stringify({ thoi_gian_phut: thoiGianPhut })
  });
}

async function apiGetPhienHienTai(buoiHocId) {
  return await apiFetch(`/lop-hoc-phan/buoi-hoc/${buoiHocId}/phien-hien-tai`);
}

async function apiGetDiemHocPhan(lopId) {
  return await apiFetch(`/lop-hoc-phan/${lopId}/diem-hoc-phan`);
}

async function apiGetDiemCaNhanSinhVien() {
  return await apiFetch('/lop-hoc-phan/diem-ca-nhan/sinh-vien');
}

// ===== ĐIỂM DANH API =====
async function apiDiemDanhQR(maQR) {
  return await apiFetch('/diem-danh/qr', {
    method: 'POST',
    body: JSON.stringify({ ma_qr: maQR })
  });
}

async function apiGetDiemDanhBuoi(buoiId) {
  return await apiFetch(`/diem-danh/buoi/${buoiId}`);
}

async function apiGetThongKeVang(lopId) {
  return await apiFetch(`/diem-danh/thong-ke-vang/${lopId}`);
}

async function apiGetLichSuVang() {
  return await apiFetch('/diem-danh/lich-su-vang');
}

async function apiGhiVang(buoiHocId, sinhVienId) {
  return await apiFetch('/diem-danh/ghi-vang', {
    method: 'POST',
    body: JSON.stringify({ buoi_hoc_id: buoiHocId, sinh_vien_id: sinhVienId })
  });
}

// ===== BÀI TẬP API =====
async function apiTaoBaiTap(data) {
  return await apiFetch('/bai-tap', {
    method: 'POST',
    body: JSON.stringify(data)
  });
}

async function apiGetBaiTapTheoLop(lopId) {
  return await apiFetch(`/bai-tap/lop/${lopId}`);
}

async function apiGetBaiTapSinhVien(lopId) {
  return await apiFetch(`/bai-tap/sinh-vien/${lopId}`);
}

async function apiNopBai(baiTapId) {
  return await apiFetch(`/bai-tap/${baiTapId}/nop`, { method: 'POST' });
}

async function apiGetDanhSachNopBai(baiTapId) {
  return await apiFetch(`/bai-tap/${baiTapId}/danh-sach-nop`);
}

// ===== ĐIỂM RÈN LUYỆN API =====
async function apiGetDiemRenLuyenCaNhan() {
  return await apiFetch('/diem-ren-luyen/ca-nhan');
}

async function apiGetDiemRenLuyenTheoLop(lopId) {
  return await apiFetch(`/diem-ren-luyen/theo-lop/${lopId}`);
}

async function apiGetTatCaDiemRenLuyen() {
  return await apiFetch('/diem-ren-luyen/tat-ca');
}

// ===== PHIẾU YÊU CẦU API =====
async function apiTaoPhieuYeuCau(loaiYeuCau, noiDung) {
  return await apiFetch('/phieu-yeu-cau', {
    method: 'POST',
    body: JSON.stringify({ loai_yeu_cau: loaiYeuCau, noi_dung: noiDung })
  });
}

async function apiGetPhieuYeuCauCuaToi() {
  return await apiFetch('/phieu-yeu-cau/cua-toi');
}

async function apiGetTatCaPhieuYeuCau() {
  return await apiFetch('/phieu-yeu-cau/tat-ca');
}

async function apiCapNhatTrangThaiPhieu(id, trangThai) {
  return await apiFetch(`/phieu-yeu-cau/${id}/trang-thai`, {
    method: 'PUT',
    body: JSON.stringify({ trang_thai: trangThai })
  });
}
