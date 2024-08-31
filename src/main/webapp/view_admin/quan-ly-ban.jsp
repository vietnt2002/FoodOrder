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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
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
        <h3 class="mt-3">Quản lý bàn</h3>
        <button type="button" class="btn btn-success float-end mb-2" data-bs-toggle="modal"
                data-bs-target="#modalThemBan">
            Thêm
        </button>
        <table class="table mt-5">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">QR Code</th>
                <th scope="col">Bàn số</th>
                <th scope="col">Ngày tạo</th>
                <th scope="col">Trạng thái</th>
                <th scope="col">Thao tác</th>
            </tr>
            </thead>
            <tbody id="tblBan">
            </tbody>
        </table>
        <!--    Main    -->

        <%@ include file="footer.jsp" %>
    </div>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- Modal thêm bàn -->
    <div class="modal fade" id="modalThemBan" tabindex="-1" aria-labelledby="exampleThemBan" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleThemBan">Thêm bàn</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="themBan">
                    <div class="modal-body">
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-12 col-md-8">
                                    <label for="tenban" class="form-label">Bàn số: </label>
                                    <input type="number" class="form-control" name="tenBan" id="tenban" value="" min="1" autocomplete="off">
                                </div>
                                <div class="col-12 col-md-4" style="margin-top: 32px">
                                    <input type="button" class="btn btn-secondary" onclick="createQR()" value="Tạo QR Code" />
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="qrCode" id="qrCode" value="">
                        <div id="qr-code" class="text-center"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-success">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal sửa bàn -->
    <div class="modal fade" id="modalSuaBan" tabindex="-1" aria-labelledby="exampleSuaBan" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleSuaBan">Thêm bàn</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="suaBan">
                    <div class="modal-body">
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-12 col-md-8">
                                    <label for="tenbanSua" class="form-label">Bàn số: </label>
                                    <input type="number" class="form-control" name="tenBanSua" id="tenbanSua" value="" min="1" autocomplete="off">
                                </div>
                                <div class="col-12 col-md-4" style="margin-top: 32px">
                                    <input type="button" class="btn btn-secondary" onclick="createQRSua()" value="Tạo QR Code" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-3">
                                    <label for="trangThai" class="form-label">Trạng thái: </label>
                                    <select class="form-select" aria-label="Default select example" id="trangThai">
                                        <option value="1">Hoạt động</option>
                                        <option value="0">Dừng hoạt động</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="qrCodeSua" id="qrCodeSua" value="">
                        <div id="qr-codeSua"></div>
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
    //Tải QR xuống
    document.addEventListener('click', function(e) {
        if (e.target && e.target.tagName === 'BUTTON' && e.target.id.startsWith('tai-ve_')) {
            e.preventDefault();
            const idBan = e.target.id.replace("tai-ve_", "");
            console.log(idBan);

            fetch(`/api/food/chi-tiet-ban/` + idBan, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                },
            })
                .then(response => response.json())
                .then(ban => {
                    if (ban.qrCode) {
                        const link = document.createElement('a');
                        link.href = ban.qrCode;
                        link.download = 'QRCode_' + ban.tenBan + '_' + ban.id + '.png';

                        document.body.appendChild(link);
                        link.click();

                        document.body.removeChild(link);
                    } else {
                        console.error('QR code not found');
                    }
                })
                .catch(error => console.error('Error:', error));
        }
    });
</script>

<script>
    //Xóa bàn
    document.addEventListener('click', function(e) {
        if (e.target && e.target.tagName === 'BUTTON' && e.target.id.startsWith('xoa_')) {
            e.preventDefault();
            const idBan = e.target.id.replace("xoa_", "");
            console.log(idBan);

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
                    fetch(`/api/food/xoa-ban/` + idBan, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                    })
                        .then(response => response.json())
                        .then(ban => {
                            Toast.fire({
                                icon: "success",
                                title: "Xóa bàn thành công!"
                            });
                            loadDanhSachBan();
                        })
                        .catch(error => console.error('Error:', error));
                }
            });
        }
    });
</script>

<script>
    //Tạo QRCode
    let qrCode;
    function createQR() {
        let tenBan = document.getElementById("tenban").value;
        if (!tenBan.trim()) {
            Toast.fire({
                icon: "error",
                title: "Không được để trống số bàn!"
            });
            return;
        }

        if (qrCode == null) {
            qrCode = generateQrCode(tenBan);
        } else {
            qrCode.makeCode(tenBan);
        }

        // Lấy QR code
        setTimeout(() => {
            const qrCanvas = document.querySelector("#qr-code canvas");
            if (qrCanvas) {
                const qrCodeValue = qrCanvas.toDataURL("image/png");
                document.getElementById("qrCode").value = qrCodeValue;
            }
        }, 100);
        document.getElementById('qr-code').style.display = 'block';
    }

    function generateQrCode(qrContent) {
        return new QRCode("qr-code", {
            text: qrContent,
            width: 200,
            height: 200,
            colorDark: "#000000",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.H,
        });
    }

    //Thêm bàn
    document.getElementById("themBan").addEventListener("submit", function (e){
        e.preventDefault();
        var tenBan = document.getElementById("tenban").value.trim();
        var qrCode = document.getElementById("qrCode").value;
        if (!tenBan || !qrCode){
            Toast.fire({
                icon: "error",
                title: "Hãy nhập số bàn và tạo QR Code trước khi thêm!"
            });
            return;
        }

        debugger
        var checkTenBan = false;
        fetch("/api/food/list-ban", {
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
                resp.forEach(ban => {
                    if (ban.tenBan == tenBan){
                        checkTenBan = true;
                        Toast.fire({
                            icon: "error",
                            title: "Số bàn đã tồn tại, hãy nhập số bàn khác!"
                        });
                    } else if (ban.qrCode == qrCode){
                        checkTenBan = true;
                        Toast.fire({
                            icon: "error",
                            title: "QR Code đã tồn tại, hãy nhấn tạo mã QR khác!"
                        });
                    }
                });

                if (checkTenBan){
                    return;
                }else {
                    const data = {
                        tenBan: tenBan,
                        qrCode: qrCode,
                    };

                    const requestOptions = {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(data),
                    };

                    fetch('/api/food/them-ban', requestOptions)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            Toast.fire({
                                icon: "success",
                                title: "Thêm bàn mới thành công"
                            });
                            loadDanhSachBan();
                            setTimeout(() => {
                                var myModal = bootstrap.Modal.getInstance(document.getElementById('modalThemBan'));
                                myModal.hide();
                            }, 1500);
                            document.getElementById("qr-code").style.display = 'none';
                            document.getElementById("qrCode").value = '';
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                }

            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    })
</script>

<script>
    let qrCodeSua;
    function createQRSua() {
        let tenBanSua = document.getElementById("tenbanSua").value;
        if (!tenBanSua.trim()) {
            Toast.fire({
                icon: "error",
                title: "Không được để trống số bàn!"
            });
            return;
        }

        if (qrCodeSua == null) {
            qrCodeSua = generateQrCodeSua(tenBanSua);
        } else {
            qrCodeSua.makeCode(tenBanSua);
        }

        // Lấy QR code
        setTimeout(() => {
            const qrCanvas = document.querySelector("#qr-codeSua canvas");
            if (qrCanvas) {
                const qrCode = qrCanvas.toDataURL("image/png");
                document.getElementById("qrCodeSua").value = qrCode;
            }
        }, 100);
        document.getElementById("qr-codeSua").style.display = 'block';
    }
    function generateQrCodeSua(qrContent) {
        return new QRCode("qr-codeSua", {
            text: qrContent,
            width: 250,
            height: 250,
            colorDark: "#000000",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.H,
        });
    }

    //detail bàn
    document.addEventListener('DOMContentLoaded', function() {
        document.addEventListener('click', function(e) {
            if (e.target && e.target.tagName === 'BUTTON' && e.target.id.startsWith('sua_')) {
                e.preventDefault();

                const idBan = e.target.id.replace("sua_", "");
                console.log(idBan);

                fetch(`/api/food/chi-tiet-ban/` + idBan, {
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    }
                })
                    .then(response => response.json())
                    .then(ban => {
                        document.getElementById("tenbanSua").value = ban.tenBan;
                        document.getElementById("trangThai").value = ban.trangThai;

                        // sửa thông tin bàn
                        const form = document.getElementById("suaBan");
                        form.onsubmit = function(e) {
                            e.preventDefault();
                            var tenBan = document.getElementById("tenbanSua").value.trim();
                            var qrCode = document.getElementById("qrCodeSua").value;
                            var trangThai = document.getElementById("trangThai").value;
                            if (!tenBan){
                                Toast.fire({
                                    icon: "error",
                                    title: "Không được để trống số bàn!"
                                });
                                return;
                            }
                            if (!qrCode){
                                Toast.fire({
                                    icon: "error",
                                    title: "Hãy nhấn tạo lại QR Code!"
                                });
                                return;
                            }
                            const data = {
                                id: idBan,
                                qrCode: qrCode,
                                tenBan: tenBan,
                                trangThai: trangThai,
                            };

                            const requestOptions = {
                                method: 'PUT',
                                headers: {
                                    'Content-Type': 'application/json',
                                },
                                body: JSON.stringify(data),
                            };

                            fetch('/api/food/sua-ban/' + idBan, requestOptions)
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error('Network response was not ok');
                                    }
                                    return response.json();
                                })
                                .then(data => {
                                    Toast.fire({
                                        icon: "success",
                                        title: "Sửa thông tin bàn thành công"
                                    });
                                    document.getElementById("qrCodeSua").value = '';
                                    document.getElementById("qr-codeSua").style.display = 'none';
                                    loadDanhSachBan();
                                    setTimeout(() => {
                                        var myModal = bootstrap.Modal.getInstance(document.getElementById('modalSuaBan'));
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
    //load danh sách bàn
    function loadDanhSachBan() {
        let html = '';
        fetch("/api/food/list-ban", {
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
                resp.forEach((ban, i) => {
                    const tenBan = ban.tenBan || 'N/A';
                    const qrCode = ban.qrCode || 'N/A';
                    const ngayTao = ban.ngayTao || 'N/A';
                    const trangThai = ban.trangThai === 1
                        ? '<p style="font-weight: bold; color: blue">Hoạt động</p>'
                        : '<p style="font-weight: bold; color: red">Dừng hoạt động</p>';

                    html += '<tr>' +
                        '<td>' + (i + 1) + '</td>' +
                        '<td>' +
                        '<img src="' + qrCode + '" ' +
                        'alt="Image" ' +
                        'style="width: 70px; height: 70px" ' +
                        'class="img-fluid rounded border" />' +
                        '</td>' +
                        '<td>' + tenBan + '</td>' +
                        '<td>' + ngayTao + '</td>' +
                        '<td>' + trangThai + '</td>' +
                        '<td>' +
                        '<div class="d-inline">' +
                        '<button id="sua_' + ban.id + '" class="btn btn-warning me-2" data-bs-toggle="modal" data-bs-target="#modalSuaBan">Sửa</button>' +
                        '<button id="xoa_' + ban.id + '" class="btn btn-danger me-2">Xóa</button>' +
                        '<button id="tai-ve_' + ban.id + '" class="btn btn-primary">Tải xuống</button>' +
                        '</div>' +
                        '</td>' +
                        '</tr>';
                });
                document.getElementById("tblBan").innerHTML = html;
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
    loadDanhSachBan();
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