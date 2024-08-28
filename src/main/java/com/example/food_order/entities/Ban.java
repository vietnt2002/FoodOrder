package com.example.food_order.entities;

import jakarta.persistence.*;
import org.springframework.web.bind.annotation.GetMapping;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
public class Ban {
    private String id;
    private String tenBan;
    private String qrCode;
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
    @Column(name = "TenBan")
    public String getTenBan() {
        return tenBan;
    }

    public void setTenBan(String tenBan) {
        this.tenBan = tenBan;
    }

    @Basic
    @Column(name = "QRCode")
    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
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
        Ban ban = (Ban) o;
        return trangThai == ban.trangThai && Objects.equals(id, ban.id) && Objects.equals(tenBan, ban.tenBan) && Objects.equals(qrCode, ban.qrCode) && Objects.equals(ngayTao, ban.ngayTao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, tenBan, qrCode, ngayTao, trangThai);
    }
}
