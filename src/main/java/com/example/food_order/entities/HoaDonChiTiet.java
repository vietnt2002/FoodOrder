package com.example.food_order.entities;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class HoaDonChiTiet {
    private String id;
    private int soLuong;
    private BigDecimal giaTien;
    private LocalDateTime ngayTao;
    private int trangThai;
    private HoaDon idHoaDon;
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
        HoaDonChiTiet that = (HoaDonChiTiet) o;
        return soLuong == that.soLuong && giaTien == that.giaTien && trangThai == that.trangThai && Objects.equals(id, that.id) && Objects.equals(ngayTao, that.ngayTao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, soLuong, giaTien, ngayTao, trangThai);
    }

    @ManyToOne
    @JoinColumn(name = "IdHoaDon", referencedColumnName = "Id", nullable = false)
    public HoaDon getIdHoaDon() {
        return idHoaDon;
    }

    public void setIdHoaDon(HoaDon hoaDonByIdHoaDon) {
        this.idHoaDon = hoaDonByIdHoaDon;
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
