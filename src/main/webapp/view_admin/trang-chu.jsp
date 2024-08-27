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
    <link href="/temp_off/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/temp_off/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/temp_off/css/style.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="@sweetalert2/themes/dark/dark.css">
    <script src="sweetalert2/dist/sweetalert2.min.js"></script>

    <style>
        /*.navbar-nav .nav-link {*/
        /*    font-weight: normal;*/
        /*    color: #333; !* Màu chữ mặc định *!*/
        /*}*/

        /*.navbar-nav .nav-link.active {*/
        /*    font-weight: bold;*/
        /*    color: #000; !* Màu chữ khi được chọn *!*/
        /*}*/

        /*.navbar-nav .nav-link:hover {*/
        /*    color: #007bff; !* Màu chữ khi hover *!*/
        /*}*/
    </style>
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!--  Header  -->
    <%@ include file="header.jsp"%>
    <div class="content">
        <!--  Navbar  -->
        <%@ include file="nav.jsp"%>

        <!--    Main    -->
        <h3>Thống kê</h3>
        <!--    Main    -->

        <%@ include file="footer.jsp"%>
    </div>
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

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
</body>
</html>