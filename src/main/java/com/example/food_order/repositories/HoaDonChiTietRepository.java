package com.example.food_order.repositories;

import com.example.food_order.entities.GioHang;
import com.example.food_order.entities.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, String> {
    public static final int CHUA_THANH_TOAN = 0;
    public static final int DA_THANH_TOAN  = 1;

//    @Query("select sum(hdct.soLuong) from HoaDonChiTiet hdct where hdct.idHoaDon.idBan.id = ?1 and hdct.trangThai = ?2")
//    Integer getSoLuongGioHang(String idBan, int trangThai);
//
//    @Query("select hdct from HoaDonChiTiet hdct where hdct.idHoaDon.idBan.id = ?1 and hdct.trangThai = 0")
//    List<HoaDonChiTiet> getAllByIdBan(String idBan);
//
    @Query("select hdct from HoaDonChiTiet hdct where hdct.idMonAn.id = ?1 and hdct.trangThai = ?2")
    HoaDonChiTiet findByIdMonAnAndTrangThai(String idMonAn, int trangThai);

}
