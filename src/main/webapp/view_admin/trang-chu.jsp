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
        .image-container {
            position: relative;
            display: inline-block;
        }

        #image-preview {
            width: 200px;
            height: 200px;
            border: 1px dashed gray;
            cursor: pointer;
            border-radius: 50%;
            display: block;
            padding: 4px;
        }

        #image-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: black;
            font-size: 18px;
            text-align: center;
            pointer-events: none;
            width: 80px; /* Adjust width as needed */
        }

        #image-preview:hover {
            background-color: #eee;
        }

        .file-info {
            margin-top: 10px;
            font-size: 14px;
            color: #333;
        }

        .image-container2 {
            position: relative;
            display: inline-block;
        }

        #image-preview2 {
            width: 200px;
            height: 200px;
            border: 1px dashed gray;
            cursor: pointer;
            border-radius: 50%;
            display: block;
            padding: 4px;
        }

        #image-overlay2 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: black;
            font-size: 18px;
            text-align: center;
            pointer-events: none;
            width: 80px; /* Adjust width as needed */
        }

        #image-preview2:hover {
            background-color: #eee;
        }

        .file-info2 {
            margin-top: 10px;
            font-size: 14px;
            color: #333;
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
        <h3 class="mt-3">Quản lý món ăn</h3>
        <button type="button" class="btn btn-success float-end mb-2" data-bs-toggle="modal"
                data-bs-target="#modalThemMonAn">
            Thêm
        </button>
        <table class="table mt-5">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Hình ảnh</th>
                <th scope="col">Loại món ăn</th>
                <th scope="col">Tên món ăn</th>
                <th scope="col">Giá tiền</th>
                <th scope="col">Mô tả</th>
                <th scope="col">Ngày tạo</th>
                <th scope="col">Trạng thái</th>
                <th scope="col">Thao tác</th>
            </tr>
            </thead>
            <tbody id="tblMonAn">
            </tbody>
        </table>
        <!--    Main    -->

        <%@ include file="footer.jsp" %>
    </div>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- Modal thêm món ăn -->
    <div class="modal fade" id="modalThemMonAn" tabindex="-1" aria-labelledby="exampleThemMonAn" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleThemMonAn">Thêm món ăn</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="themMonAn" method="post" action="/admin/them-mon-an" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12 col-md-5">
                                <div class="card text-center" style="height: 450px;">
                                    <div class="card-body">
                                        <h5 class="card-title mt-4">Ảnh món ăn</h5>
                                        <label for="file-input" class="image-container mt-3">
                                            <img src="" alt="" id="image-preview">
                                            <div id="image-overlay">+ Upload</div>
                                            <input type="file" id="file-input" accept="image/*" style="display: none;" name="hinhAnh">
                                        </label>
                                        <div id="image-info" class="mt-4"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-7">
                                <div class="card" style="height: 450px;">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <div class="mb-3">
                                                <label for="danhMucMonAnCombobox" class="form-label">Danh mục món ăn: </label>
                                                <select class="form-select" aria-label="Default select example"
                                                        id="danhMucMonAnCombobox" name="idMonAn">

                                                </select>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="tenMonAn" class="form-label">Tên món ăn: </label>
                                            <input type="text" class="form-control" id="tenMonAn" name="tenMon">
                                        </div>
                                        <div class="mb-3">
                                            <label for="giaTien" class="form-label">Giá tiền: </label>
                                            <input type="number" class="form-control" id="giaTien" name="giaTien">
                                        </div>
                                        <div class="mb-3">
                                            <label for="moTa" class="form-label">Mô tả: </label>
                                            <textarea class="form-control" id="moTa" name="moTa" rows="2"></textarea>
                                        </div>
                                        <div class="text-center">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Đóng
                                            </button>
                                            <button type="submit" class="btn btn-success">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal sửa món ăn -->
    <div class="modal fade" id="modalSuaMonAn" tabindex="-1" aria-labelledby="exampleSuaMonAn" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleSuaMonAn">Thêm món ăn</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="suaMonAn" method="post" action="/admin/sua-mon-an" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12 col-md-5">
                                <div class="card text-center" style="height: 530px;">
                                    <div class="card-body">
                                        <h5 class="card-title mt-4">Ảnh món ăn</h5>
                                        <label for="file-input2" class="image-container mt-3">
                                            <img src="" alt="" id="image-preview2">
                                            <div id="image-overlay2">+ Upload</div>
                                            <input type="file" id="file-input2" accept="image/*" style="display: none;" name="hinhAnh2">
                                        </label>
                                        <div id="image-info2" class="mt-4"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-7">
                                <div class="card" style="height: 530px;">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <div class="mb-3">
                                                <label for="danhMucMonAnComboboxSua" class="form-label">Danh mục món ăn: </label>
                                                <select class="form-select" aria-label="Default select example"
                                                        id="danhMucMonAnComboboxSua" name="idMonAn">

                                                </select>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="tenMonAn" class="form-label">Tên món ăn: </label>
                                            <input type="text" class="form-control" id="tenMonAnSua" name="tenMon">
                                        </div>
                                        <div class="mb-3">
                                            <label for="giaTien" class="form-label">Giá tiền: </label>
                                            <input type="number" class="form-control" id="giaTienSua" name="giaTien">
                                        </div>
                                        <div class="mb-3">
                                            <label for="moTa" class="form-label">Mô tả: </label>
                                            <textarea class="form-control" id="moTaSua" name="moTa" rows="2"></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="trangThai" class="form-label">Trạng thái: </label>
                                            <select class="form-select" aria-label="Default select example" id="trangThai">
                                                <option value="1">Hoạt động</option>
                                                <option value="0">Dừng hoạt động</option>
                                            </select>
                                        </div>
                                        <div class="text-center">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Đóng
                                            </button>
                                            <button type="submit" class="btn btn-warning">Sửa</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


</div>


<script>
    //Xóa món ăn
    document.addEventListener('click', function(e) {
        if (e.target && e.target.tagName === 'BUTTON' && e.target.id.startsWith('xoa_')) {
            e.preventDefault();
            const idMonAn = e.target.id.replace("xoa_", "");
            console.log(idMonAn);

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
                    fetch(`/api/food/xoa-mon-an/` + idMonAn, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                    })
                        .then(response => response.json())
                        .then(monAn => {
                            Toast.fire({
                                icon: "success",
                                title: "Xóa danh mục thành công!"
                            });
                            loadDanhSachMonAn();
                        })
                        .catch(error => console.error('Error:', error));
                }
            });
        }
    });
</script>

<script>
    //Thêm món ăn
    document.getElementById('themMonAn').addEventListener('submit', function (event) {
        event.preventDefault();

        var idDanhMuc = document.getElementById('danhMucMonAnCombobox').value;
        var hinhAnh = document.getElementById('image-info').textContent;
        var tenMonAn = document.getElementById('tenMonAn').value.trim();
        var giaTien = document.getElementById('giaTien').value.trim();
        var moTa = document.getElementById('moTa').value.trim();

        if (!hinhAnh || !tenMonAn || !giaTien || !moTa){
            Toast.fire({
                icon: "error",
                title: "Hãy chọn hình ảnh và điền đầy đủ thông tin món ăn!"
            });
            return;
        }
        const formData = new FormData();
        const data = {
            idDanhMuc: idDanhMuc,
            tenMon: tenMonAn,
            giaTien: giaTien,
            moTa: moTa,
        };

        formData.append('monAnRequest', new Blob([JSON.stringify(data)], { type: "application/json" }));
        formData.append('hinhAnh', document.querySelector('input[type="file"]').files[0]);

        const requestOptions = {
            method: 'POST',
            body: formData
        };

        fetch('/api/food/them-mon-an', requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                Toast.fire({
                    icon: "success",
                    title: "Thêm món ăn thành công"
                });
                loadDanhSachMonAn();
                setTimeout(() => {
                    var myModal = bootstrap.Modal.getInstance(document.getElementById('modalThemMonAn'));
                    myModal.hide();
                }, 1500);

            })
            .catch(error => {
                console.error
                ('Error:', error);
            });
    });
</script>

<script>
    //detail món ăn
    document.addEventListener('DOMContentLoaded', function() {
        document.addEventListener('click', function(e) {
            if (e.target && e.target.tagName === 'BUTTON' && e.target.id.startsWith('sua_')) {
                e.preventDefault();

                const idMonAn = e.target.id.replace("sua_", "");
                console.log(idMonAn);

                fetch(`/api/food/chi-tiet-mon-an/` + idMonAn, {
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    }
                })
                    .then(response => response.json())
                    .then(monAn => {
                        document.getElementById("image-preview2").src = "/images/"+monAn.hinhAnh;
                        document.getElementById("image-overlay2").style.display = 'none';
                        document.getElementById("image-info2").textContent = monAn.hinhAnh;

                        document.getElementById("danhMucMonAnComboboxSua").value = monAn.idDanhMuc.id;
                        document.getElementById("tenMonAnSua").value = monAn.tenMon;
                        document.getElementById("giaTienSua").value = monAn.giaTien;
                        document.getElementById("moTaSua").value = monAn.moTa;
                        document.getElementById("trangThai").value = monAn.trangThai;
                    })
                    .catch(error => console.error('Error:', error));

                //Sửa món ăn
                const form = document.getElementById("suaMonAn");
                form.onsubmit = function(e) {
                    e.preventDefault();
                    var idDanhMuc = document.getElementById('danhMucMonAnComboboxSua').value;
                    var hinhAnh = document.getElementById('image-info2').textContent;
                    var tenMonAn = document.getElementById('tenMonAnSua').value.trim();
                    var giaTien = document.getElementById('giaTienSua').value.trim();
                    var moTa = document.getElementById('moTaSua').value.trim();
                    var trangThai = document.getElementById("trangThai").value;

                    if (!hinhAnh || !tenMonAn || !giaTien || !moTa){
                        Toast.fire({
                            icon: "error",
                            title: "Hãy chọn hình ảnh và điền đầy đủ thông tin món ăn!"
                        });
                        return;
                    }
                    const formData = new FormData();
                    const data = {
                        hinhAnh: hinhAnh,
                        idDanhMuc: idDanhMuc,
                        tenMon: tenMonAn,
                        giaTien: giaTien,
                        moTa: moTa,
                        trangThai: trangThai
                    };

                    formData.append('monAnRequest', new Blob([JSON.stringify(data)], { type: "application/json" }));
                    formData.append('hinhAnh2', document.getElementById("file-input2").files[0]);

                    const requestOptions = {
                        method: 'PUT',
                        body: formData
                    };

                    fetch('/api/food/sua-mon-an/' + idMonAn, requestOptions)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            Toast.fire({
                                icon: "success",
                                title: "Sửa món ăn thành công!"
                            });
                            loadDanhSachMonAn();
                            setTimeout(() => {
                                var myModal = bootstrap.Modal.getInstance(document.getElementById('modalSuaMonAn'));
                                myModal.hide();
                            }, 1500);

                        })
                        .catch(error => {
                            console.error
                            ('Error:', error);
                        });
                }
            }
        });
    });
</script>

<script>
    //load danh sách món ăn
    function loadDanhSachMonAn() {
        let html = '';
        fetch("/api/food/list-mon-an", {
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
                resp.forEach((monAn, i) => {
                    var tenDanhMuc = monAn.idDanhMuc.tenDanhMuc || 'N/A';
                    var tenMonAn = monAn.tenMon || 'N/A';
                    var hinhAnh = monAn.hinhAnh || 'N/A';
                    var giaTien = monAn.giaTien || 'N/A';
                    var moTa = monAn.moTa || 'N/A';
                    var ngayTao = monAn.ngayTao || 'N/A';
                    var trangThai = monAn.trangThai === 1
                        ? '<p style="font-weight: bold; color: blue">Hoạt động</p>'
                        : '<p style="font-weight: bold; color: red">Dừng hoạt động</p>';

                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' +
                        '<img src="' + "/images/" + hinhAnh + '" ' +
                        'alt="Image" ' +
                        'style="width: 70px; height: 60px" ' +
                        'class="img-fluid rounded border" />' +
                        '</td>' +
                        '<td>' + tenDanhMuc + '</td>' +
                        '<td>' + tenMonAn + '</td>' +
                        '<td>' + giaTien + '</td>' +
                        '<td>' + moTa + '</td>' +
                        '<td>' + ngayTao + '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<button id="sua_' + monAn.id + '" class="btn btn-warning me-2" data-bs-toggle="modal" data-bs-target="#modalSuaMonAn">Sửa</button>' +
                        '<button id="xoa_' + monAn.id + '" class="btn btn-danger">Xóa</button>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                document.getElementById("tblMonAn").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }

    //Load danh mục món ăn combobox
    function loadDanhMucMonAnCombobox(){
        let html = '';
        fetch("/api/food/list-danh-muc-hoat-dong", {
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
                    const idDanhMuc = danhMuc.id || 'N/A';
                    const tenDanhMuc = danhMuc.tenDanhMuc || 'N/A';

                    html += '<option value="' + idDanhMuc +'">' + tenDanhMuc + '</option>';
                });
                document.getElementById("danhMucMonAnCombobox").innerHTML = html;
                document.getElementById("danhMucMonAnComboboxSua").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhSachMonAn();
    loadDanhMucMonAnCombobox();
</script>



<script>
    document.getElementById('file-input').addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('image-preview').src = e.target.result;
                document.getElementById('image-overlay').textContent = '';
                // Lấy thông tin file ảnh
                const fileInput = document.getElementById('file-input');
                const file = fileInput.files[0];
                if (file) {
                    const fileName = file.name;
                    document.getElementById('image-info').textContent = fileName;
                }
            }
            reader.readAsDataURL(file);
        }
    });
    document.getElementById('file-input2').addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('image-preview2').src = e.target.result;
                document.getElementById('image-overlay2').textContent = '';
                // Lấy thông tin file ảnh
                const fileInput = document.getElementById('file-input2');
                const file = fileInput.files[0];
                if (file) {
                    const fileName = file.name;
                    document.getElementById('image-info2').textContent = fileName;
                }
            }
            reader.readAsDataURL(file);
        }
    });
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