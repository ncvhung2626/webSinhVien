// Nếu không có thẻ đánh dấu đăng nhập, redirect về login
if (localStorage.getItem('admin_da_dang_nhap') !== 'true') {
    window.location.href = 'login.html';
}
