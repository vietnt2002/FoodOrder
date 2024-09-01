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
        .soLuongHD {
            position: absolute;
            top: -9px;
            right: 0px;
            background: red;
            color: white;
            font-weight: bold;
            width: 25px;
            border-radius: 50%;
            height: 22px;
            display: flex;
            justify-content: center;
            align-items: center;
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
        <h3 class="mt-3">Danh sách hóa đơn</h3>
        <audio id="tieng-chuong" src="/images/hieu-ung-am-thanh-dau-tich.com.mp3" preload="auto"></audio>
        <div class="row">

        </div>
        <div class="row mt-5">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="tat-ca-tab" data-bs-toggle="tab" data-bs-target="#tat-ca" type="button" role="tab" aria-controls="nav-home" aria-selected="true" style="position: relative">Tất cả <span class="soLuongHD" id="so-luong-tat-ca"></span></button>
                    <button class="nav-link" id="xac-nhan-tab" data-bs-toggle="tab" data-bs-target="#xac-nhan" type="button" role="tab" aria-controls="nav-profile" aria-selected="false" style="position: relative">Xác nhận món <span class="soLuongHD" id="so-luong-xac-nhan"></span></button>
                    <button class="nav-link" id="dang-chuan-bi-tab" data-bs-toggle="tab" data-bs-target="#dang-chuan-bi" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" style="position: relative">Đang chuẩn bị <span class="soLuongHD" id="so-luong-chuan-bi"></span></button>
                    <button class="nav-link" id="hoan-thanh-tab" data-bs-toggle="tab" data-bs-target="#hoan-thanh" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" style="position: relative">Hoàn thành <span class="soLuongHD" id="so-luong-hoan-thanh"></span></button>
                    <button class="nav-link" id="da-thanh-toan-tab" data-bs-toggle="tab" data-bs-target="#da-thanh-toan" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" style="position: relative">Đã thanh toán <span class="soLuongHD" id="so-luong-thanh-toan"></span></button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="tat-ca" role="tabpanel" aria-labelledby="tat-ca-tab">
                    <table class="table mt-5">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Mã hóa đơn</th>
                            <th scope="col">Nhân viên</th>
                            <th scope="col">Bàn</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody id="tblHoaDonTatCa">
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="xac-nhan" role="tabpanel" aria-labelledby="xac-nhan-tab">
                    <table class="table mt-5">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Mã hóa đơn</th>
                            <th scope="col">Nhân viên</th>
                            <th scope="col">Bàn</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody id="tblHoaDonXacNhan">
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="dang-chuan-bi" role="tabpanel" aria-labelledby="dang-chuan-bi-tab">
                    <table class="table mt-5">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Mã hóa đơn</th>
                            <th scope="col">Nhân viên</th>
                            <th scope="col">Bàn</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody id="tblHoaDonDangChuanBi">
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="hoan-thanh" role="tabpanel" aria-labelledby="hoan-thanh-tab"><table class="table mt-5">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã hóa đơn</th>
                        <th scope="col">Nhân viên</th>
                        <th scope="col">Bàn</th>
                        <th scope="col">Ngày tạo</th>
                        <th scope="col">Tổng tiền</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Thao tác</th>
                    </tr>
                    </thead>
                    <tbody id="tblHoaDonHoanThanh">
                    </tbody>
                </table></div>
                <div class="tab-pane fade" id="da-thanh-toan" role="tabpanel" aria-labelledby="da-thanh-toan-tab"><table class="table mt-5">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã hóa đơn</th>
                        <th scope="col">Nhân viên</th>
                        <th scope="col">Bàn</th>
                        <th scope="col">Ngày tạo</th>
                        <th scope="col">Tổng tiền</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Thao tác</th>
                    </tr>
                    </thead>
                    <tbody id="tblHoaDonDaThanhToan">
                    </tbody>
                </table></div>
            </div>
        </div>
        <!--    Main    -->

        <%--        <%@ include file="footer.jsp" %>--%>
    </div>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>


<script
        src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script>
    //Load hóa đơn tất cả
    var count = 1;
    function loadDanhSachHoaDonTatCa() {
        count++;
        console.log(count);
        let html = '';
        fetch("/api/food/get-all-hoa-don", {
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
                resp.forEach((hoaDon, i) => {
                    var maHoaDon = hoaDon.ma || 'N/A';
                    var tenNhanVien = hoaDon.idNhanVien.hoTen || 'N/A';
                    var tenBan = hoaDon.idBan.tenBan || 'N/A';
                    var ngayTao = hoaDon.ngayTao || 'N/A';
                    var tongTien = hoaDon.tongTien || '<span class="badge rounded-pill bg-warning text-dark">Chưa thanh toán</span>';
                    var trangThai = '';
                    if (hoaDon.trangThai === 0){
                        trangThai = '<span class="badge bg-warning text-light">Xác nhận món</span>';
                        var checkTiengChuong = localStorage.getItem('checkTiengChuong');
                        if (checkTiengChuong){
                            const tiengChuong = document.getElementById("tieng-chuong");
                            tiengChuong.play();
                            localStorage.setItem('checkTiengChuong', false);
                        }
                    } else if (hoaDon.trangThai === 1){
                        trangThai = '<span class="badge bg-primary text-light">Đang chuẩn bị</span>';
                    } else if (hoaDon.trangThai === 2){
                        trangThai = '<span class="badge bg-info text-light">Hoàn thành</span>';
                    } else if (hoaDon.trangThai === 3){
                        trangThai = '<span class="badge bg-success text-light">Đã thanh toán</span>';
                    }

                    html +=
                        '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' + maHoaDon + '</td>' +
                        '<td>' + tenNhanVien + '</td>' +
                        '<td>' +  'Bàn ' + tenBan + '</td>' +
                        '<td>' + ngayTao + '</td>' +
                        '<td>' +
                        new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(tongTien) +
                        '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<a href="/admin/chi-tiet-hoa-don/'+ hoaDon.id +'" class="btn btn-outline-info" style="width: 50px; height: 30px; display: flex; justify-content: center; align-items: center"><i class="bi bi-eye-fill"></i></a>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                document.getElementById("tblHoaDonTatCa").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhSachHoaDonTatCa();
    setInterval(loadDanhSachHoaDonTatCa, 2000);
</script>

<script>
    //Load hóa đơn đã thanh toán
    function loadDanhSachHoaDonDaThanhToan() {
        let html = '';
        fetch("/api/food/get-hoa-don-da-thanh-toan", {
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
                resp.forEach((hoaDon, i) => {
                    var maHoaDon = hoaDon.ma || 'N/A';
                    var tenNhanVien = hoaDon.idNhanVien.hoTen || 'N/A';
                    var tenBan = hoaDon.idBan.tenBan || 'N/A';
                    var ngayTao = hoaDon.ngayTao || 'N/A';
                    var tongTien = hoaDon.tongTien || '<span class="badge rounded-pill bg-warning text-dark">Chưa thanh toán</span>';
                    var trangThai = '';
                    if (hoaDon.trangThai === 0){
                        trangThai = '<span class="badge bg-warning text-light">Xác nhận món</span>';
                    } else if (hoaDon.trangThai === 1){
                        trangThai = '<span class="badge bg-primary text-light">Đang chuẩn bị</span>';
                    } else if (hoaDon.trangThai === 2){
                        trangThai = '<span class="badge bg-info text-light">Hoàn thành</span>';
                    } else if (hoaDon.trangThai === 3){
                        trangThai = '<span class="badge bg-success text-light">Đã thanh toán</span>';
                    }

                    html +=
                        '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' + maHoaDon + '</td>' +
                        '<td>' + tenNhanVien + '</td>' +
                        '<td>' + 'Bàn ' + tenBan + '</td>' +
                        '<td>' + ngayTao + '</td>' +
                        '<td>' +
                        new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(tongTien) +
                        '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<a href="/admin/chi-tiet-hoa-don/'+ hoaDon.id +'" class="btn btn-outline-info" style="width: 50px; height: 30px; display: flex; justify-content: center; align-items: center"><i class="bi bi-eye-fill"></i></a>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                document.getElementById("tblHoaDonDaThanhToan").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhSachHoaDonDaThanhToan();
</script>

<script>
    //Load hóa đơn hoàn thành
    function loadDanhSachHoaDonHoanThanh() {
        let html = '';
        fetch("/api/food/get-hoa-don-hoan-thanh-mon", {
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
                resp.forEach((hoaDon, i) => {
                    var maHoaDon = hoaDon.ma || 'N/A';
                    var tenNhanVien = hoaDon.idNhanVien.hoTen || 'N/A';
                    var tenBan = hoaDon.idBan.tenBan || 'N/A';
                    var ngayTao = hoaDon.ngayTao || 'N/A';
                    var tongTien = hoaDon.tongTien || '<span class="badge rounded-pill bg-warning text-dark">Chưa thanh toán</span>';
                    var trangThai = '';
                    if (hoaDon.trangThai === 0){
                        trangThai = '<span class="badge bg-warning text-light">Xác nhận món</span>';
                    } else if (hoaDon.trangThai === 1){
                        trangThai = '<span class="badge bg-primary text-light">Đang chuẩn bị</span>';
                    } else if (hoaDon.trangThai === 2){
                        trangThai = '<span class="badge bg-info text-light">Hoàn thành</span>';
                    } else if (hoaDon.trangThai === 3){
                        trangThai = '<span class="badge bg-success text-light">Đã thanh toán</span>';
                    }

                    html +=
                        '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' + maHoaDon + '</td>' +
                        '<td>' + tenNhanVien + '</td>' +
                        '<td>' + 'Bàn ' + tenBan + '</td>' +
                        '<td>' + ngayTao + '</td>' +
                        '<td>' +
                        new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(tongTien) +
                        '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<a href="/admin/chi-tiet-hoa-don/'+ hoaDon.id +'" class="btn btn-outline-info" style="width: 50px; height: 30px; display: flex; justify-content: center; align-items: center"><i class="bi bi-eye-fill"></i></a>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                document.getElementById("tblHoaDonHoanThanh").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhSachHoaDonHoanThanh();
</script>

<script>
    //Load hóa đơn đang chuẩn bị
    function loadDanhSachHoaDonDangChuanBi() {
        let html = '';
        fetch("/api/food/get-hoa-don-dang-chuan-bi", {
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
                resp.forEach((hoaDon, i) => {
                    var maHoaDon = hoaDon.ma || 'N/A';
                    var tenNhanVien = hoaDon.idNhanVien.hoTen || 'N/A';
                    var tenBan = hoaDon.idBan.tenBan || 'N/A';
                    var ngayTao = hoaDon.ngayTao || 'N/A';
                    var tongTien = hoaDon.tongTien || '<span class="badge rounded-pill bg-warning text-dark">Chưa thanh toán</span>';
                    var trangThai = '';
                    if (hoaDon.trangThai === 0){
                        trangThai = '<span class="badge bg-warning text-light">Xác nhận món</span>';
                    } else if (hoaDon.trangThai === 1){
                        trangThai = '<span class="badge bg-primary text-light">Đang chuẩn bị</span>';
                    } else if (hoaDon.trangThai === 2){
                        trangThai = '<span class="badge bg-info text-light">Hoàn thành</span>';
                    } else if (hoaDon.trangThai === 3){
                        trangThai = '<span class="badge bg-success text-light">Đã thanh toán</span>';
                    }

                    html +=
                        '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' + maHoaDon + '</td>' +
                        '<td>' + tenNhanVien + '</td>' +
                        '<td>' + 'Bàn ' + tenBan + '</td>' +
                        '<td>' + ngayTao + '</td>' +
                        '<td>' +
                        new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(tongTien) +
                        '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<a href="/admin/chi-tiet-hoa-don/'+ hoaDon.id +'" class="btn btn-outline-info" style="width: 50px; height: 30px; display: flex; justify-content: center; align-items: center"><i class="bi bi-eye-fill"></i></a>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                document.getElementById("tblHoaDonDangChuanBi").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhSachHoaDonDangChuanBi();
</script>

<script>
    //Load hóa đơn xác nhận
    function loadDanhSachHoaDonXacNhan() {
        let html = '';
        fetch("/api/food/get-hoa-don-xac-nhan", {
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
                resp.forEach((hoaDon, i) => {
                    var maHoaDon = hoaDon.ma || 'N/A';
                    var tenNhanVien = hoaDon.idNhanVien.hoTen || 'N/A';
                    var tenBan = hoaDon.idBan.tenBan || 'N/A';
                    var ngayTao = hoaDon.ngayTao || 'N/A';
                    var tongTien = hoaDon.tongTien || '<span class="badge rounded-pill bg-warning text-dark">Chưa thanh toán</span>';
                    var trangThai = '';
                    if (hoaDon.trangThai === 0){
                        trangThai = '<span class="badge bg-warning text-light">Xác nhận món</span>';
                    } else if (hoaDon.trangThai === 1){
                        trangThai = '<span class="badge bg-primary text-light">Đang chuẩn bị</span>';
                    } else if (hoaDon.trangThai === 2){
                        trangThai = '<span class="badge bg-info text-light">Hoàn thành</span>';
                    } else if (hoaDon.trangThai === 3){
                        trangThai = '<span class="badge bg-success text-light">Đã thanh toán</span>';
                    }

                    html +=
                        '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' + maHoaDon + '</td>' +
                        '<td>' + tenNhanVien + '</td>' +
                        '<td>' + tenBan + '</td>' +
                        '<td>' + ngayTao + '</td>' +
                        '<td>' +
                        new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(tongTien) +
                        '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<a href="/admin/chi-tiet-hoa-don/'+ hoaDon.id +'" class="btn btn-outline-info" style="width: 50px; height: 30px; display: flex; justify-content: center; align-items: center"><i class="bi bi-eye-fill"></i></a>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                document.getElementById("tblHoaDonXacNhan").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhSachHoaDonXacNhan();
</script>

<script>
    //Load số lượng hóa đơn đã thanh toán
    function loadSoLuongHoaDonDaThanhToan() {
        fetch(`/api/food/get-so-luong-hoa-don-da-thanh-toan`, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(soLuong => {
                if (soLuong == null || soLuong == ''){
                    document.getElementById("so-luong-thanh-toan").textContent = 0;
                }else {
                    document.getElementById("so-luong-thanh-toan").textContent = soLuong;
                }

            })
            .catch(error => console.error('Error:', error));
    }
    loadSoLuongHoaDonDaThanhToan();
</script>

<script>
    //Load số lượng hóa đơn hoàn thành
    function loadSoLuongHoaDonHoanThanh() {
        fetch(`/api/food/get-so-luong-hoa-don-hoan-thanh`, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(soLuong => {
                if (soLuong == null || soLuong == ''){
                    document.getElementById("so-luong-hoan-thanh").textContent = 0;
                }else {
                    document.getElementById("so-luong-hoan-thanh").textContent = soLuong;
                }

            })
            .catch(error => console.error('Error:', error));
    }
    loadSoLuongHoaDonHoanThanh();
</script>

<script>
    //Load số lượng hóa đơn đang chuẩn bị
    function loadSoLuongHoaDonDangChuanBi() {
        fetch(`/api/food/get-so-luong-hoa-don-dang-chuan-bi`, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(soLuong => {
                if (soLuong == null || soLuong == ''){
                    document.getElementById("so-luong-chuan-bi").textContent = 0;
                }else {
                    document.getElementById("so-luong-chuan-bi").textContent = soLuong;
                }

            })
            .catch(error => console.error('Error:', error));
    }
    loadSoLuongHoaDonDangChuanBi();
</script>

<script>
    //Load số lượng hóa đơn xác nhận
    function loadSoLuongHoaDonXacNhan() {
        fetch(`/api/food/get-so-luong-hoa-don-xac-nhan`, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(soLuong => {
                if (soLuong == null || soLuong == ''){
                    document.getElementById("so-luong-xac-nhan").textContent = 0;
                }else {
                    document.getElementById("so-luong-xac-nhan").textContent = soLuong;
                }

            })
            .catch(error => console.error('Error:', error));
    }
    loadSoLuongHoaDonXacNhan();
</script>

<script>
    //Load số lượng hóa đơn tất cả
    function loadSoLuongHoaDonTatCa() {
        fetch(`/api/food/get-so-luong-hoa-don-tat-ca`, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(soLuong => {
                if (soLuong == null || soLuong == ''){
                    document.getElementById("so-luong-tat-ca").textContent = 0;
                }else {
                    document.getElementById("so-luong-tat-ca").textContent = soLuong;
                }

            })
            .catch(error => console.error('Error:', error));
    }
    loadSoLuongHoaDonTatCa();
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