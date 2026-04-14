let danhSachHienTai = [];
        let idLopDangSua = null;

        $(document).ready(function () {
            taiDuLieuDropdown();
            taiDanhSachLop(1);

            $('#inputTimKiem').keypress(function (e) {
                if (e.which == 13) taiDanhSachLop(1);
            });

            $('#btnTimKiem').click(function () {
                taiDanhSachLop(1);
            });

            $('#btnLuuLop').click(function () {
                const hocPhanId = $('#nhapHocPhanId').val().trim();
                const giangVienId = $('#nhapGiangVienId').val().trim();
                const hocKy = $('#nhapHocKy').val().trim();

                if (!hocPhanId || !giangVienId || !hocKy) {
                    alert("Vui lòng nhập đầy đủ các trường bắt buộc!");
                    return;
                }

                $('#btnLuuLop').text('Đang lưu...').prop('disabled', true);

                let urlApi = '/api/admin/lop-hoc-phan';
                let phuongThuc = 'POST';

                if (idLopDangSua !== null) {
                    urlApi = `/api/admin/lop-hoc-phan/${idLopDangSua}`;
                    phuongThuc = 'PUT';
                }

                fetch(urlApi, {
                    method: phuongThuc,
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        hoc_phan_id: hocPhanId,
                        giang_vien_id: giangVienId,
                        hoc_ky: hocKy
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        $('#btnLuuLop').text(idLopDangSua ? 'Cập Nhật' : 'Lưu Thông Tin').prop('disabled', false);

                        if (data.thanh_cong) {
                            alert(idLopDangSua ? "Đã cập nhật thành công!" : "Đã thêm thành công!");
                            $('#modalLopHocPhan').modal('hide');
                            taiDanhSachLop(1);
                        } else {
                            alert("Lỗi: " + data.thong_bao);
                        }
                    })
                    .catch(error => {
                        $('#btnLuuLop').text(idLopDangSua ? 'Cập Nhật' : 'Lưu Thông Tin').prop('disabled', false);
                        alert("Lỗi kết nối đến Backend!");
                    });
            });
        });

        function taiDanhSachLop(page) {
            const tuKhoa = $('#inputTimKiem').val().trim();
            $('#bangLopHocPhan').html(`<tr><td colspan="6" class="text-center text-primary"><i class="fas fa-spinner fa-spin"></i> Đang tải dữ liệu...</td></tr>`);

            fetch(`/api/admin/lop-hoc-phan?page=${page}&limit=10&search=${encodeURIComponent(tuKhoa)}`)
                .then(response => response.json())
                .then(data => {
                    if (data.thanh_cong) {
                        danhSachHienTai = data.du_lieu;
                        let htmlBang = '';

                        if (danhSachHienTai.length === 0) {
                            htmlBang = `<tr><td colspan="5" class="text-center">Không tìm thấy Lớp học phần nào!</td></tr>`;
                        }

                        danhSachHienTai.forEach(lop => {
                            htmlBang += `
                                <tr>
                                    <td>${lop.id}</td>
                                    <td><b class="text-primary">${lop.ten_hoc_phan || 'N/A'}</b></td>
                                    <td class="text-center">${lop.so_tin_chi || '-'}</td>
                                    <td>${lop.ho_ten || 'N/A'}</td>
                                    <td class="text-center">${lop.hoc_ky}</td>
                                    <td class="text-center">
                                        <button class="btn btn-warning btn-sm" onclick="suaLop(${lop.id})"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm" onclick="xoaLop(${lop.id})"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            `;
                        });
                        $('#bangLopHocPhan').html(htmlBang);
                        vePhanTrang(data.tong_so_trang, data.trang_hien_tai);
                    } else {
                        $('#bangLopHocPhan').html(`<tr><td colspan="5" class="text-center text-danger">Lỗi Backend: ${data.thong_bao}</td></tr>`);
                    }
                })
                .catch(error => {
                    $('#bangLopHocPhan').html(`<tr><td colspan="5" class="text-center text-danger">Lỗi kết nối Backend!</td></tr>`);
                });
        }

        function vePhanTrang(tongSoTrang, trangHienTai) {
            let htmlPhanTrang = '';
            for (let i = 1; i <= tongSoTrang; i++) {
                let activeClass = (i === trangHienTai) ? 'active' : '';
                htmlPhanTrang += `<li class="page-item ${activeClass}"><a class="page-link" href="#" onclick="taiDanhSachLop(${i}); return false;">${i}</a></li>`;
            }
            $('#phanTrang').html(htmlPhanTrang);
        }

        function moHopThoaiThem() {
            idLopDangSua = null;
            $('#formLopHocPhan')[0].reset();
            $('#tieuDeModal').text('Thêm Lớp Học Phần Mới');
            $('#btnLuuLop').text('Lưu Thông Tin');
            $('#modalLopHocPhan').modal('show');
        }

        function suaLop(id) {
            const lop = danhSachHienTai.find(item => item.id === id);
            if (!lop) return;

            idLopDangSua = id;
            $('#nhapHocPhanId').val(lop.hoc_phan_id);
            $('#nhapGiangVienId').val(lop.giang_vien_id);
            $('#nhapHocKy').val(lop.hoc_ky);

            $('#tieuDeModal').text('Sửa Thông Tin Lớp Học Phần');
            $('#btnLuuLop').text('Cập Nhật');
            $('#modalLopHocPhan').modal('show');
        }

        function xoaLop(id) {
            if (confirm("⚠️ Cảnh báo: Việc này sẽ xóa lớp học phần. Bạn có chắc chắn muốn xóa không?")) {
                fetch(`/api/admin/lop-hoc-phan/${id}`, { method: 'DELETE' })
                    .then(response => response.json())
                    .then(data => {
                        if (data.thanh_cong) {
                            alert("Đã xóa thành công!");
                            taiDanhSachLop(1);
                        } else {
                            alert("Lỗi xóa: " + data.thong_bao);
                        }
                    })
                    .catch(error => alert("Lỗi kết nối đến Backend!"));
            }
        }
        // Hàm gọi API lấy danh sách nhét vào thẻ <select>
        function taiDuLieuDropdown() {
            fetch('/api/admin/danh-sach-chon')
                .then(response => response.json())
                .then(data => {
                    if (data.thanh_cong) {
                        // Tạo các option cho Học Phần
                        let htmlHocPhan = '<option value="">-- Chọn Học Phần --</option>';
                        data.hocPhan.forEach(hp => {
                            htmlHocPhan += `<option value="${hp.id}">${hp.ten_hoc_phan}</option>`;
                        });
                        $('#nhapHocPhanId').html(htmlHocPhan);

                        // Tạo các option cho Giảng Viên
                        let htmlGiangVien = '<option value="">-- Chọn Giảng Viên --</option>';
                        data.giangVien.forEach(gv => {
                            htmlGiangVien += `<option value="${gv.id}">${gv.ho_ten}</option>`;
                        });
                        $('#nhapGiangVienId').html(htmlGiangVien);
                    }
                })
                .catch(error => console.error("Lỗi tải dropdown:", error));
        }