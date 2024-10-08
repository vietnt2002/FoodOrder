package com.example.food_order.requests;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
//@JsonTypeInfo(use = JsonTypeInfo.Id.CLASS, include = JsonTypeInfo.As.PROPERTY, property = "@MonAnRequest")
public class MonAnRequest {
    private String id;
    private String hinhAnh;
    private String tenMon;
    private BigDecimal giaTien;
    private String moTa;
    private LocalDateTime ngayTao;
    private int trangThai;
    private String idDanhMuc;
}
