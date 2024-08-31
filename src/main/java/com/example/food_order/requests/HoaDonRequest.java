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
public class HoaDonRequest {
    private String id;
    private String ma;
    private BigDecimal tongTien;
    private LocalDateTime ngayTao;
    private LocalDateTime ngayThanhToan;
    private int trangThai;
    private String idNhanVien;
    private String idBan;
}
