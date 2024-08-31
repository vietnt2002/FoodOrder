package com.example.food_order.requests;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HoaDonChiTietRequest {
    private String id;
    private int soLuong;
    private BigDecimal giaTien;
    private LocalDateTime ngayTao;
    private int trangThai;
    private String idHoaDon;
    private String idMonAn;
}
