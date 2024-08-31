package com.example.food_order.repositories;

import com.example.food_order.entities.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, String> {
    public static final int CHO_XAC_NHAN  = 0;
    public static final int DANG_CHUAN_BI  = 1;
    public static final int HOAN_THANH_MON  = 2;
    public static final int DA_THANH_TOAN  = 3;

    @Query(value = "SELECT COUNT(*) FROM HoaDon",nativeQuery = true)
    Integer getSoLuongHoaDon();

    @Query("select hd from HoaDon hd where hd.idBan.id = ?1 and hd.trangThai = ?2")
    HoaDon findByIdBanAndTrangThai(String idBan, int trangThai);

    @Query("select hd from HoaDon hd order by hd.trangThai asc ")
    List<HoaDon> getAllHoaDon();

    @Query("select hd from HoaDon hd where hd.trangThai = ?1")
    List<HoaDon> getHoaDonByTrangThai(int trangThai);
}
