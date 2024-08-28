//Đăng xuất
// document.getElementById('dang-xuat').addEventListener('click', function (e) {
//     Swal.fire({
//         title: "Bạn có chắc chắn muốn đăng xuất không?",
//         text: "Bạn sẽ không thể hoàn tác hành động này!",
//         icon: "warning",
//         showCancelButton: true,
//         confirmButtonColor: "#3085d6",
//         cancelButtonColor: "#d33",
//         cancelButtonText: "Hủy",
//         confirmButtonText: "Đồng ý"
//     }).then((result) => {
//         if (result.isConfirmed) {
//             Swal.fire({
//                 title: "Thành công!",
//                 text: "Đăng xuất thành công",
//                 icon: "success"
//             }).then(() => {
//                 location.href = '/admin/dang-nhap-view';
//             });
//         }
//     });
// });


//Check Đăng nhập
// document.getElementById('loginForm').addEventListener('submit', function (event) {
//     event.preventDefault();
//
//     const username = document.getElementById('username').value.trim();
//     const password = document.getElementById('password').value.trim();
//
//     // Check trống
//     if (!username || !password) {
//         Toast.fire({
//             icon: "error",
//             title: "Hãy nhập đầy đủ thông tin!"
//         });
//         return;
//     }
//
//     // Gửi yêu cầu đăng nhập
//     const outputElement = document.getElementById('output');
//
//     fetch('/api/food/list-nhan-vien')
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error('Network response was not ok');
//             }
//             return response.json();
//         })
//         .then(data => {
//             // Duyệt qua danh sách nhân viên và kiểm tra thông tin
//             data.forEach(nhanVien => {
//                 if (nhanVien.taiKhoan !== username || nhanVien.matKhau !== password) {
//                     Toast.fire({
//                         icon: "error",
//                         title: "Tài khoản hoặc mật khẩu nhập vào chưa đúng!"
//                     });
//                 } else {
//                     localStorage.setItem("username", username);
//                     Toast.fire({
//                         icon: "success",
//                         title: "Đăng nhập thành công"
//                     });
//                     setTimeout(() => {
//                         location.href = '/admin/trang-chu';
//                     }, 2000);
//                 }
//             });
//
//             // Hiển thị toàn bộ dữ liệu nhân viên
//             outputElement.textContent = JSON.stringify(data, null, 2);
//             console.log(data)
//         })
//         .catch(error => {
//             console.error('Error:', error);
//         });
// });


//Đăng xuất
// document.getElementById('dang-xuat').addEventListener('click', function (e) {
//     Swal.fire({
//         title: "Bạn có chắc chắn muốn đăng xuất không?",
//         text: "Bạn sẽ không thể hoàn tác hành động này!",
//         icon: "warning",
//         showCancelButton: true,
//         confirmButtonColor: "#3085d6",
//         cancelButtonColor: "#d33",
//         cancelButtonText: "Hủy",
//         confirmButtonText: "Đồng ý"
//     }).then((result) => {
//         if (result.isConfirmed) {
//             Swal.fire({
//                 title: "Thành công!",
//                 text: "Đăng xuất thành công",
//                 icon: "success"
//             }).then(() => {
//                 setTimeout(() => {
//                     location.href = '/admin/dang-nhap-view';
//                 }, 1500);
//             });
//         }
//     });
// })


//Thành công
// const Toast = Swal.mixin({
//     toast: true,
//     position: "top-end",
//     showConfirmButton: false,
//     timer: 3000,
//     timerProgressBar: true,
//     didOpen: (toast) => {
//         toast.onmouseenter = Swal.stopTimer;
//         toast.onmouseleave = Swal.resumeTimer;
//     }
// });
// Toast.fire({
//     icon: "success",
//     title: "Signed in successfully"
// });

//Thành công
// Swal.fire({
//     icon: "success",
//     title: "Oops...",
//     text: "Something went wrong!",
// });

//THất bại
// Swal.fire({
//     icon: "error",
//     title: "Oops...",
//     text: "Something went wrong!",
// });


// Confirm
// Swal.fire({
//     title: "Bạn có chắc chắn muốn thêm không?",
//     text: "Bạn sẽ không thể hoàn tác hành động này!",
//     icon: "warning",
//     showCancelButton: true,
//     confirmButtonColor: "#3085d6",
//     cancelButtonColor: "#d33",
//     cancelButtonText: "Hủy",
//     confirmButtonText: "Thêm"
// }).then((result) => {
//     if (result.isConfirmed) {
//         Swal.fire({
//             title: "Đã thêm!",
//             text: "Bạn đã thêm chức vụ thành công.",
//             icon: "success"
//         }).then(() => {
//             document.getElementById('chucVuForm').submit();
//         });
//     }
// });
