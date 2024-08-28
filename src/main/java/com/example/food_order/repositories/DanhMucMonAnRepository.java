package com.example.food_order.repositories;

import com.example.food_order.entities.DanhMucMonAn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DanhMucMonAnRepository extends JpaRepository<DanhMucMonAn, String> {
}
