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

    <link rel="stylesheet" href="@sweetalert2/themes/dark/dark.css">
    <script src="sweetalert2/dist/sweetalert2.min.js"></script>
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Sign In Start -->
    <div class="container-fluid">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                <form id="loginForm">
                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="/admin/thong-ke" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>FOOD</h3>
                            </a>
                            <h3>Login</h3>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="username" placeholder="name@example.com">
                            <label for="username">Username</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" id="password" placeholder="Password">
                            <label for="password">Password</label>
                        </div>
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Sign In End -->
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
<script src="/js/main.js"></script>
</body>
</html>