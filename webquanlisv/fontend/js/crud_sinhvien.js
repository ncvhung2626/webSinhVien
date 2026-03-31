// XỬ LÝ SỰ KIỆN ĐĂNG XUẤT
        document.getElementById('btnDangXuat').addEventListener('click', function (e) {
            e.preventDefault();
            localStorage.removeItem('admin_da_dang_nhap');
            window.location.href = 'login.html';
        });

        const gioiHanDuLieu = 10;
        let tuKhoaHienTai = '';
        let danhSachHienTai = [];
        
        const API_URL = window.API_BASE_URL || 'http://localhost:3001';

        // Hàm gọi API lấy danh sách
        function taiDanhSachSinhVien(page) {
            $('#bangSinhVien').html('<tr><td colspan="6" class="text-center text-primary"><i class="fas fa-spinner fa-spin"></i> Đang tải dữ liệu...</td></tr>');

            fetch(`${API_URL}/sinh-vien?page=${page}&limit=${gioiHanDuLieu}&search=${encodeURIComponent(tuKhoaHienTai)}`)
                .then(response => response.json())
                .then(data => {
                    if (data.thanh_cong) {
                        danhSachHienTai = data.du_lieu;
                        let htmlBang = '';

                        data.du_lieu.forEach(sv => {
                            htmlBang += `
                                <tr>
                                    <td>${sv.id}</td>
                                    <td><b>${sv.mssv}</b></td>
                                    <td>${sv.ho_ten}</td>
                                    <td>${sv.lop}</td>
                                    <td>${sv.email}</td>
                                    <td><span class="text-muted">••••••••</span></td>
                                    <td class="text-center">
                                        <button class="btn btn-warning btn-sm" onclick="suaSinhVien(${sv.id})"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm" onclick="xoaSinhVien(${sv.id})"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            `;
                        });
                        $('#bangSinhVien').html(htmlBang);
                        vePhanTrang(data.tong_so_trang, data.trang_hien_tai);
                    } else {
                        $('#bangSinhVien').html(`<tr><td colspan="6" class="text-center text-danger">Lỗi Backend: ${data.thong_bao}</td></tr>`);
                    }
                })
                .catch(error => {
                    $('#bangSinhVien').html(`<tr><td colspan="6" class="text-center text-danger">Lỗi kết nối Backend!</td></tr>`);
                });
        }

        // Hàm vẽ thanh phân trang
        function vePhanTrang(tongSoTrang, trangHienTai) {
            let htmlPhanTrang = '';
            for (let i = 1; i <= tongSoTrang; i++) {
                let activeClass = (i === trangHienTai) ? 'active' : '';
                htmlPhanTrang += `
                    <li class="page-item ${activeClass}">
                        <a class="page-link" href="#" onclick="taiDanhSachSinhVien(${i}); return false;">${i}</a>
                    </li>`;
            }
            $('#phanTrang').html(htmlPhanTrang);
        }

        // HÀM XÓA SINH VIÊN
        function xoaSinhVien(id) {
            if (confirm("Bạn có chắc chắn muốn xóa sinh viên này không? Hành động này không thể hoàn tác!")) {
                fetch(`${API_URL}/sinh-vien/${id}`, {
                    method: 'DELETE'
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.thanh_cong) {
                            alert("Đã xóa thành công!");
                            taiDanhSachSinhVien(1);
                        } else {
                            alert("Lỗi: " + data.thong_bao);
                        }
                    })
                    .catch(error => {
                        alert("Lỗi kết nối đến Server!");
                    });
            }
        }

        // HÀM BẤM NÚT THÊM MỚI
        function moFormThemMoi() {
            idSinhVienDangSua = null;
            $('#formSinhVien')[0].reset();
            $('#tieuDeModal').text('Thêm Sinh Viên Mới');
            $('#btnLuuSinhVien').text('Lưu Thông Tin');
        }

        // HÀM BẤM NÚT SỬA 
        function suaSinhVien(id) {
            const sv = danhSachHienTai.find(item => item.id === id);
            if (!sv) return;

            idSinhVienDangSua = id;

            $('#nhapMssv').val(sv.mssv);
            $('#nhapHoTen').val(sv.ho_ten);
            $('#nhapLop').val(sv.lop);
            $('#nhapEmail').val(sv.email);
            $('#nhapMatKhau').val(''); // Để trống: không hiển thị hash
            $('#tieuDeModal').text('Sửa Thông Tin Sinh Viên');
            $('#btnLuuSinhVien').text('Cập Nhật');

            $('#modalSinhVien').modal('show');
        }

        $(document).ready(function () {
            taiDanhSachSinhVien(1);

            $('#btnTimKiem').click(function () {
                tuKhoaHienTai = $('#oTimKiem').val().trim();
                taiDanhSachSinhVien(1);
            });

            $('#oTimKiem').keypress(function (event) {
                if (event.keyCode === 13) {
                    $('#btnTimKiem').click();
                }
            });

            $('#btnLuuSinhVien').click(function () {
                const mssv = $('#nhapMssv').val().trim();
                const hoTen = $('#nhapHoTen').val().trim();
                const lop = $('#nhapLop').val().trim();
                const email = $('#nhapEmail').val().trim();
                const matKhau = $('#nhapMatKhau').val().trim();
                if (!mssv || !hoTen) {
                    alert("Vui lòng nhập đủ MSSV và Họ Tên!");
                    return;
                }

                $('#btnLuuSinhVien').text('Đang xử lý...').prop('disabled', true);

                let urlApi = `${API_URL}/sinh-vien`;
                let phuongThuc = 'POST';

                if (idSinhVienDangSua !== null) {
                    urlApi = `${API_URL}/sinh-vien/${idSinhVienDangSua}`;
                    phuongThuc = 'PUT';
                }

                fetch(urlApi, {
                    method: phuongThuc,
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ mssv: mssv, ho_ten: hoTen, lop: lop, email: email, mat_khau: matKhau })
                })
                    .then(response => response.json())
                    .then(data => {
                        $('#btnLuuSinhVien').text(idSinhVienDangSua ? 'Cập Nhật' : 'Lưu Thông Tin').prop('disabled', false);

                        if (data.thanh_cong) {
                            alert(idSinhVienDangSua ? "Đã cập nhật thành công!" : "Đã thêm thành công!");
                            $('#modalSinhVien').modal('hide');
                            taiDanhSachSinhVien(1);
                        } else {
                            alert("Lỗi: " + data.thong_bao);
                        }
                    })
                    .catch(error => {
                        $('#btnLuuSinhVien').text(idSinhVienDangSua ? 'Cập Nhật' : 'Lưu Thông Tin').prop('disabled', false);
                        alert("Lỗi kết nối đến Server!");
                    });
            });
            
            // XỬ LÝ IMPORT EXCEL
            let fileImportDaChon = null;

            // Khi click vào khu vực kéo thả để chọn file
            $('#khuVucKeoTha').click(function () {
                $('#fileExcel').click();
            });

            // Khi chọn file từ hộp thoại
            $('#fileExcel').change(function (e) {
                if (e.target.files.length > 0) {
                    fileImportDaChon = e.target.files[0];
                    hienThiTenFile(fileImportDaChon);
                }
            });

            // Các sự kiện kéo thả
            const khuVuc = document.getElementById('khuVucKeoTha');

            if (khuVuc) {
                khuVuc.addEventListener('dragover', (e) => {
                    e.preventDefault();
                    khuVuc.classList.add('bg-light');
                });

                khuVuc.addEventListener('dragleave', () => {
                    khuVuc.classList.remove('bg-light');
                });

                khuVuc.addEventListener('drop', (e) => {
                    e.preventDefault();
                    khuVuc.classList.remove('bg-light');
                    if (e.dataTransfer.files.length > 0) {
                        fileImportDaChon = e.dataTransfer.files[0];
                        hienThiTenFile(fileImportDaChon);
                    }
                });
            }

            function hienThiTenFile(file) {
                if (!file.name.endsWith('.xlsx')) {
                    alert("Chỉ hỗ trợ file định dạng .xlsx!");
                    fileImportDaChon = null;
                    $('#tenFileDaChon').hide().text('');
                    $('#fileExcel').val('');
                    return;
                }
                $('#tenFileDaChon').text(`Đã chọn: ${file.name}`).show();
            }

            // Gửi dữ liệu Import lên Server
            $('#btnUploadExcel').click(function () {
                if (!fileImportDaChon) {
                    alert('Vui lòng chọn file Excel để import!');
                    return;
                }

                $('#btnUploadExcel').html('<i class="fas fa-spinner fa-spin"></i> Đang xử lý...').prop('disabled', true);

                const formData = new FormData();
                formData.append('file', fileImportDaChon);

                fetch(`${API_URL}/sinh-vien/import`, {
                    method: 'POST',
                    body: formData
                })
                    .then(response => response.json())
                    .then(data => {
                        $('#btnUploadExcel').text('Import Dữ Liệu').prop('disabled', false);

                        if (data.thong_bao) {
                            alert(data.thong_bao.replace(/\\n/g, '\n'));
                        }

                        if (data.thanh_cong) {
                            fileImportDaChon = null;
                            $('#fileExcel').val('');
                            $('#tenFileDaChon').hide().text('');
                            $('#modalImportExcel').modal('hide');
                            taiDanhSachSinhVien(1);
                        }
                    })
                    .catch(error => {
                        $('#btnUploadExcel').text('Import Dữ Liệu').prop('disabled', false);
                        alert("Lỗi kết nối đến Server khi Import Excel!");
                    });
            });
        });