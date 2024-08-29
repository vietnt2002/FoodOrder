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
public class BanRequest {
    private String id;
    private int tenBan;
    private String qrCode;
    private LocalDateTime ngayTao;
    private int trangThai;
}
