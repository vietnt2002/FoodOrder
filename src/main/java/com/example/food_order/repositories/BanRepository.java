package com.example.food_order.repositories;

import com.example.food_order.entities.Ban;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BanRepository extends JpaRepository<Ban, String> {
    public static final int HOAT_DONG  = 1;
    public static final int DUNG_HOAT_DONG  = 0;

    @Query("select b from Ban b where b.trangThai = ?1")
    List<Ban> getAllByTrangThai(int trangThai);
}
