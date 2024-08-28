//Check Đăng nhập
document.getElementById('chucVuForm').addEventListener('submit', function (event) {
    event.preventDefault();
    const username = document.getElementById('tenChucVu').value.trim();
    const password = document.getElementById('tenChucVu').value.trim();

    let hasError = false;
    if (!tenChucVu) {
        document.getElementById('error-tenChucVu').textContent = 'Tên chức vụ không được để trống';
        hasError = true;
    } else if (listCV.some(chucVu => chucVu.ten === tenChucVu)) {
        document.getElementById('error-tenChucVu').textContent = 'Tên chức vụ đã tồn tại';
        hasError = true;
    } else if (!isValidFullName(tenChucVu)) {
        document.getElementById('error-tenChucVu').textContent = 'Tên chức vụ nhập vào phải là chữ';
        hasError = true;
    } else if (tenChucVu.length > 30) {
        document.getElementById('error-tenChucVu').textContent = 'Tên chức vụ nhập vào không được quá 30 ký tự';
        hasError = true;
    } else {
        document.getElementById('error-tenChucVu').textContent = '';
    }
    if (hasError) {
        return;
    }

    event.preventDefault();
    Swal.fire({
        title: "Bạn có chắc chắn muốn thêm không?",
        text: "Bạn sẽ không thể hoàn tác hành động này!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        cancelButtonText: "Hủy",
        confirmButtonText: "Thêm"
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "Đã thêm!",
                text: "Bạn đã thêm chức vụ thành công.",
                icon: "success"
            }).then(() => {
                document.getElementById('chucVuForm').submit();
            });
        }
    });
});