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
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!--  Header  -->
    <%@ include file="header.jsp" %>
    <div class="content">
        <!--  Navbar  -->
        <%@ include file="nav.jsp" %>

        <!--    Main    -->
        <h3 class="mt-3">Quản lý danh mục</h3>
        <button type="button" class="btn btn-success float-end mb-2" data-bs-toggle="modal" data-bs-target="#modalThemDanhMuc">
            Thêm
        </button>
        <table class="table mt-5">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Tên danh mục</th>
                <th scope="col">Ngày tạo</th>
                <th scope="col">Trạng thái</th>
                <th scope="col">Thao tác</th>
            </tr>
            </thead>
            <tbody id="tblDanhMuc">
            </tbody>
        </table>
        <!--    Main    -->

<%--        <%@ include file="footer.jsp" %>--%>
    </div>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- Modal thêm danh mục -->
    <div class="modal fade" id="modalThemDanhMuc" tabindex="-1" aria-labelledby="exampleThemDanhMuc" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleThemDanhMuc">Thêm danh mục món ăn</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="themDanhMuc">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="tenDanhMuc" class="form-label">Tên danh mục: </label>
                            <input type="text" class="form-control" id="tenDanhMuc">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-success">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- Modal sửa danh mục -->
    <div class="modal fade" id="modalSuaDanhMuc" tabindex="-1" aria-labelledby="exampleSuaDanhMuc" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleSuaDanhMuc">Sửa danh mục món ăn</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="suaDanhMuc">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="tenDM" class="form-label">Tên danh mục: </label>
                            <input type="text" class="form-control" id="tenDM" value="">
                        </div>
                        <div class="mb-3">
                            <label for="trangThai" class="form-label">Trạng thái: </label>
                            <select class="form-select" aria-label="Default select example" id="trangThai">
                                <option value="1">Hoạt động</option>
                                <option value="0">Dừng hoạt động</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-warning">Sửa</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
    //Xóa danh mục
    document.addEventListener('click', function(e) {
        if (e.target && e.target.tagName === 'BUTTON' && e.target.id.startsWith('xoa_')) {
            e.preventDefault();
            const idDanhMuc = e.target.id.replace("xoa_", "");
            console.log(idDanhMuc);

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
                    fetch(`/api/food/xoa-danh-muc/` + idDanhMuc, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                    })
                        .then(response => response.json())
                        .then(danhMuc => {
                            Toast.fire({
                                icon: "success",
                                title: "Xóa danh mục thành công!"
                            });
                            loadDanhMucMonAn();
                        })
                        .catch(error => console.error('Error:', error));
                }
            });
        }
    });
</script>

<script>
    //detail danh mục
    document.addEventListener('DOMContentLoaded', function() {
        document.addEventListener('click', function(e) {
            if (e.target && e.target.tagName === 'BUTTON' && e.target.id.startsWith('sua_')) {
                e.preventDefault();

                const idDanhMuc = e.target.id.replace("sua_", "");
                console.log(idDanhMuc);

                fetch(`/api/food/chi-tiet-danh-muc/` + idDanhMuc, {
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    }
                })
                    .then(response => response.json())
                    .then(danhMuc => {
                        document.getElementById("tenDM").value = danhMuc.tenDanhMuc;
                        document.getElementById("trangThai").value = danhMuc.trangThai;

                        // Đảm bảo chỉ gắn sự kiện `submit` một lần
                        const form = document.getElementById("suaDanhMuc");
                        form.onsubmit = function(e) {
                            e.preventDefault();
                            var tenDanhMuc = document.getElementById("tenDM").value.trim();
                            var trangThai = document.getElementById("trangThai").value;
                            if (!tenDanhMuc){
                                Toast.fire({
                                    icon: "error",
                                    title: "Không được để trống tên danh mục!"
                                });
                                return;
                            }
                            const data = {
                                id: idDanhMuc,
                                tenDanhMuc: tenDanhMuc,
                                trangThai: trangThai,
                            };

                            const requestOptions = {
                                method: 'PUT',
                                headers: {
                                    'Content-Type': 'application/json',
                                },
                                body: JSON.stringify(data),
                            };

                            fetch('/api/food/sua-danh-muc/' + idDanhMuc, requestOptions)
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error('Network response was not ok');
                                    }
                                    return response.json();
                                })
                                .then(data => {
                                    Toast.fire({
                                        icon: "success",
                                        title: "Sửa danh mục thành công"
                                    });
                                    loadDanhMucMonAn();
                                    setTimeout(() => {
                                        var myModal = bootstrap.Modal.getInstance(document.getElementById('modalSuaDanhMuc'));
                                        myModal.hide();
                                    }, 1500);
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                });
                        };
                    })
                    .catch(error => console.error('Error:', error));
            }
        });
    });
</script>

<script>
    //Thêm danh mục
    document.getElementById("themDanhMuc").addEventListener("submit", function (e){
        e.preventDefault();
        var tenDanhMuc = document.getElementById("tenDanhMuc").value.trim();
        if (!tenDanhMuc){
            Toast.fire({
                icon: "error",
                title: "Không được để trống tên danh mục!"
            });
            return;
        }
        const data = {
            tenDanhMuc: tenDanhMuc,
        };

        const requestOptions = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        };

        fetch('/api/food/them-danh-muc', requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                Toast.fire({
                    icon: "success",
                    title: "Thêm danh mục thành công"
                });
                loadDanhMucMonAn();
                setTimeout(() => {
                    var myModal = bootstrap.Modal.getInstance(document.getElementById('modalThemDanhMuc'));
                    myModal.hide();
                }, 1500);

            })
            .catch(error => {
                console.error

                ('Error:', error);
            });
    })
</script>

<script>
    function loadDanhMucMonAn() {
        let html = '';
        fetch("/api/food/list-danh-muc", {
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
                resp.forEach((danhMuc, i) => {
                    const tenDanhMuc = danhMuc.tenDanhMuc || 'N/A';
                    const ngayTao = danhMuc.ngayTao || 'N/A';
                    const trangThai = danhMuc.trangThai === 1
                        ? '<p style="font-weight: bold; color: blue">Hoạt động</p>'
                        : '<p style="font-weight: bold; color: red">Dừng hoạt động</p>';

                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' + tenDanhMuc + '</td>' +
                        '<td>' + ngayTao + '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<button id="sua_' + danhMuc.id + '" class="btn btn-warning me-2" data-bs-toggle="modal" data-bs-target="#modalSuaDanhMuc">Sửa</button>' +
                        '<button id="xoa_' + danhMuc.id + '" class="btn btn-danger">Xóa</button>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                document.getElementById("tblDanhMuc").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhMucMonAn();
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