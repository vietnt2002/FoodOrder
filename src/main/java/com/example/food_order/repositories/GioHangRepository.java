package com.example.food_order.repositories;

import com.example.food_order.entities.GioHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GioHangRepository extends JpaRepository<GioHang, String> {
    public static final int CHO_GUI_MON  = 0;
    public static final int DA_GUI_MON  = 1;

    @Query("select sum(gh.soLuong) from GioHang gh where gh.idBan.id = ?1 and gh.trangThai = ?2")
    Integer getSoLuongGioHang(String idBan, int trangThai);

    @Query("select gh from GioHang gh where gh.idMonAn.id = ?1")
    GioHang findByIdMonAn(String idMonAn);

    @Query("select gh from GioHang gh where gh.idBan.id = ?1 and gh.idMonAn.id = ?2 and gh.trangThai = ?3")
    GioHang findByIdBanAndIdMonAn(String idBan, String idMonAn, int trangThai);

    @Query("select gh from GioHang gh where gh.idBan.id = ?1 and gh.trangThai = 0")
    List<GioHang> getAllByIdBan(String idBan);
}
