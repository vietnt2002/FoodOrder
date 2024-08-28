package com.example.food_order.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class DanhMucMonAn {
    private String id;
    private String tenDanhMuc;
    private LocalDateTime ngayTao;
    private int trangThai;

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
    @Column(name = "TenDanhMuc")
    public String getTenDanhMuc() {
        return tenDanhMuc;
    }

    public void setTenDanhMuc(String tenDanhMuc) {
        this.tenDanhMuc = tenDanhMuc;
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
        DanhMucMonAn that = (DanhMucMonAn) o;
        return trangThai == that.trangThai && Objects.equals(id, that.id) && Objects.equals(tenDanhMuc, that.tenDanhMuc) && Objects.equals(ngayTao, that.ngayTao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, tenDanhMuc, ngayTao, trangThai);
    }
}
