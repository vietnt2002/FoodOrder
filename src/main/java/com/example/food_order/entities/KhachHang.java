package com.example.food_order.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "KhachHang")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class KhachHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaKhachHang")
    private Integer maKhachHang;

    @Column(name = "TenKhachHang")
    private String tenKhachHang;

    @Column(name = "SoDienThoai")
    private String sdt;

    @Column(name = "GioiTinh")
    private Integer gioiTinh;

    @ManyToOne
    @JoinColumn(name = "HangKhachHang")
    private HangKhachHang hangKhachHang;
}
