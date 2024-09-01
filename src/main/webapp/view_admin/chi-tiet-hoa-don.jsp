<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Food Order</title>
    <!-- Favicon -->
    <link href="/temp_off/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/temp_off/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/temp_off/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/temp_off/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/temp_off/css/style.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .imageTrangThai {
            /*width: 40px;*/
        }

        .iconMargin {
            margin: auto;
        }

        .imageTrangThai {
            background: lawngreen;
            width: 120px;
            height: 110px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 30px;
        }

        .bi-arrow-right {
            font-size: 55px;
        }
    </style>
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!--  Header  -->
    <%@ include file="header.jsp" %>
    <div class="content">
        <!--  Navbar  -->
        <%@ include file="nav.jsp" %>

        <!--    Main    -->

        <div class="row">
            <div class="card">
                <div class="card-header">
                    <h4>Xác nhận món ăn</h4>
                </div>
                <div class="card-body" style="margin-top: 60px; margin-bottom: 60px">
                    <div style="display: flex; justify-content: center; align-items: center">
                        <div class="iconMargin">
                            <div>
                                <div id="xac-nhan" class="">
                                    <img class="imageTrangThai" src="/images/alert.png">
                                </div>
                                <h5 class="text-center">Xác nhận</h5>
                            </div>
                        </div>

                        <div class="iconMargin" id="dang-chuan-bi-icon">
                            <div>
                                <div style="margin-bottom: 50px">
                                    <i class="bi bi-arrow-right"></i>
                                </div>
                            </div>
                        </div>

                        <div class="iconMargin" id="dang-chuan-bi">
                            <div>
                                <div>
                                    <img class="imageTrangThai" src="/images/cooking.png">
                                </div>
                                <h5 class="text-center">Đang chuẩn bị</h5>
                            </div>
                        </div>

                        <div class="iconMargin" id="hoan-thanh-icon">
                            <div>
                                <div style="margin-bottom: 50px">
                                    <i class="bi bi-arrow-right"></i>
                                </div>
                            </div>
                        </div>

                        <div class="iconMargin" id="hoan-thanh">
                            <div>
                                <div>
                                    <img class="imageTrangThai" src="/images/check-mark.png">
                                </div>
                                <h5 class="text-center">Hoàn thành</h5>
                            </div>
                        </div>

                        <div class="iconMargin" id="da-thanh-toan-icon">
                            <div>
                                <div style="margin-bottom: 50px">
                                    <i class="bi bi-arrow-right"></i>
                                </div>
                            </div>
                        </div>

                        <div class="iconMargin" id="da-thanh-toan">
                            <div>
                                <div>
                                    <img class="imageTrangThai" src="/images/money.png">
                                </div>
                                <h5 class="text-center">Đã thanh toán</h5>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="card-header">
                    <button id="btn-xac-nhan" class="btn btn-primary">Xác nhận</button>
                    <button id="btn-huy" class="btn btn-danger">Hủy</button>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="card">
                <div class="card-header" style="position: relative">
                    <h4 id="cacMonDaGoi">Các món đã gọi</h4>
                    <button id="btn-thanh-toan" class="btn btn-primary" style="position: absolute; right: 13px; top: 7px" data-bs-toggle="modal" data-bs-target="#modalThanhToan">
                        Thanh Toán
                    </button>
                </div>
                <div class="card-body">
                    <table class="table mt-2">
                        <thead>
                        <tr>
                            <th scope="col">Hình ảnh</th>
                            <th scope="col">Tên món ăn</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Giá tiền</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody id="tblHoaDonChiTiet">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--    Main    -->

        <%--        <%@ include file="footer.jsp" %>--%>
    </div>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!--    Modal thanh toán    -->
<div class="modal fade" id="modalThanhToan" tabindex="-1" aria-labelledby="exampleThanhToan" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleThanhToan">Thanh toán</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="thanh-toan">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <h6 id="maHoaDon"></h6>
                        </div>
                        <div class="col-12 col-md-6">
                            <h6>Tổng thanh toán: <span id="tongTien"></span></h6>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="mb-3">
                            <label for="tienKhachDua" class="form-label">Nhâp tiền khách đưa: </label>
                            <input type="number" class="form-control" id="tienKhachDua" min="1" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-warning">Thanh toán</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    //Thanh toán
    document.getElementById("thanh-toan").addEventListener("submit", function (e){
        e.preventDefault();
        var tongTien = document.getElementById("tongTien").textContent.replace(/\D/g, '');
        var tienKhachDua = document.getElementById("tienKhachDua").value.trim();
        var url = window.location.href;
        var idHoaDon = url.substring(url.lastIndexOf('/') + 1);


        console.log(tongTien);
        console.log(tienKhachDua);

        if (!tienKhachDua){
            Toast.fire({
                icon: "error",
                title: "Hãy nhập tiền khách đưa!"
            });
            return;
        }
        if (tienKhachDua < tongTien){
            Toast.fire({
                icon: "error",
                title: "Chưa trả đủ tiền!"
            });
            return;
        }
        const data = {
            id: idHoaDon,
            tongTien: tongTien,
        };

        const requestOptions = {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        };

        fetch('/api/food/thanh-toan', requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                Toast.fire({
                    icon: "success",
                    title: "Thanh toán thành công."
                });
                loadTrangThaiTheoIdHoaDon();
                loadDanhSachMonAnDaGoi();
                document.getElementById('btn-thanh-toan').disabled = true;
                setTimeout(() => {
                    var myModal = bootstrap.Modal.getInstance(document.getElementById('modalThanhToan'));
                    myModal.hide();
                }, 800);
                setTimeout(() => {
                    location.href = '/admin/quan-ly-hoa-don';
                }, 2000);
            })
            .catch(error => {
                console.error
                ('Error:', error);
            });
    })
</script>

<script>
    //update trạng thái hóa đơn
    document.getElementById('btn-xac-nhan').addEventListener('click', function(e) {
        var url = window.location.href;
        var idHoaDon = url.substring(url.lastIndexOf('/') + 1);
            Swal.fire({
                title: 'Xác nhận món ăn?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Đồng ý!',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    fetch(`/api/food/cap-nhat-trang-thai/` + idHoaDon, {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                    })
                        .then(response => response.json())
                        .then(hoaDon => {
                            Toast.fire({
                                icon: "success",
                                title: "Xác nhận thành công."
                            });
                            loadTrangThaiTheoIdHoaDon();
                            loadDanhSachMonAnDaGoi();
                        })
                        .catch(error => console.error('Error:', error));
                }
            });
    });
</script>

<script>
    //Load trạng thái hóa đơn theo id hóa đơn
    function loadTrangThaiTheoIdHoaDon() {
        var url = window.location.href;
        var idHoaDon = url.substring(url.lastIndexOf('/') + 1);
        fetch(`/api/food/find-hoa-don-by-id/` + idHoaDon, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(hoaDon => {
                document.getElementById('maHoaDon').textContent = 'Mã hóa đơn: '+hoaDon.ma;
                if (hoaDon.trangThai == 0){
                    document.getElementById('dang-chuan-bi').style.display = 'none';
                    document.getElementById('dang-chuan-bi-icon').style.display = 'none';
                    document.getElementById('hoan-thanh').style.display = 'none';
                    document.getElementById('hoan-thanh-icon').style.display = 'none';
                    document.getElementById('da-thanh-toan').style.display = 'none';
                    document.getElementById('da-thanh-toan-icon').style.display = 'none';

                    document.getElementById('btn-thanh-toan').disabled = true;
                }else if (hoaDon.trangThai == 1){
                    document.getElementById('dang-chuan-bi').style.display = 'block';
                    document.getElementById('dang-chuan-bi-icon').style.display = 'block';
                    document.getElementById('hoan-thanh').style.display = 'none';
                    document.getElementById('hoan-thanh-icon').style.display = 'none';
                    document.getElementById('da-thanh-toan').style.display = 'none';
                    document.getElementById('da-thanh-toan-icon').style.display = 'none';

                    document.getElementById('btn-huy').disabled = true;
                    document.getElementById('btn-thanh-toan').disabled = true;
                }else  if (hoaDon.trangThai == 2){
                    document.getElementById('dang-chuan-bi').style.display = 'block';
                    document.getElementById('dang-chuan-bi-icon').style.display = 'block';
                    document.getElementById('hoan-thanh').style.display = 'block';
                    document.getElementById('hoan-thanh-icon').style.display = 'block';
                    document.getElementById('da-thanh-toan').style.display = 'none';
                    document.getElementById('da-thanh-toan-icon').style.display = 'none';

                    document.getElementById('btn-thanh-toan').disabled = false;
                    document.getElementById('btn-xac-nhan').disabled = true;
                    document.getElementById('btn-huy').disabled = true;
                }else {
                    document.getElementById('dang-chuan-bi').style.display = 'block';
                    document.getElementById('dang-chuan-bi-icon').style.display = 'block';
                    document.getElementById('hoan-thanh').style.display = 'block';
                    document.getElementById('hoan-thanh-icon').style.display = 'block';
                    document.getElementById('da-thanh-toan').style.display = 'block';
                    document.getElementById('da-thanh-toan-icon').style.display = 'block';

                    document.getElementById('btn-xac-nhan').disabled = true;
                    document.getElementById('btn-thanh-toan').disabled = true;
                    document.getElementById('btn-huy').disabled = true;
                }

            })
            .catch(error => console.error('Error:', error));
    }
    loadTrangThaiTheoIdHoaDon();
</script>

<script>
    //Load danh sách món ăn theo hóa đơn
    function loadDanhSachMonAnDaGoi() {
        var idBan = localStorage.getItem('idBan');
        console.log(idBan)
        var url = window.location.href;
        var idHoaDon = url.substring(url.lastIndexOf('/') + 1);
        console.log("idHD: " + idHoaDon)
        let html = '';
        fetch('/api/food/get-mon-an-da-goi/' + idHoaDon, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(resp => {
                if (resp.length === 0) {
                    document.getElementById('thanhToan').style.display = 'none';
                    document.getElementById('cacMonDaGoi').textContent = 'Chưa có món ăn nào';
                }
                var newTongTien=0;
                resp.forEach(hdct => {
                    const hinhAnh = hdct.idMonAn.hinhAnh || 'N/A';
                    const tenMon = hdct.idMonAn.tenMon || 'N/A';
                    const soLuong = hdct.soLuong || 'N/A';
                    const giaTien = hdct.giaTien || 'N/A';
                    const tongTien = soLuong * giaTien;
                    var trangThai = '';
                    if (hdct.trangThai === 0){
                        trangThai = '<span class="badge bg-warning text-dark">Chưa hoàn thành</span>';
                    }else if (hdct.trangThai === 1){
                        trangThai = '<span class="badge bg-info text-light">Đã hoàn thành</span>';
                    }else {
                        trangThai = '<span class="badge bg-success text-light">Đã thanh toán</span>';
                    }

                    newTongTien += tongTien;

                    html +=
                        '<tr>' +
                        '<td>' +
                        '<img src="' + "/images/" + hinhAnh + '" ' +
                        'alt="Image" ' +
                        'style="width: 120px; height: 100px" ' +
                        'class="img-fluid rounded border" />' +
                        '</td>' +
                        '<td>' + tenMon + '</td>' +
                        '<td>' + soLuong + '</td>' +
                        '<td>' +
                        new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(giaTien) +
                        '</td>' +
                        '<td>' +
                        new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(tongTien) +
                        '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '</tr>';
                });
                document.getElementById("tblHoaDonChiTiet").innerHTML = html;
                document.getElementById('tongTien').textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(newTongTien);
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhSachMonAnDaGoi();
</script>

<script>
    const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.onmouseenter = Swal.stopTimer;
            toast.onmouseleave = Swal.resumeTimer;
        }
    });
    document.getElementById("hoTenLogin").textContent = localStorage.getItem("hoTen");
    document.getElementById("chucVuLogin").textContent = localStorage.getItem("chucVu");
    document.getElementById("hoTenDangNhap").textContent = localStorage.getItem("hoTen");
</script>

<script>
    document.getElementById('dang-xuat').addEventListener('click', function (e) {
        Swal.fire({
            title: "Bạn có chắc chắn muốn đăng xuất không?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Hủy",
            confirmButtonText: "Đồng ý"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Thành công!",
                    text: "Đăng xuất thành công",
                    icon: "success"
                }).then(() => {
                    localStorage.setItem('idNhanVien', '');
                    location.href = '/admin/dang-nhap-view';
                });
            }
        });
    });
</script>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/temp_off/lib/chart/chart.min.js"></script>
<script src="/temp_off/lib/easing/easing.min.js"></script>
<script src="/temp_off/lib/waypoints/waypoints.min.js"></script>
<script src="/temp_off/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/temp_off/lib/tempusdominus/js/moment.min.js"></script>
<script src="/temp_off/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="/temp_off/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="/temp_off/js/main.js"></script>
<script src="/js/main.js"></script>
</body>
</html>