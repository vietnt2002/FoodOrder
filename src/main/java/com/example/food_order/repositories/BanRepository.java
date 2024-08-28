package com.example.food_order.repositories;

import com.example.food_order.entities.Ban;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BanRepository extends JpaRepository<Ban, String> {
}
