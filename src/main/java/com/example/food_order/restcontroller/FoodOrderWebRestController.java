package com.example.food_order.restcontroller;

import com.example.food_order.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/web-client")
@CrossOrigin(origins = "*")
public class FoodOrderWebRestController {
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
}
