package com.example.food_order.requests;

import com.example.food_order.entities.Ban;
import com.example.food_order.entities.MonAn;
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
public class GioHangRequest {
    private String id;
    private int soLuong;
    private BigDecimal giaTien;
    private LocalDateTime ngayTao;
    private int trangThai;
    private String idBan;
    private String idMonAn;
    private String idNhanVien;
}
