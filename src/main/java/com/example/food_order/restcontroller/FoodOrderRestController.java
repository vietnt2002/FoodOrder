package com.example.food_order.restcontroller;

import com.example.food_order.entities.NhanVien;
import com.example.food_order.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/food")
@CrossOrigin(origins = "*")
public class FoodOrderRestController {
    @Autowired
    BanRepository banRepo;
    @Autowired
    DanhMucMonAnRepository danhMucMonAnRepo;
    @Autowired
    HoaDonRepository hoaDonRepo;
    @Autowired
    HoaDonChiTietRepository hoaDonChiTietRepo;
    @Autowired
    MonAnRepository monAnRepo;
    @Autowired
    NhanVienRepository nhanVienRepo;


    @GetMapping("list-nhan-vien")
    ResponseEntity<List<NhanVien>> getAllNhanVien(){
        return ResponseEntity.ok(nhanVienRepo.getAllNhanVien());
    }
}
