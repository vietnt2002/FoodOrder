CREATE DATABASE FoodOrder
USE FoodOrder
CREATE TABLE DanhMucMonAn(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
	TenDanhMuc NVARCHAR(100) NOT NULL,
	NgayTao DATETIME NOT NULL,
	TrangThai INT NOT NULL
)

CREATE TABLE MonAn(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
	IdDanhMuc UNIQUEIDENTIFIER REFERENCES dbo.DanhMucMonAn(Id) NOT NULL,
	HinhAnh NVARCHAR(MAX) NOT NULL,
	TenMon NVARCHAR(100) NOT NULL,
	GiaTien DECIMAL(20, 0) NOT NULL,
	MoTa NVARCHAR(MAX) NOT NULL,
	NgayTao DATETIME NOT NULL,
	TrangThai INT NOT NULL
)

CREATE TABLE Ban(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
	TenBan NVARCHAR(30) NOT NULL,
	QRCode VARCHAR(100) NOT NULL,
	NgayTao DATETIME NOT NULL,
	TrangThai INT NOT NULL
)

CREATE TABLE NhanVien(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
	HoTen NVARCHAR(50) NOT NULL,
	GioiTinh INT NOT NULL,
	NgaySinh DATE NOT NULL,
	Sdt VARCHAR(15) NOT NULL,
	TaiKhoan VARCHAR(50) NOT NULL,
	MatKhau VARCHAR(MAX) NOT NULL,
	NgayTao DATETIME NOT NULL,
	TrangThai INT NOT NULL
)

CREATE TABLE HoaDon(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
	IdNhanVien UNIQUEIDENTIFIER REFERENCES dbo.NhanVien(Id) NOT NULL,
	IdBan UNIQUEIDENTIFIER REFERENCES dbo.Ban(Id) NOT NULL,
	Ma VARCHAR(30) NOT NULL,
	TongTien DECIMAL(20, 0) NOT NULL,
	NgayTao DATETIME NOT NULL,
	NgayThanhToan DATETIME NOT NULL,
	TrangThai INT NOT NULL
)

CREATE TABLE HoaDonChiTiet(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID() NOT NULL,
	IdHoaDon UNIQUEIDENTIFIER REFERENCES dbo.HoaDon(Id) NOT NULL,
	IdMonAn UNIQUEIDENTIFIER REFERENCES dbo.MonAn(Id) NOT NULL,
	SoLuong INT NOT NULL,
	GiaTien DECIMAL(20, 0) NOT NULL,
	NgayTao DATETIME NOT NULL,
	TrangThai INT NOT NULL
)



USE FoodOrder

SELECT * FROM dbo.NhanVien

INSERT INTO NhanVien ()










