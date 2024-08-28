package com.example.food_order.requests;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DanhMucMonAnRequest {
    private String id;
    private String tenDanhMuc;
    private LocalDateTime ngayTao;
    private int trangThai;
}
