// XỬ LÝ SỰ KIỆN ĐĂNG XUẤT
        document.getElementById('btnDangXuat').addEventListener('click', function (e) {
            e.preventDefault();
            localStorage.removeItem('admin_da_dang_nhap');
            window.location.href = 'login.html';
        });

        // -----------------------------------------
        // LOGIC QUẢN LÝ GIẢNG VIÊN
        // -----------------------------------------
        let danhSachHienTai = [];
        
        const API_URL = window.API_BASE_URL || 'http://localhost:3001';

        $(document).ready(function () {
            taiDanhSachGiangVien(1);

            $('#inputTimKiem').keypress(function (e) {
                if (e.which == 13) taiDanhSachGiangVien(1);
            });

            $('#btnTimKiem').click(function () {
                taiDanhSachGiangVien(1);
            });

            $('#btnLuuGiangVien').click(function () {
                const hoTen = $('#nhapHoTen').val().trim();
                const boMon = $('#nhapBoMon').val().trim();
                const email = $('#nhapEmail').val().trim();
                const matKhau = $('#nhapMatKhau').val().trim();

                if (!hoTen || !email || !matKhau) {
                    alert("Vui lòng nhập đủ các thông tin bắt buộc (*)");
                    return;
                }

                $('#btnLuuGiangVien').text('Đang lưu...').prop('disabled', true);

                let urlApi = `${API_URL}/giang-vien`;
                let phuongThuc = 'POST';

                if (idGiangVienDangSua !== null) {
                    urlApi = `${API_URL}/giang-vien/${idGiangVienDangSua}`;
                    phuongThuc = 'PUT';
                }

                fetch(urlApi, {
                    method: phuongThuc,
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ ho_ten: hoTen, bo_mon: boMon, email: email, mat_khau: matKhau })
                })
                    .then(response => response.json())
                    .then(data => {
                        $('#btnLuuGiangVien').text(idGiangVienDangSua ? 'Cập Nhật' : 'Lưu Thông Tin').prop('disabled', false);

                        if (data.thanh_cong) {
                            alert(idGiangVienDangSua ? "Đã cập nhật thành công!" : "Đã thêm thành công!");
                            $('#modalGiangVien').modal('hide');
                            taiDanhSachGiangVien(1);
                        } else {
                            alert("Lỗi: " + data.thong_bao);
                        }
                    })
                    .catch(error => {
                        $('#btnLuuGiangVien').text(idGiangVienDangSua ? 'Cập Nhật' : 'Lưu Thông Tin').prop('disabled', false);
                        alert("Lỗi kết nối đến Backend!");
                    });
            });
        });

        function taiDanhSachGiangVien(page) {
            const tuKhoa = $('#inputTimKiem').val().trim();
            $('#bangGiangVien').html(`<tr><td colspan="6" class="text-center text-primary"><i class="fas fa-spinner fa-spin"></i> Đang tải dữ liệu...</td></tr>`);

            fetch(`${API_URL}/giang-vien?page=${page}&limit=10&search=${encodeURIComponent(tuKhoa)}`)
                .then(response => response.json())
                .then(data => {
                    if (data.thanh_cong) {
                        danhSachHienTai = data.du_lieu;
                        let htmlBang = '';

                        if (danhSachHienTai.length === 0) {
                            htmlBang = `<tr><td colspan="6" class="text-center">Không tìm thấy giảng viên nào!</td></tr>`;
                        }

                        danhSachHienTai.forEach(gv => {
                            htmlBang += `
                                <tr>
                                    <td>${gv.id}</td>
                                    <td><b>${gv.ho_ten}</b></td>
                                    <td>${gv.bo_mon || 'N/A'}</td>
                                    <td>${gv.email}</td>
                                    <td><span class="text-muted">••••••••</span></td>
                                    <td class="text-center">
                                        <button class="btn btn-warning btn-sm" onclick="suaGiangVien(${gv.id})"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm" onclick="xoaGiangVien(${gv.id})"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            `;
                        });
                        $('#bangGiangVien').html(htmlBang);
                        vePhanTrang(data.tong_so_trang, data.trang_hien_tai);
                    } else {
                        $('#bangGiangVien').html(`<tr><td colspan="6" class="text-center text-danger">Lỗi Backend: ${data.thong_bao}</td></tr>`);
                    }
                })
                .catch(error => {
                    $('#bangGiangVien').html(`<tr><td colspan="6" class="text-center text-danger">Lỗi kết nối Backend!</td></tr>`);
                });
        }

        function vePhanTrang(tongSoTrang, trangHienTai) {
            let htmlPhanTrang = '';
            for (let i = 1; i <= tongSoTrang; i++) {
                let activeClass = (i === trangHienTai) ? 'active' : '';
                htmlPhanTrang += `
                    <li class="page-item ${activeClass}">
                        <a class="page-link" href="#" onclick="taiDanhSachGiangVien(${i}); return false;">${i}</a>
                    </li>`;
            }
            $('#phanTrang').html(htmlPhanTrang);
        }

        function moHopThoaiThem() {
            idGiangVienDangSua = null;
            $('#formGiangVien')[0].reset();
            $('#tieuDeModal').text('Thêm Giảng Viên Mới');
            $('#btnLuuGiangVien').text('Lưu Thông Tin');
            $('#modalGiangVien').modal('show');
        }

        function suaGiangVien(id) {
            const gv = danhSachHienTai.find(item => item.id === id);
            if (!gv) return;

            idGiangVienDangSua = id;

            $('#nhapHoTen').val(gv.ho_ten);
            $('#nhapBoMon').val(gv.bo_mon);
            $('#nhapEmail').val(gv.email);
            $('#nhapMatKhau').val(''); // Không hiển thị hash

            $('#tieuDeModal').text('Sửa Thông Tin Giảng Viên');
            $('#btnLuuGiangVien').text('Cập Nhật');
            $('#modalGiangVien').modal('show');
        }

        function xoaGiangVien(id) {
            if (confirm("⚠️ Cảnh báo: Việc này sẽ xóa hồ sơ và TÀI KHOẢN đăng nhập của giảng viên này. Bạn có chắc chắn muốn xóa không?")) {
                fetch(`${API_URL}/giang-vien/${id}`, {
                    method: 'DELETE'
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.thanh_cong) {
                            alert("Đã xóa thành công!");
                            taiDanhSachGiangVien(1);
                        } else {
                            alert("Lỗi xóa: " + data.thong_bao);
                        }
                    })
                    .catch(error => alert("Lỗi kết nối đến Backend!"));
            }
        }