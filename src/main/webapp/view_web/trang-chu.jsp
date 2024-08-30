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
    <link href="/temp_onl/img/favicon.ico" rel="icon">

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

    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .quantityCart{
            position: absolute;
            top: 20px;
            background: red;
            left: 33px;
            padding: 0px 7px;
            border-radius: 20px;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container-xxl bg-white p-0">
    <!--  Header  -->
    <%@ include file="header.jsp" %>
    <!--  Header  -->

    <!--  Main  -->
    <div style="width: 500px" id="reader"></div>
    <h3>Danh sách bàn</h3>
    <div class="row" id="grBan">
        <%--        <div class="col-12 col-sm-6 col-md-4 col-lg-3">--%>
        <%--            <div class="card">--%>
        <%--                <div class="card-body">--%>
        <%--                    <img src="" alt="QR Code">--%>
        <%--                    <h5 class="card-title">Bàn 2</h5>--%>
        <%--                    <a href="#" class="btn btn-primary">Quét</a>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>
    <!--  Main  -->

    <!--  Footer  -->
    <%@ include file="footer.jsp" %>
    <!--  Footer  -->
</div>

<!-- Modal quét QR -->
<div class="modal fade" id="modalQuetQR" tabindex="-1" aria-labelledby="exampleQuetQR" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleQuetQR">Đưa mã QR lên trước camera</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="section">
                        <div id="my-qr-reader">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="stopScan">Đóng</button>
            </div>
        </div>
    </div>
</div>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.addEventListener('click', function (e) {
            if (e.target && e.target.tagName === 'BUTTON' && e.target.id.startsWith('quetQR_')) {
                e.preventDefault();

                function domReady(fn) {
                    if (
                        document.readyState === "complete" ||
                        document.readyState === "interactive"
                    ) {
                        setTimeout(fn, 1000);
                    } else {
                        document.addEventListener("DOMContentLoaded", fn);
                    }
                }

                domReady(function () {
                    function onScanSuccess(decodeText, decodeResult) {
                        console.log(decodeText);
                        fetch('/api/food/find-by-ten-ban/' + decodeText, {
                            method: 'GET',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                        })
                            .then(response => response.json())
                            .then(ban => {
                                if (!ban || typeof ban.id === 'undefined'){
                                    Toast.fire({
                                        icon: "error",
                                        title: "QR Code không hợp lệ. Hãy sử dụng QR Code của bàn!"
                                    });
                                    return;
                                }else {
                                    localStorage.setItem('idBan', ban.id);
                                    window.location.href = ban.url;
                                    // alert("Đường dẫn tới: "+ ban.url);
                                }
                            })
                            .catch(error => console.error('Error:', error));
                    }
                    let htmlscanner = new Html5QrcodeScanner("my-qr-reader", { fps: 10, qrbos: 250 });
                    htmlscanner.render(onScanSuccess);
                });

            }
        });
    });
</script>

<script>
    //Danh sách bàn
    function loadDanhSachBan() {
        let html = '';
        fetch("/api/food/list-ban-hoat-dong", {
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
                    var qrCode = ban.qrCode || 'N/A';
                    var tenBan = ban.tenBan || 'N/A';
                    var url = ban.url || 'N/A';

                    html +=
                        '<div class="col-12 col-sm-6 col-md-4 mb-3">' +
                        '<div class="card text-center">' +
                        '<div class="card-body">' +
                        '<img src="' + qrCode + '" ' +
                        'alt="Image" ' +
                        'style="width: 100px; height: 100px" ' +
                        'class="img-fluid rounded border " />' +
                        '<h5 class="card-title mt-3">Bàn ' + tenBan + '</h5>' +
                        '<button id="quetQR_' + ban.id + '" class="btn btn-primary mt-2 float-end" data-bs-toggle="modal" data-bs-target="#modalQuetQR">Quét</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                });
                document.getElementById("grBan").innerHTML = html;
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

<script src="https://unpkg.com/html5-qrcode"></script>
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