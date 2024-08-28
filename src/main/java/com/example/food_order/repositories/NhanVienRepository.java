package com.example.food_order.repositories;

import com.example.food_order.entities.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, String> {

    @Query("select nv from NhanVien nv where nv.trangThai = 1")
    List<NhanVien> getAllNhanVien();
}
