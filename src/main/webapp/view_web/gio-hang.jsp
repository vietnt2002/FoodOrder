<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Restoran - Bootstrap Restaurant Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/temp_onl/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/temp_onl/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/temp_onl/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/temp_onl/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/temp_onl/css/style.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .quantityCart {
            position: absolute;
            top: 20px;
            background: red;
            left: 33px;
            padding: 0px 7px;
            border-radius: 20px;
            color: white;
            font-weight: bold;
        }

        .left, .right {
            height: 25px;
            width: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .soLuong {
            width: 60px;
            height: 25px;
        }
    </style>
</head>

<body>
<div class="container-xxl bg-white p-0">
    <!-- Spinner Start -->
    <div id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar & Hero Start -->
    <div class="container-xxl position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
            <a href="" class="navbar-brand p-0">
                <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Food Order</h1>
                <!-- <img src="img/logo.png" alt="Logo"> -->
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0 pe-4">
                    <a href="/client/trang-chu" class="nav-item nav-link active">Home</a>
                    <a href="/client/menu" class="nav-item nav-link">Menu</a>
                    <div class="cart-container" style="position: relative">
                        <a href="/client/gio-hang" class="nav-item nav-link"><i class="bi bi-basket2-fill"></i></a>
                        <span class="quantityCart" id="quantityCart"></span>
                    </div>
                </div>
                <a href="" class="btn btn-primary py-2 px-4">Book A Table</a>
            </div>
        </nav>

        <div class="container-xxl py-5 bg-dark hero-header mb-5">
            <div class="container text-center my-5 pt-5 pb-4">
                <h1 class="display-3 text-white mb-3 animated slideInDown">Food Cart</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center text-uppercase">
                        <li class="breadcrumb-item"><a href="/client/trang-chu">Home</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">Cart</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar & Hero End -->


    <!-- Main -->
    <h3 class="mt-3 text-center" id="monAnDaChon">Món ăn đã chọn</h3>
    <table class="table mt-5">
        <thead>
        <tr>
            <th scope="col">Hình ảnh</th>
            <th scope="col">Tên món ăn</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Giá tiền</th>
            <th scope="col">Tổng tiền</th>
            <th scope="col">Thao tác</th>
        </tr>
        </thead>
        <tbody id="tblGioHang">
        </tbody>
    </table>

    <div class="">
        <button type="submit" id="datMon" class="btn btn-primary float-end me-3">Đặt món</button>
    </div>
    <!-- Main -->

    <!-- Footer Start -->
    <%@ include file="footer.jsp" %>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- Modal nhập số lượng -->
<%--<div class="modal fade" id="modalNhapSoLuong" tabindex="-1" aria-labelledby="exampleNhapSoLuong" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleNhapSoLuong">Nhập số lượng món ăn: </h5>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <form id="themGioHang">--%>
<%--                <div class="modal-body">--%>
<%--                    <div class="mb-3">--%>
<%--                        <label for="soLuong" class="form-label">Nhập số lượng: </label>--%>
<%--                        <input type="number" class="form-control" name="soLuong" id="soLuong" min="1" value="1">--%>
<%--                        <input type="hidden" id="giaTienGH" value="">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Đóng</button>--%>
<%--                    <button type="submit" class="btn btn-primary" >Thêm giỏ hàng</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script>
    //Đặt hàng
    var idBan = localStorage.getItem('idBan');
    var idNhanVien = localStorage.getItem('idNhanVien');
    console.log(idBan);
    console.log("idnv:- "+idNhanVien);
    document.getElementById("datMon").addEventListener("click", function (e){
        e.preventDefault();

        const data = {
            idBan: idBan,
            idNhanVien: idNhanVien,
        };

        const requestOptions = {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        };

        fetch('/api/food/dat-mon', requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(data => {
                Toast.fire({
                    icon: "success",
                    title: "Đặt món thành công"
                });
                loadSoLuongGioHang();
                loadDanhSachMonAnGioHang()
                setTimeout(() => {
                    location.href = '/client/menu';
                }, 3000);

            })
            .catch(error => {
                console.error

                ('Error:', error);
            });
    })

</script>

<script>
    //Xóa món ăn khỏi giỏ hàng
    document.addEventListener('click', function(e) {
        if (e.target && e.target.tagName === 'BUTTON' && e.target.id.startsWith('xoa_')) {
            e.preventDefault();
            const idGioHang = e.target.id.replace("xoa_", "");
            console.log(idGioHang);

            Swal.fire({
                title: 'Bạn có chắc chắn muốn xóa không?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Đồng ý!',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    fetch(`/api/food/xoa-mon-an-khoi-gio-hang/` + idGioHang, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                    })
                        .then(response => response.json())
                        .then(monAn => {
                            Toast.fire({
                                icon: "success",
                                title: "Xóa món ăn khỏi giỏ hàng thành công!"
                            });
                            loadSoLuongGioHang()
                            loadDanhSachMonAnGioHang();
                        })
                        .catch(error => console.error('Error:', error));
                }
            });
        }
    });
</script>

<script>
    //Danh sách món ăn trong giỏ hàng
    function loadDanhSachMonAnGioHang() {
        var idBan = localStorage.getItem('idBan');
        console.log(idBan)
        let html = '';
        fetch('/api/food/list-gio-hang-by-idBan/' + idBan, {
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
                if (resp.length === 0){
                    document.getElementById('datMon').style.display = 'none';
                    document.getElementById('monAnDaChon').textContent = 'Không có món ăn nào được chọn';
                }
                resp.forEach(gioHang => {
                    const hinhAnh = gioHang.idMonAn.hinhAnh || 'N/A';
                    const tenMon = gioHang.idMonAn.tenMon || 'N/A';
                    const soLuong = gioHang.soLuong || 'N/A';
                    const giaTien = gioHang.giaTien || 'N/A';
                    const tongTien = soLuong * giaTien;

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
                        '<td>' + giaTien + '</td>' +
                        '<td>' + tongTien + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<button id="xoa_' + gioHang.id + '" class="btn btn-danger">Xóa</button>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                document.getElementById("tblGioHang").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhSachMonAnGioHang();
</script>

<script>
    //Số lượng giỏ hàng
    function loadSoLuongGioHang() {
        var idBan = localStorage.getItem('idBan');
        fetch(`/api/food/get-so-luong-gio-hang/` + idBan, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(soLuong => {
                console.log("SL:"+soLuong)
                if (soLuong == null || soLuong == ''){
                    document.getElementById("quantityCart").textContent = '0';
                }else {
                    document.getElementById("quantityCart").textContent = soLuong;
                }

            })
            .catch(error => console.error('Error:', error));
    }
    loadSoLuongGioHang();
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
</script>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/temp_onl/lib/wow/wow.min.js"></script>
<script src="/temp_onl/lib/easing/easing.min.js"></script>
<script src="/temp_onl/lib/waypoints/waypoints.min.js"></script>
<script src="/temp_onl/lib/counterup/counterup.min.js"></script>
<script src="/temp_onl/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/temp_onl/lib/tempusdominus/js/moment.min.js"></script>
<script src="/temp_onl/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="/temp_onl/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="/temp_onl/js/main.js"></script>
</body>

</html>