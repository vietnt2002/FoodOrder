package com.example.food_order.entities;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class HoaDon {
    private String id;
    private String ma;
    private BigDecimal tongTien;
    private LocalDateTime ngayTao;
    private LocalDateTime ngayThanhToan;
    private int trangThai;
    private NhanVien idNhanVien;
    private Ban idBan;

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
    @Column(name = "Ma")
    public String getMa() {
        return ma;
    }

    public void setMa(String ma) {
        this.ma = ma;
    }

    @Basic
    @Column(name = "TongTien")
    public BigDecimal getTongTien() {
        return tongTien;
    }

    public void setTongTien(BigDecimal tongTien) {
        this.tongTien = tongTien;
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
    @Column(name = "NgayThanhToan")
    public LocalDateTime getNgayThanhToan() {
        return ngayThanhToan;
    }

    public void setNgayThanhToan(LocalDateTime ngayThanhToan) {
        this.ngayThanhToan = ngayThanhToan;
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
        HoaDon hoaDon = (HoaDon) o;
        return tongTien == hoaDon.tongTien && trangThai == hoaDon.trangThai && Objects.equals(id, hoaDon.id) && Objects.equals(ma, hoaDon.ma) && Objects.equals(ngayTao, hoaDon.ngayTao) && Objects.equals(ngayThanhToan, hoaDon.ngayThanhToan);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, ma, tongTien, ngayTao, ngayThanhToan, trangThai);
    }

    @ManyToOne
    @JoinColumn(name = "IdNhanVien", referencedColumnName = "Id", nullable = false)
    public NhanVien getIdNhanVien() {
        return idNhanVien;
    }

    public void setIdNhanVien(NhanVien nhanVienByIdNhanVien) {
        this.idNhanVien = nhanVienByIdNhanVien;
    }

    @ManyToOne
    @JoinColumn(name = "IdBan", referencedColumnName = "Id", nullable = false)
    public Ban getIdBan() {
        return idBan;
    }

    public void setIdBan(Ban banByIdBan) {
        this.idBan = banByIdBan;
    }
}
