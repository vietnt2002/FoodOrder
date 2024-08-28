package com.example.food_order.repositories;

import com.example.food_order.entities.DanhMucMonAn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DanhMucMonAnRepository extends JpaRepository<DanhMucMonAn, String> {
    public static final int HOAT_DONG  = 1;
    public static final int DUNG_HOAT_DONG  = 0;

    @Query("select danhMuc from DanhMucMonAn danhMuc where danhMuc.trangThai = ?1")
    List<DanhMucMonAn> getAllByTrangThai(int trangThai);
}
