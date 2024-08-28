package com.example.food_order.repositories;

import com.example.food_order.entities.MonAn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MonAnRepository extends JpaRepository<MonAn, String> {
    public static final int HOAT_DONG  = 1;
    public static final int DUNG_HOAT_DONG  = 0;

    @Query("select ma from MonAn ma where ma.trangThai = ?1")
    List<MonAn> getAllByTrangThai(int trangThai);
}
