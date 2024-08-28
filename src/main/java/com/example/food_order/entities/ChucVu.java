package com.example.food_order.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class ChucVu {
    private String id;
    private String ten;
    private LocalDateTime ngayTao;
    private Integer trangThai;

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
    @Column(name = "Ten")
    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
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
    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChucVu chucVu = (ChucVu) o;
        return Objects.equals(id, chucVu.id) && Objects.equals(ten, chucVu.ten) && Objects.equals(ngayTao, chucVu.ngayTao) && Objects.equals(trangThai, chucVu.trangThai);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, ten, ngayTao, trangThai);
    }
}
