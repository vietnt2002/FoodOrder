package com.example.food_order.entities;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class MonAn {
    private String id;
    private String hinhAnh;
    private String tenMon;
    private BigDecimal giaTien;
    private String moTa;
    private LocalDateTime ngayTao;
    private int trangThai;
    private DanhMucMonAn idDanhMuc;

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
    @Column(name = "HinhAnh")
    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    @Basic
    @Column(name = "TenMon")
    public String getTenMon() {
        return tenMon;
    }

    public void setTenMon(String tenMon) {
        this.tenMon = tenMon;
    }

    @Basic
    @Column(name = "GiaTien")
    public BigDecimal getGiaTien() {
        return giaTien;
    }

    public void setGiaTien(BigDecimal giaTien) {
        this.giaTien = giaTien;
    }

    @Basic
    @Column(name = "MoTa")
    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
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
        MonAn monAn = (MonAn) o;
        return giaTien == monAn.giaTien && trangThai == monAn.trangThai && Objects.equals(id, monAn.id) && Objects.equals(hinhAnh, monAn.hinhAnh) && Objects.equals(tenMon, monAn.tenMon) && Objects.equals(moTa, monAn.moTa) && Objects.equals(ngayTao, monAn.ngayTao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, hinhAnh, tenMon, giaTien, moTa, ngayTao, trangThai);
    }

    @ManyToOne
    @JoinColumn(name = "IdDanhMuc", referencedColumnName = "Id", nullable = false)
    public DanhMucMonAn getIdDanhMuc() {
        return idDanhMuc;
    }

    public void setIdDanhMuc(DanhMucMonAn danhMucMonAnByIdDanhMuc) {
        this.idDanhMuc = danhMucMonAnByIdDanhMuc;
    }
}
