package com.example.food_order.restcontroller;

import com.example.food_order.entities.Ban;
import com.example.food_order.entities.DanhMucMonAn;
import com.example.food_order.entities.MonAn;
import com.example.food_order.entities.NhanVien;
import com.example.food_order.repositories.*;
import com.example.food_order.requests.BanRequest;
import com.example.food_order.requests.DanhMucMonAnRequest;
import com.example.food_order.requests.MonAnRequest;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("api/food")
@CrossOrigin(origins = "*")
@JsonDeserialize(contentAs= FoodOrderAdminRestController.class)
public class FoodOrderAdminRestController {
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
    @Value("src/main/webapp/images")
    private String fileUpload;


    @GetMapping("list-nhan-vien")
    ResponseEntity<List<NhanVien>> getAllNhanVien(){
        return ResponseEntity.ok(nhanVienRepo.getAllNhanVienByTrangThai(NhanVienRepository.DANG_LAM_VIEC));
    }

    //Danh mục món ăn
    @GetMapping("list-danh-muc")
    ResponseEntity<List<DanhMucMonAn>> getAllDanhMuc(){
        return ResponseEntity.ok(danhMucMonAnRepo.findAll());
    }

    @GetMapping("list-danh-muc-hoat-dong")
    ResponseEntity<List<DanhMucMonAn>> getAllDanhMucByTrangThai(){
        return ResponseEntity.ok(danhMucMonAnRepo.getAllByTrangThai(DanhMucMonAnRepository.HOAT_DONG));
    }

    @GetMapping("chi-tiet-danh-muc/{id}")
    ResponseEntity<DanhMucMonAn> danhMucDetail(@PathVariable("id") String id) {
        return ResponseEntity.ok(danhMucMonAnRepo.findById(id).get());
    }

    @PostMapping("them-danh-muc")
    ResponseEntity<DanhMucMonAn> themDanhMuc(@RequestBody DanhMucMonAnRequest danhMucMonAnRequest){
        DanhMucMonAn danhMucMonAn = new DanhMucMonAn();
        danhMucMonAn.setTenDanhMuc(danhMucMonAnRequest.getTenDanhMuc());
        danhMucMonAn.setNgayTao(LocalDateTime.now());
        danhMucMonAn.setTrangThai(DanhMucMonAnRepository.HOAT_DONG);
        return ResponseEntity.ok(danhMucMonAnRepo.save(danhMucMonAn));
    }

    @PutMapping("sua-danh-muc/{id}")
    ResponseEntity<DanhMucMonAn> suaDanhMuc(@PathVariable("id") String id, @RequestBody DanhMucMonAnRequest danhMucMonAnRequest){
        DanhMucMonAn danhMucMonAn = danhMucMonAnRepo.findById(danhMucMonAnRequest.getId()).get();
        danhMucMonAn.setTenDanhMuc(danhMucMonAnRequest.getTenDanhMuc());
        danhMucMonAn.setTrangThai(danhMucMonAnRequest.getTrangThai());
        return ResponseEntity.ok(danhMucMonAnRepo.save(danhMucMonAn));
    }

    @DeleteMapping("xoa-danh-muc/{id}")
    ResponseEntity<DanhMucMonAn> xoaDanhMuc(@PathVariable("id") String id){
        DanhMucMonAn danhMucMonAn = danhMucMonAnRepo.findById(id).get();
        danhMucMonAnRepo.delete(danhMucMonAn);
        return ResponseEntity.ok(danhMucMonAn);
    }


    //Món ăn
    @GetMapping("list-mon-an")
    ResponseEntity<List<MonAn>> getAllMonAn(){
        return ResponseEntity.ok(monAnRepo.findAll());
    }

    @GetMapping("list-mon-an-hoat-dong")
    ResponseEntity<List<MonAn>> getAllMonAnHoatDong(){
        return ResponseEntity.ok(monAnRepo.getAllByTrangThai(MonAnRepository.HOAT_DONG));
    }

    @GetMapping("chi-tiet-mon-an/{id}")
    ResponseEntity<MonAn> monAnDetail(@PathVariable("id") String id) {
        return ResponseEntity.ok(monAnRepo.findById(id).get());
    }

    @PostMapping("them-mon-an")
    ResponseEntity<MonAn> themMonAn(
            @RequestPart("monAnRequest") MonAnRequest monAnRequest,
            @RequestPart("hinhAnh") MultipartFile hinhAnh
    ){
        DanhMucMonAn danhMucMonAn = danhMucMonAnRepo.findById(monAnRequest.getIdDanhMuc()).get();
        MonAn monAn = new MonAn();
        monAn.setIdDanhMuc(danhMucMonAn);
        try {
            //Lưu ảnh vào file chung
            if (hinhAnh != null && !hinhAnh.isEmpty()) {
                byte[] bytes = hinhAnh.getBytes();
                Path path = Paths.get(fileUpload + File.separator + hinhAnh.getOriginalFilename());
                Files.write(path, bytes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        monAn.setHinhAnh(hinhAnh.getOriginalFilename());
        monAn.setTenMon(monAnRequest.getTenMon());
        monAn.setGiaTien(monAnRequest.getGiaTien());
        monAn.setMoTa(monAnRequest.getMoTa());
        monAn.setNgayTao(LocalDateTime.now());
        monAn.setTrangThai(MonAnRepository.HOAT_DONG);
        return ResponseEntity.ok(monAnRepo.save(monAn));
    }

    @PutMapping("sua-mon-an/{id}")
    ResponseEntity<MonAn> suaMonAn(
            @PathVariable("id") String id,
            @RequestPart("monAnRequest") MonAnRequest monAnRequest,
            @RequestPart(value = "hinhAnh2", required = false) MultipartFile hinhAnh
    ){
        DanhMucMonAn danhMucMonAn = danhMucMonAnRepo.findById(monAnRequest.getIdDanhMuc()).get();
        MonAn monAn = monAnRepo.findById(id).get();
        monAn.setIdDanhMuc(danhMucMonAn);
        try {
            //Lưu ảnh vào file chung
            if (hinhAnh != null && !hinhAnh.isEmpty()) {
                byte[] bytes = hinhAnh.getBytes();
                Path path = Paths.get(fileUpload + File.separator + hinhAnh.getOriginalFilename());
                Files.write(path, bytes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (hinhAnh == null){
            monAn.setHinhAnh(monAnRequest.getHinhAnh());
        }else {
            monAn.setHinhAnh(hinhAnh.getOriginalFilename());
        }

        monAn.setTenMon(monAnRequest.getTenMon());
        monAn.setGiaTien(monAnRequest.getGiaTien());
        monAn.setMoTa(monAnRequest.getMoTa());
        monAn.setNgayTao(LocalDateTime.now());
        monAn.setTrangThai(monAnRequest.getTrangThai());
        return ResponseEntity.ok(monAnRepo.save(monAn));
    }

    @DeleteMapping("xoa-mon-an/{id}")
    ResponseEntity<MonAn> xoaMonAn(@PathVariable("id") String id){
        MonAn monAn = monAnRepo.findById(id).get();
        monAnRepo.delete(monAn);
        return ResponseEntity.ok(monAn);
    }

    //Bàn
    @GetMapping("list-ban")
    ResponseEntity<List<Ban>> getAllBan(){
        return ResponseEntity.ok(banRepo.findAll());
    }

    @GetMapping("list-ban-hoat-dong")
    ResponseEntity<List<Ban>> getAllBanByTrangThai(){
        return ResponseEntity.ok(banRepo.getAllByTrangThai(BanRepository.HOAT_DONG));
    }

    @GetMapping("chi-tiet-ban/{id}")
    ResponseEntity<Ban> banDetail(@PathVariable("id") String id) {
        return ResponseEntity.ok(banRepo.findById(id).get());
    }

    @PostMapping("them-ban")
    ResponseEntity<Ban> themBan(@RequestBody BanRequest banRequest){
        Ban ban = new Ban();
        ban.setTenBan(banRequest.getTenBan());
        ban.setQrCode(banRequest.getQrCode());
        ban.setUrl("http://localhost:8080/client/menu");
        ban.setNgayTao(LocalDateTime.now());
        ban.setTrangThai(BanRepository.HOAT_DONG);
        return ResponseEntity.ok(banRepo.save(ban));
    }

    @PutMapping("sua-ban/{id}")
    ResponseEntity<Ban> suaBan(@PathVariable("id") String id, @RequestBody BanRequest banRequest){
        Ban ban = banRepo.findById(banRequest.getId()).get();
        ban.setTenBan(banRequest.getTenBan());
        ban.setQrCode(banRequest.getQrCode());
        ban.setTrangThai(banRequest.getTrangThai());
        return ResponseEntity.ok(banRepo.save(ban));
    }

    @DeleteMapping("xoa-ban/{id}")
    ResponseEntity<Ban> xoaBan(@PathVariable("id") String id){
        Ban ban = banRepo.findById(id).get();
        banRepo.delete(ban);
        return ResponseEntity.ok(ban);
    }

    @GetMapping("find-by-ten-ban/{ten}")
    ResponseEntity<Ban> findByTen(@PathVariable("ten") int tenBan) {
        return ResponseEntity.ok(banRepo.findByTenBan(tenBan));
    }


}


// Api web

