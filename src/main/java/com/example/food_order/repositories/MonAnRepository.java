package com.example.food_order.repositories;

import com.example.food_order.entities.MonAn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MonAnRepository extends JpaRepository<MonAn, String> {
}
