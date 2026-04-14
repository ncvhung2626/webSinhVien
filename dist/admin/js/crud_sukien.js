// ============================================================
        //  BIẾN TOÀN CỤC
        // ============================================================
        const API_URL = '/api/admin/';
        const GIOI_HAN = 10;
        let tuKhoaHienTai = '';
        let trangHienTai = 1;
        let danhSachHienTai = [];
        let idSuKienDangSua = null;

        // Biến cho modal sinh viên
        let suKienDangXem = null;
        let trangThaiLocHienTai = '';

        // ============================================================
        //  ĐĂNG XUẤT
        // ============================================================
        $('#btnDangXuat').click(function () {
            localStorage.removeItem('admin_da_dang_nhap');
            window.location.href = 'login.html';
        });

        // ============================================================
        //  TẢI DANH SÁCH SỰ KIỆN
        // ============================================================
        function taiDanhSachSuKien(page) {
            trangHienTai = page;
            $('#bangSuKien').html(`<tr><td colspan="7" class="text-center text-primary">
        <i class="fas fa-spinner fa-spin"></i> Đang tải dữ liệu...</td></tr>`);

            fetch(`${API_URL}/su-kien?page=${page}&limit=${GIOI_HAN}&search=${encodeURIComponent(tuKhoaHienTai)}`)
                .then(res => res.json())
                .then(data => {
                    if (!data.thanh_cong) {
                        $('#bangSuKien').html(`<tr><td colspan="7" class="text-center text-danger">
                    <i class="fas fa-exclamation-circle mr-1"></i> ${data.thong_bao}</td></tr>`);
                        return;
                    }

                    danhSachHienTai = data.du_lieu;

                    // Cập nhật thẻ thống kê
                    $('#tongSuKien').text(data.tong_so || 0);
                    $('#tongDangKy').text(data.tong_dang_ky || 0);
                    $('#suKienSapToi').text(data.sap_toi || 0);

                    if (data.du_lieu.length === 0) {
                        $('#bangSuKien').html(`<tr><td colspan="7" class="text-center text-muted">
                    <i class="fas fa-inbox mr-1"></i> Chưa có sự kiện nào</td></tr>`);
                        $('#phanTrang').html('');
                        return;
                    }

                    let html = '';
                    data.du_lieu.forEach(sk => {
                        const ngay = sk.ngay_to_chuc
                            ? new Date(sk.ngay_to_chuc).toLocaleDateString('vi-VN')
                            : '—';
                        const diemCong = sk.diem_cong
                            ? `<span class="badge badge-success badge-diem">+${sk.diem_cong} điểm</span>`
                            : `<span class="text-muted">—</span>`;
                        const soDangKy = sk.so_dang_ky || 0;

                        html += `
                    <tr>
                        <td class="text-center">${sk.id}</td>
                        <td>
                            <a href="#" class="font-weight-bold text-primary"
                               onclick="xemDanhSachSinhVien(${sk.id}); return false;">
                                <i class="fas fa-calendar-check mr-1"></i>${sk.ten_su_kien}
                            </a>
                            ${sk.mo_ta ? `<br><small class="text-muted">${sk.mo_ta.substring(0, 60)}${sk.mo_ta.length > 60 ? '...' : ''}</small>` : ''}
                        </td>
                        <td><i class="fas fa-calendar mr-1 text-muted"></i>${ngay}</td>
                        <td><i class="fas fa-map-marker-alt mr-1 text-muted"></i>${sk.dia_diem || '—'}</td>
                        <td class="text-center">${diemCong}</td>
                        <td class="text-center">
                            <a href="#" onclick="xemDanhSachSinhVien(${sk.id}); return false;"
                               class="badge badge-primary" style="font-size:12px; cursor:pointer;">
                                <i class="fas fa-users mr-1"></i>${soDangKy} SV
                            </a>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-info btn-sm mr-1" title="Xem danh sách SV"
                                onclick="xemDanhSachSinhVien(${sk.id})">
                                <i class="fas fa-users"></i>
                            </button>
                            <button class="btn btn-warning btn-sm mr-1" title="Sửa"
                                onclick="suaSuKien(${sk.id})">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn btn-danger btn-sm" title="Xóa"
                                onclick="xoaSuKien(${sk.id})">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>`;
                    });

                    $('#bangSuKien').html(html);
                    vePhanTrang(data.tong_so_trang, trangHienTai);
                })
                .catch(() => {
                    $('#bangSuKien').html(`<tr><td colspan="7" class="text-center text-danger">
                <i class="fas fa-exclamation-triangle mr-1"></i> Lỗi kết nối Backend!</td></tr>`);
                });
        }

        // ============================================================
        //  PHÂN TRANG
        // ============================================================
        function vePhanTrang(tongSoTrang, trangHT) {
            if (!tongSoTrang || tongSoTrang <= 1) { $('#phanTrang').html(''); return; }
            let html = '';
            for (let i = 1; i <= tongSoTrang; i++) {
                html += `<li class="page-item ${i === trangHT ? 'active' : ''}">
            <a class="page-link" href="#" onclick="taiDanhSachSuKien(${i}); return false;">${i}</a>
        </li>`;
            }
            $('#phanTrang').html(html);
        }

        // ============================================================
        //  MỞ FORM THÊM MỚI
        // ============================================================
        function moFormThemMoi() {
            idSuKienDangSua = null;
            $('#nhapTenSuKien, #nhapDiaDiem, #nhapMoTa').val('');
            $('#nhapDiemCong').val('');
            $('#nhapNgayToChuc').val('');
            $('#tieuDeModalSK').html('<i class="fas fa-calendar-plus mr-2"></i>Tạo Sự kiện mới');
            $('#btnLuuText').text('Lưu Sự kiện');
        }

        // ============================================================
        //  SỬA SỰ KIỆN
        // ============================================================
        function suaSuKien(id) {
            const sk = danhSachHienTai.find(item => item.id === id);
            if (!sk) return;

            idSuKienDangSua = id;
            $('#nhapTenSuKien').val(sk.ten_su_kien);
            $('#nhapDiemCong').val(sk.diem_cong || '');
            $('#nhapNgayToChuc').val(sk.ngay_to_chuc ? sk.ngay_to_chuc.substring(0, 10) : '');
            $('#nhapDiaDiem').val(sk.dia_diem || '');
            $('#nhapMoTa').val(sk.mo_ta || '');
            $('#tieuDeModalSK').html('<i class="fas fa-edit mr-2"></i>Sửa Sự kiện');
            $('#btnLuuText').text('Cập nhật');
            $('#modalSuKien').modal('show');
        }

        // ============================================================
        //  XÓA SỰ KIỆN
        // ============================================================
        function xoaSuKien(id) {
            const sk = danhSachHienTai.find(item => item.id === id);
            const ten = sk ? sk.ten_su_kien : '';
            if (!confirm(`Bạn có chắc muốn xóa sự kiện:\n"${ten}"?\n\nTất cả dữ liệu đăng ký liên quan cũng sẽ bị xóa!`)) return;

            fetch(`${API_URL}/su-kien/${id}`, { method: 'DELETE' })
                .then(res => res.json())
                .then(data => {
                    if (data.thanh_cong) {
                        alert('Đã xóa sự kiện thành công!');
                        taiDanhSachSuKien(1);
                    } else {
                        alert('Lỗi: ' + data.thong_bao);
                    }
                })
                .catch(() => alert('Lỗi kết nối Server!'));
        }

        // ============================================================
        //  XEM DANH SÁCH SINH VIÊN ĐĂNG KÝ
        // ============================================================
        function xemDanhSachSinhVien(suKienId) {
            suKienDangXem = suKienId;
            trangThaiLocHienTai = '';

            // Reset filter buttons
            $('.btn-loc').removeClass('active btn-primary btn-success btn-warning btn-danger')
                .addClass('btn-outline-secondary');
            $('.btn-loc[data-trang-thai=""]')
                .removeClass('btn-outline-secondary').addClass('active btn-primary');

            // Tìm thông tin sự kiện từ danh sách hiện tại
            const sk = danhSachHienTai.find(item => item.id === suKienId);
            if (sk) {
                $('#tenSuKienHienThi').text(sk.ten_su_kien);
                const ngay = sk.ngay_to_chuc
                    ? new Date(sk.ngay_to_chuc).toLocaleDateString('vi-VN')
                    : '';
                $('#chiTietSuKienHienThi').text(
                    [ngay, sk.dia_diem, sk.diem_cong ? `+${sk.diem_cong} điểm rèn luyện` : '']
                        .filter(Boolean).join(' · ')
                );
            }

            $('#bangSinhVienDangKy').html(`<tr><td colspan="7" class="text-center text-primary">
        <i class="fas fa-spinner fa-spin"></i> Đang tải...</td></tr>`);
            $('#modalDanhSachSV').modal('show');

            taiDanhSachSinhVienDangKy(suKienId, '');
        }

        function taiDanhSachSinhVienDangKy(suKienId, trangThai) {
            $('#bangSinhVienDangKy').html(`<tr><td colspan="7" class="text-center text-primary">
        <i class="fas fa-spinner fa-spin"></i> Đang tải...</td></tr>`);

            const query = trangThai ? `?trang_thai=${encodeURIComponent(trangThai)}` : '';

            fetch(`${API_URL}/su-kien/${suKienId}/dang-ky${query}`)
                .then(res => res.json())
                .then(data => {
                    if (!data.thanh_cong) {
                        $('#bangSinhVienDangKy').html(`<tr><td colspan="7" class="text-center text-danger">${data.thong_bao}</td></tr>`);
                        return;
                    }

                    // Cập nhật thống kê
                    $('#tkTong').text(data.thong_ke.tong || 0);
                    $('#tkXacNhan').text(data.thong_ke.xac_nhan || 0);
                    $('#tkChoXet').text(data.thong_ke.cho_xet || 0);
                    $('#tkHuy').text(data.thong_ke.huy || 0);
                    $('#ghiChuModal').text(`Hiển thị ${data.du_lieu.length} sinh viên`);

                    if (data.du_lieu.length === 0) {
                        $('#bangSinhVienDangKy').html(`<tr><td colspan="7" class="text-center text-muted">
                    <i class="fas fa-inbox mr-1"></i> Không có sinh viên nào${trangThai ? ' với trạng thái này' : ''}</td></tr>`);
                        return;
                    }

                    let html = '';
                    data.du_lieu.forEach((dk, i) => {
                        const thoiGian = dk.thoi_gian_dang_ky
                            ? new Date(dk.thoi_gian_dang_ky).toLocaleString('vi-VN')
                            : '—';

                        let badgeClass = 'trang-thai-default';
                        let labelTT = dk.trang_thai || '—';
                        const tt = (dk.trang_thai || '').toLowerCase();
                        if (tt === 'xac_nhan' || tt === 'xác nhận') { badgeClass = 'trang-thai-xacnhan'; labelTT = 'Đã xác nhận'; }
                        else if (tt === 'cho_xet' || tt === 'chờ xét') { badgeClass = 'trang-thai-choxet'; labelTT = 'Chờ xét'; }
                        else if (tt === 'huy' || tt === 'hủy') { badgeClass = 'trang-thai-huy'; labelTT = 'Đã hủy'; }

                        html += `
                    <tr>
                        <td class="text-center">${i + 1}</td>
                        <td><b>${dk.mssv || '—'}</b></td>
                        <td>${dk.ho_ten || '—'}</td>
                        <td>${dk.lop || '—'}</td>
                        <td><small>${thoiGian}</small></td>
                        <td class="text-center">
                            <span class="trang-thai-dangky ${badgeClass}">${labelTT}</span>
                        </td>
                        <td class="text-center">
                            <div class="btn-group btn-group-sm">
                                <button class="btn btn-success btn-sm" title="Xác nhận"
                                    onclick="capNhatTrangThai(${dk.dang_ky_id}, 'xac_nhan', ${suKienDangXem})">
                                    <i class="fas fa-check"></i>
                                </button>
                                <button class="btn btn-danger btn-sm" title="Hủy"
                                    onclick="capNhatTrangThai(${dk.dang_ky_id}, 'huy', ${suKienDangXem})">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </td>
                    </tr>`;
                    });

                    $('#bangSinhVienDangKy').html(html);
                })
                .catch(() => {
                    $('#bangSinhVienDangKy').html(`<tr><td colspan="7" class="text-center text-danger">
                Lỗi kết nối Backend!</td></tr>`);
                });
        }

        // ============================================================
        //  CẬP NHẬT TRẠNG THÁI ĐĂNG KÝ
        // ============================================================
        function capNhatTrangThai(dangKyId, trangThai, suKienId) {
            const label = trangThai === 'xac_nhan' ? 'xác nhận' : 'hủy';
            if (!confirm(`Bạn có chắc muốn ${label} đăng ký này?`)) return;

            fetch(`${API_URL}/dang-ky-su-kien/${dangKyId}/trang-thai`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ trang_thai: trangThai })
            })
                .then(res => res.json())
                .then(data => {
                    if (data.thanh_cong) {
                        taiDanhSachSinhVienDangKy(suKienId, trangThaiLocHienTai);
                    } else {
                        alert('Lỗi: ' + data.thong_bao);
                    }
                })
                .catch(() => alert('Lỗi kết nối Server!'));
        }

        // ============================================================
        //  KHỞI TẠO
        // ============================================================
        $(document).ready(function () {
            taiDanhSachSuKien(1);

            // Tìm kiếm
            $('#btnTimKiem').click(function () {
                tuKhoaHienTai = $('#oTimKiem').val().trim();
                taiDanhSachSuKien(1);
            });
            $('#oTimKiem').keypress(function (e) {
                if (e.keyCode === 13) $('#btnTimKiem').click();
            });
            $('#btnXoaTK').click(function () {
                $('#oTimKiem').val('');
                tuKhoaHienTai = '';
                taiDanhSachSuKien(1);
            });

            // Lưu / cập nhật sự kiện
            $('#btnLuuSuKien').click(function () {
                const tenSuKien = $('#nhapTenSuKien').val().trim();
                const ngayToChuc = $('#nhapNgayToChuc').val();
                const diaDiem = $('#nhapDiaDiem').val().trim();
                const diemCong = $('#nhapDiemCong').val();
                const moTa = $('#nhapMoTa').val().trim();

                if (!tenSuKien || !ngayToChuc) {
                    alert('Vui lòng nhập đầy đủ Tên sự kiện và Ngày tổ chức!');
                    return;
                }

                $('#btnLuuSuKien').prop('disabled', true);
                $('#btnLuuText').text('Đang xử lý...');

                const url = idSuKienDangSua
                    ? `${API_URL}/su-kien/${idSuKienDangSua}`
                    : `${API_URL}/su-kien`;
                const method = idSuKienDangSua ? 'PUT' : 'POST';

                fetch(url, {
                    method,
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        ten_su_kien: tenSuKien,
                        ngay_to_chuc: ngayToChuc,
                        dia_diem: diaDiem,
                        diem_cong: diemCong ? parseInt(diemCong) : null,
                        mo_ta: moTa
                    })
                })
                    .then(res => res.json())
                    .then(data => {
                        $('#btnLuuSuKien').prop('disabled', false);
                        $('#btnLuuText').text(idSuKienDangSua ? 'Cập nhật' : 'Lưu Sự kiện');

                        if (data.thanh_cong) {
                            alert(idSuKienDangSua ? 'Đã cập nhật sự kiện thành công!' : 'Đã tạo sự kiện thành công!');
                            $('#modalSuKien').modal('hide');
                            taiDanhSachSuKien(1);
                        } else {
                            alert('Lỗi: ' + data.thong_bao);
                        }
                    })
                    .catch(() => {
                        $('#btnLuuSuKien').prop('disabled', false);
                        $('#btnLuuText').text(idSuKienDangSua ? 'Cập nhật' : 'Lưu Sự kiện');
                        alert('Lỗi kết nối Server!');
                    });
            });

            // Bộ lọc trạng thái trong modal sinh viên
            $(document).on('click', '.btn-loc', function () {
                trangThaiLocHienTai = $(this).data('trang-thai');
                $('.btn-loc').removeClass('active btn-primary btn-success btn-warning btn-danger')
                    .addClass('btn-outline-secondary');
                $(this).removeClass('btn-outline-secondary');

                // Gán màu đúng cho từng nút
                const tt = trangThaiLocHienTai;
                if (tt === '') $(this).addClass('active btn-primary');
                else if (tt === 'xac_nhan') $(this).addClass('active btn-success');
                else if (tt === 'cho_xet') $(this).addClass('active btn-warning');
                else if (tt === 'huy') $(this).addClass('active btn-danger');

                taiDanhSachSinhVienDangKy(suKienDangXem, trangThaiLocHienTai);
            });
        });