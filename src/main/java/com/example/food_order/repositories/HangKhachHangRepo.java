package com.example.food_order.repositories;

import com.example.food_order.entities.HangKhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HangKhachHangRepo extends JpaRepository<HangKhachHang, Integer> {
}
