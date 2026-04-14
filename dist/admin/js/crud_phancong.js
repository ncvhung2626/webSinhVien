// ====================================================
        //  BIẾN TOÀN CỤC
        // ====================================================
        const API_URL = '/api/admin/';
        const GIOI_HAN = 10;

        let tuKhoaHienTai = '';
        let danhSachHienTai = [];
        let idPhanCongDangSua = null;
        let danhSachGiangVien = [];
        let danhSachLopHocPhan = [];

        // ====================================================
        //  ĐĂNG XUẤT
        // ====================================================
        $('#btnDangXuat').click(function () {
            localStorage.removeItem('admin_da_dang_nhap');
            window.location.href = 'login.html';
        });

        // ====================================================
        //  TẢI DANH SÁCH PHÂN CÔNG (GET)
        // ====================================================
        function taiDanhSachPhanCong(page) {
            $('#bangPhanCong').html(`
                <tr><td colspan="7" class="text-center text-primary">
                    <i class="fas fa-spinner fa-spin"></i> Đang tải dữ liệu...
                </td></tr>
            `);

            fetch(`${API_URL}/phan-cong-giang-day?page=${page}&limit=${GIOI_HAN}&search=${encodeURIComponent(tuKhoaHienTai)}`)
                .then(res => res.json())
                .then(data => {
                    if (!data.thanh_cong) {
                        $('#bangPhanCong').html(`<tr><td colspan="7" class="text-center text-danger"><i class="fas fa-exclamation-circle mr-1"></i> Lỗi: ${data.thong_bao}</td></tr>`);
                        return;
                    }

                    danhSachHienTai = data.du_lieu;

                    // Cập nhật thẻ thống kê
                    $('#soPhanCong').text(data.tong_so || 0);
                    $('#soGiangVienPhanCong').text(data.so_giang_vien || '--');
                    $('#soLopDaPhanCong').text(data.so_lop || '--');

                    if (data.du_lieu.length === 0) {
                        $('#bangPhanCong').html(`<tr><td colspan="7" class="text-center text-muted"><i class="fas fa-inbox mr-1"></i> Chưa có dữ liệu phân công nào</td></tr>`);
                        $('#phanTrang').html('');
                        return;
                    }

                    let html = '';
                    data.du_lieu.forEach(pc => {
                        html += `
                            <tr>
                                <td class="text-center">${pc.id}</td>
                                <td>
                                    <i class="fas fa-user-tie text-success mr-1"></i>
                                    <b>${pc.ten_giang_vien}</b>
                                </td>
                                <td><span class="badge badge-light border">${pc.bo_mon || '—'}</span></td>
                                <td>
                                    <i class="fas fa-book text-info mr-1"></i>
                                    ${pc.ten_hoc_phan}
                                </td>
                                <td class="text-center">
                                    <span class="badge badge-primary">${pc.so_tin_chi} TC</span>
                                </td>
                                <td>${pc.hoc_ky || '—'}</td>
                                <td class="text-center">
                                    <button class="btn btn-warning btn-sm mr-1" onclick="suaPhanCong(${pc.id})" title="Sửa">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-danger btn-sm" onclick="xoaPhanCong(${pc.id})" title="Xóa">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        `;
                    });

                    $('#bangPhanCong').html(html);
                    vePhanTrang(data.tong_so_trang, data.trang_hien_tai);
                })
                .catch(() => {
                    $('#bangPhanCong').html(`<tr><td colspan="7" class="text-center text-danger"><i class="fas fa-exclamation-triangle mr-1"></i> Lỗi kết nối Backend (Cổng 3000)!</td></tr>`);
                });
        }

        // ====================================================
        //  VẼ PHÂN TRANG
        // ====================================================
        function vePhanTrang(tongSoTrang, trangHienTai) {
            if (tongSoTrang <= 1) { $('#phanTrang').html(''); return; }
            let html = '';
            for (let i = 1; i <= tongSoTrang; i++) {
                html += `
                    <li class="page-item ${i === trangHienTai ? 'active' : ''}">
                        <a class="page-link" href="#" onclick="taiDanhSachPhanCong(${i}); return false;">${i}</a>
                    </li>`;
            }
            $('#phanTrang').html(html);
        }

        // ====================================================
        //  TẢI DROPDOWN: GIẢNG VIÊN + LỚP HỌC PHẦN
        // ====================================================
        function taiDanhSachDropdown() {
            fetch(`${API_URL}/danh-sach-chon-phancong`)
                .then(res => res.json())
                .then(data => {
                    if (!data.thanh_cong) return;

                    danhSachGiangVien = data.giangVien;
                    danhSachLopHocPhan = data.lopHocPhan;

                    // Điền vào select Giảng viên
                    let optGV = '<option value="">-- Chọn Giảng viên --</option>';
                    data.giangVien.forEach(gv => {
                        optGV += `<option value="${gv.id}" data-bomon="${gv.bo_mon}">${gv.ho_ten} (${gv.bo_mon})</option>`;
                    });
                    $('#chonGiangVien').html(optGV);

                    // Điền vào select Lớp học phần
                    let optLHP = '<option value="">-- Chọn Lớp học phần --</option>';
                    data.lopHocPhan.forEach(lhp => {
                        optLHP += `<option value="${lhp.id}" data-hocphan="${lhp.ten_hoc_phan}" data-tinchi="${lhp.so_tin_chi}" data-hocky="${lhp.hoc_ky}">${lhp.ten_hoc_phan} — HK${lhp.hoc_ky}</option>`;
                    });
                    $('#chonLopHocPhan').html(optLHP);
                });
        }

        // ====================================================
        //  XEM TRƯỚC PHÂN CÔNG KHI CHỌN DROPDOWN
        // ====================================================
        $('#chonGiangVien').on('change', function () {
            const opt = $(this).find('option:selected');
            if (opt.val()) {
                $('#tenGiangVienHienThi').text(opt.text());
                $('#boMonHienThi').text(opt.data('bomon') || '--');
                $('#thongTinGiangVien').removeClass('d-none');
            } else {
                $('#thongTinGiangVien').addClass('d-none');
            }
            capNhatXemTruoc();
        });

        $('#chonLopHocPhan').on('change', function () {
            const opt = $(this).find('option:selected');
            if (opt.val()) {
                $('#tenHocPhanHienThi').text(opt.data('hocphan'));
                $('#tinChiHienThi').text(opt.data('tinchi'));
                $('#hocKyHienThi').text(opt.data('hocky'));
                $('#thongTinLopHocPhan').removeClass('d-none');
            } else {
                $('#thongTinLopHocPhan').addClass('d-none');
            }
            capNhatXemTruoc();
        });

        function capNhatXemTruoc() {
            const gv = $('#chonGiangVien').find('option:selected');
            const lhp = $('#chonLopHocPhan').find('option:selected');
            if (gv.val() && lhp.val()) {
                $('#xemTruocGV').text(gv.text());
                $('#xemTruocLHP').text(lhp.data('hocphan') + ' (HK' + lhp.data('hocky') + ')');
                $('#xemTruocPhanCong').removeClass('d-none');
            } else {
                $('#xemTruocPhanCong').addClass('d-none');
            }
        }

        // ====================================================
        //  MỞ FORM THÊM MỚI
        // ====================================================
        function moFormThemMoi() {
            idPhanCongDangSua = null;
            $('#chonGiangVien').val('');
            $('#chonLopHocPhan').val('');
            $('#thongTinGiangVien').addClass('d-none');
            $('#thongTinLopHocPhan').addClass('d-none');
            $('#xemTruocPhanCong').addClass('d-none');
            $('#tieuDeModal').html('<i class="fas fa-tasks mr-2"></i>Thêm Phân công Giảng dạy mới');
            $('#btnLuuText').text('Lưu Phân công');
        }

        // ====================================================
        //  MỞ FORM SỬA
        // ====================================================
        function suaPhanCong(id) {
            const pc = danhSachHienTai.find(item => item.id === id);
            if (!pc) return;

            idPhanCongDangSua = id;

            // Set giá trị dropdown
            $('#chonGiangVien').val(pc.giang_vien_id).trigger('change');
            $('#chonLopHocPhan').val(pc.lop_hoc_phan_id).trigger('change');

            $('#tieuDeModal').html('<i class="fas fa-edit mr-2"></i>Sửa Phân công Giảng dạy');
            $('#btnLuuText').text('Cập nhật');
            $('#modalPhanCong').modal('show');
        }

        // ====================================================
        //  XÓA PHÂN CÔNG (DELETE)
        // ====================================================
        function xoaPhanCong(id) {
            const pc = danhSachHienTai.find(item => item.id === id);
            const tenGV = pc ? pc.ten_giang_vien : '';
            const tenHP = pc ? pc.ten_hoc_phan : '';

            if (!confirm(`Bạn có chắc muốn xóa phân công:\n"${tenGV}" dạy "${tenHP}"?\n\nHành động này không thể hoàn tác!`)) return;

            fetch(`${API_URL}/phan-cong-giang-day/${id}`, { method: 'DELETE' })
                .then(res => res.json())
                .then(data => {
                    if (data.thanh_cong) {
                        alert('Đã xóa phân công thành công!');
                        taiDanhSachPhanCong(1);
                    } else {
                        alert('Lỗi: ' + data.thong_bao);
                    }
                })
                .catch(() => alert('Lỗi kết nối đến Server!'));
        }

        // ====================================================
        //  KHỞI TẠO KHI TRANG TẢI XONG
        // ====================================================
        $(document).ready(function () {
            taiDanhSachPhanCong(1);
            taiDanhSachDropdown();

            // TÌM KIẾM
            $('#btnTimKiem').click(function () {
                tuKhoaHienTai = $('#oTimKiem').val().trim();
                taiDanhSachPhanCong(1);
            });
            $('#oTimKiem').keypress(function (e) {
                if (e.keyCode === 13) $('#btnTimKiem').click();
            });
            $('#btnXoaTimKiem').click(function () {
                $('#oTimKiem').val('');
                tuKhoaHienTai = '';
                taiDanhSachPhanCong(1);
            });

            // LƯU / CẬP NHẬT PHÂN CÔNG
            $('#btnLuuPhanCong').click(function () {
                const giangVienId = $('#chonGiangVien').val();
                const lopHocPhanId = $('#chonLopHocPhan').val();

                if (!giangVienId || !lopHocPhanId) {
                    alert('Vui lòng chọn đầy đủ Giảng viên và Lớp học phần!');
                    return;
                }

                $('#btnLuuPhanCong').prop('disabled', true);
                $('#btnLuuText').text('Đang xử lý...');

                const url = idPhanCongDangSua
                    ? `${API_URL}/phan-cong-giang-day/${idPhanCongDangSua}`
                    : `${API_URL}/phan-cong-giang-day`;
                const method = idPhanCongDangSua ? 'PUT' : 'POST';

                fetch(url, {
                    method: method,
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        giang_vien_id: parseInt(giangVienId),
                        lop_hoc_phan_id: parseInt(lopHocPhanId)
                    })
                })
                    .then(res => res.json())
                    .then(data => {
                        $('#btnLuuPhanCong').prop('disabled', false);
                        $('#btnLuuText').text(idPhanCongDangSua ? 'Cập nhật' : 'Lưu Phân công');

                        if (data.thanh_cong) {
                            alert(idPhanCongDangSua ? 'Đã cập nhật phân công thành công!' : 'Đã thêm phân công thành công!');
                            $('#modalPhanCong').modal('hide');
                            taiDanhSachPhanCong(1);
                        } else {
                            alert('Lỗi: ' + data.thong_bao);
                        }
                    })
                    .catch(() => {
                        $('#btnLuuPhanCong').prop('disabled', false);
                        $('#btnLuuText').text(idPhanCongDangSua ? 'Cập nhật' : 'Lưu Phân công');
                        alert('Lỗi kết nối đến Server!');
                    });
            });
        });