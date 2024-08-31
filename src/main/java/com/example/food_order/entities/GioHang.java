package com.example.food_order.entities;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class GioHang {
    private String id;
    private int soLuong;
    private BigDecimal giaTien;
    private LocalDateTime ngayTao;
    private int trangThai;
    private Ban idBan;
    private MonAn idMonAn;

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
    @Column(name = "SoLuong")
    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
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
        GioHang gioHang = (GioHang) o;
        return soLuong == gioHang.soLuong && giaTien == gioHang.giaTien && trangThai == gioHang.trangThai && Objects.equals(id, gioHang.id) && Objects.equals(ngayTao, gioHang.ngayTao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, soLuong, giaTien, ngayTao, trangThai);
    }

    @ManyToOne
    @JoinColumn(name = "IdBan", referencedColumnName = "Id", nullable = false)
    public Ban getIdBan() {
        return idBan;
    }

    public void setIdBan(Ban banByIdBan) {
        this.idBan = banByIdBan;
    }

    @ManyToOne
    @JoinColumn(name = "IdMonAn", referencedColumnName = "Id", nullable = false)
    public MonAn getIdMonAn() {
        return idMonAn;
    }

    public void setIdMonAn(MonAn monAnByIdMonAn) {
        this.idMonAn = monAnByIdMonAn;
    }
}
