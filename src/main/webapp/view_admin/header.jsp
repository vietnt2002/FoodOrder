<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!-- Spinner Start -->
<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<!-- Spinner End -->


<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <a href="/admin/trang-chu" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>FOOD ORDER</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="/temp_off/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0" id="hoTenLogin"></h6>
                <span id="chucVuLogin"></span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Quản lý món ăn</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="/admin/trang-chu" class="dropdown-item">Món ăn</a>
                    <a href="/admin/quan-ly-danh-muc" class="dropdown-item">Danh mục món ăn</a>
                </div>
            </div>
            <a href="/admin/quan-ly-ban" class="nav-item nav-link"><i class="bi bi-table"></i>Quản lý bàn</a>
            <a href="/admin/quan-ly-goi-mon" class="nav-item nav-link"><i class="bi bi-journal-text"></i>Khách gọi món</a>
            <a href="/admin/quan-ly-nhan-vien" class="nav-item nav-link"><i class="bi bi-person-bounding-box"></i>Nhân viên</a>
            <a href="/admin/quan-ly-khach-hang" class="nav-item nav-link"><i class="bi bi-person-bounding-box"></i>Khách hàng</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="signin.html" class="dropdown-item">Sign In</a>
                    <a href="signup.html" class="dropdown-item">Sign Up</a>
                    <a href="404.html" class="dropdown-item">404 Error</a>
                    <a href="blank.html" class="dropdown-item">Blank Page</a>
                </div>
            </div>
        </div>
    </nav>
</div>
<!-- Sidebar End -->