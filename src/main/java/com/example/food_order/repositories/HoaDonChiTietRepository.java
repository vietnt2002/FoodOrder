package com.example.food_order.repositories;

import com.example.food_order.entities.GioHang;
import com.example.food_order.entities.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, String> {
    public static final int CHUA_HOAN_THANH = 0;
    public static final int DA_HOAN_THANH  = 1;
    public static final int DA_THANH_TOAN  = 2;

    @Query("select hdct from HoaDonChiTiet hdct where hdct.idMonAn.id = ?1 and hdct.trangThai = ?2")
    HoaDonChiTiet findByIdMonAnAndTrangThai(String idMonAn, int trangThai);

    @Query("select hdct from HoaDonChiTiet hdct where hdct.idHoaDon.id = ?1")
    List<HoaDonChiTiet> getHoaDonChiTietByIdHoaDon(String idHoaDon);


}
