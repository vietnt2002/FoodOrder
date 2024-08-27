package com.example.food_order.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "HangKhachHang")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor


public class HangKhachHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaHang")
    private Integer maHang;

    @Column(name = "TenHang")
    private String tenHang;
}
