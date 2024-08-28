package com.example.food_order.entities;

import jakarta.persistence.*;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class NhanVien {
    private String id;
    private String hoTen;
    private int gioiTinh;
    private Date ngaySinh;
    private String sdt;
    private String taiKhoan;
    private String matKhau;
    private LocalDateTime ngayTao;
    private int trangThai;
    private ChucVu idChucVu;

    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.UUID)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "HoTen")
    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    @Basic
    @Column(name = "GioiTinh")
    public int getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(int gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    @Basic
    @Temporal(TemporalType.DATE)
    @Column(name = "NgaySinh")
    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    @Basic
    @Column(name = "Sdt")
    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    @Basic
    @Column(name = "TaiKhoan")
    public String getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(String taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    @Basic
    @Column(name = "MatKhau")
    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    @Basic
    @Column(name = "NgayTao")
    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }

    @Basic
    @Column(name = "TrangThai")
    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        NhanVien nhanVien = (NhanVien) o;
        return gioiTinh == nhanVien.gioiTinh && trangThai == nhanVien.trangThai && Objects.equals(id, nhanVien.id) && Objects.equals(hoTen, nhanVien.hoTen) && Objects.equals(ngaySinh, nhanVien.ngaySinh) && Objects.equals(sdt, nhanVien.sdt) && Objects.equals(taiKhoan, nhanVien.taiKhoan) && Objects.equals(matKhau, nhanVien.matKhau) && Objects.equals(ngayTao, nhanVien.ngayTao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, hoTen, gioiTinh, ngaySinh, sdt, taiKhoan, matKhau, ngayTao, trangThai);
    }

    @ManyToOne
    @JoinColumn(name = "IdChucVu", referencedColumnName = "Id", nullable = false)
    public ChucVu getIdChucVu() {
        return idChucVu;
    }

    public void setIdChucVu(ChucVu chucVuByIdChucVu) {
        this.idChucVu = chucVuByIdChucVu;
    }
}
