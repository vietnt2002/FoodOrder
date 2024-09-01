package com.example.food_order.restcontroller;

import com.example.food_order.entities.*;
import com.example.food_order.repositories.*;
import com.example.food_order.requests.*;
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
@JsonDeserialize(contentAs = FoodOrderAdminRestController.class)
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
    @Autowired
    GioHangRepository gioHangRepo;
    @Value("src/main/webapp/images")
    private String fileUpload;


    @GetMapping("list-nhan-vien")
    ResponseEntity<List<NhanVien>> getAllNhanVien() {
        return ResponseEntity.ok(nhanVienRepo.getAllNhanVienByTrangThai(NhanVienRepository.DANG_LAM_VIEC));
    }

    //Danh mục món ăn
    @GetMapping("list-danh-muc")
    ResponseEntity<List<DanhMucMonAn>> getAllDanhMuc() {
        return ResponseEntity.ok(danhMucMonAnRepo.findAll());
    }

    @GetMapping("list-danh-muc-hoat-dong")
    ResponseEntity<List<DanhMucMonAn>> getAllDanhMucByTrangThai() {
        return ResponseEntity.ok(danhMucMonAnRepo.getAllByTrangThai(DanhMucMonAnRepository.HOAT_DONG));
    }

    @GetMapping("chi-tiet-danh-muc/{id}")
    ResponseEntity<DanhMucMonAn> danhMucDetail(@PathVariable("id") String id) {
        return ResponseEntity.ok(danhMucMonAnRepo.findById(id).get());
    }

    @PostMapping("them-danh-muc")
    ResponseEntity<DanhMucMonAn> themDanhMuc(@RequestBody DanhMucMonAnRequest danhMucMonAnRequest) {
        DanhMucMonAn danhMucMonAn = new DanhMucMonAn();
        danhMucMonAn.setTenDanhMuc(danhMucMonAnRequest.getTenDanhMuc());
        danhMucMonAn.setNgayTao(LocalDateTime.now());
        danhMucMonAn.setTrangThai(DanhMucMonAnRepository.HOAT_DONG);
        return ResponseEntity.ok(danhMucMonAnRepo.save(danhMucMonAn));
    }

    @PutMapping("sua-danh-muc/{id}")
    ResponseEntity<DanhMucMonAn> suaDanhMuc(@PathVariable("id") String id, @RequestBody DanhMucMonAnRequest danhMucMonAnRequest) {
        DanhMucMonAn danhMucMonAn = danhMucMonAnRepo.findById(danhMucMonAnRequest.getId()).get();
        danhMucMonAn.setTenDanhMuc(danhMucMonAnRequest.getTenDanhMuc());
        danhMucMonAn.setTrangThai(danhMucMonAnRequest.getTrangThai());
        return ResponseEntity.ok(danhMucMonAnRepo.save(danhMucMonAn));
    }

    @DeleteMapping("xoa-danh-muc/{id}")
    ResponseEntity<DanhMucMonAn> xoaDanhMuc(@PathVariable("id") String id) {
        DanhMucMonAn danhMucMonAn = danhMucMonAnRepo.findById(id).get();
        danhMucMonAnRepo.delete(danhMucMonAn);
        return ResponseEntity.ok(danhMucMonAn);
    }


    //Món ăn
    @GetMapping("list-mon-an")
    ResponseEntity<List<MonAn>> getAllMonAn() {
        return ResponseEntity.ok(monAnRepo.findAll());
    }

    @GetMapping("list-mon-an-hoat-dong")
    ResponseEntity<List<MonAn>> getAllMonAnHoatDong() {
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
    ) {
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
    ) {
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
        if (hinhAnh == null) {
            monAn.setHinhAnh(monAnRequest.getHinhAnh());
        } else {
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
    ResponseEntity<MonAn> xoaMonAn(@PathVariable("id") String id) {
        MonAn monAn = monAnRepo.findById(id).get();
        monAnRepo.delete(monAn);
        return ResponseEntity.ok(monAn);
    }

    //Bàn
    @GetMapping("list-ban")
    ResponseEntity<List<Ban>> getAllBan() {
        return ResponseEntity.ok(banRepo.findAll());
    }

    @GetMapping("list-ban-hoat-dong")
    ResponseEntity<List<Ban>> getAllBanByTrangThai() {
        return ResponseEntity.ok(banRepo.getAllByTrangThai(BanRepository.HOAT_DONG));
    }

    @GetMapping("chi-tiet-ban/{id}")
    ResponseEntity<Ban> banDetail(@PathVariable("id") String id) {
        return ResponseEntity.ok(banRepo.findById(id).get());
    }

    @PostMapping("them-ban")
    ResponseEntity<Ban> themBan(@RequestBody BanRequest banRequest) {
        Ban ban = new Ban();
        ban.setTenBan(banRequest.getTenBan());
        ban.setQrCode(banRequest.getQrCode());
        ban.setUrl("http://localhost:8080/client/menu");
        ban.setNgayTao(LocalDateTime.now());
        ban.setTrangThai(BanRepository.HOAT_DONG);
        return ResponseEntity.ok(banRepo.save(ban));
    }

    @PutMapping("sua-ban/{id}")
    ResponseEntity<Ban> suaBan(@PathVariable("id") String id, @RequestBody BanRequest banRequest) {
        Ban ban = banRepo.findById(banRequest.getId()).get();
        ban.setTenBan(banRequest.getTenBan());
        ban.setQrCode(banRequest.getQrCode());
        ban.setTrangThai(banRequest.getTrangThai());
        return ResponseEntity.ok(banRepo.save(ban));
    }

    @DeleteMapping("xoa-ban/{id}")
    ResponseEntity<Ban> xoaBan(@PathVariable("id") String id) {
        Ban ban = banRepo.findById(id).get();
        banRepo.delete(ban);
        return ResponseEntity.ok(ban);
    }

    @GetMapping("find-by-ten-ban/{ten}")
    ResponseEntity<Ban> findByTen(@PathVariable("ten") int tenBan) {
        return ResponseEntity.ok(banRepo.findByTenBan(tenBan));
    }


    // Api web
    @GetMapping("get-so-luong-gio-hang/{idBan}")
    ResponseEntity<Integer> getSoLuongGioHang(@PathVariable("idBan") String idBan) {
        return ResponseEntity.ok(gioHangRepo.getSoLuongGioHang(idBan, GioHangRepository.CHO_GUI_MON));
    }

    @GetMapping("list-gio-hang-by-idBan/{idBan}")
    ResponseEntity<List<GioHang>> getAllGioHangByIdBan(@PathVariable("idBan") String idBan) {
        return ResponseEntity.ok(gioHangRepo.getAllByIdBan(idBan, GioHangRepository.CHO_GUI_MON));
    }

    @DeleteMapping("xoa-mon-an-khoi-gio-hang/{id}")
    ResponseEntity<GioHang> xoaMonAnKhoiGioHang(@PathVariable("id") String id) {
        GioHang gioHang = gioHangRepo.findById(id).get();
        gioHangRepo.delete(gioHang);
        return ResponseEntity.ok(gioHang);
    }

    @PostMapping("them-gio-hang")
    ResponseEntity<GioHang> themGioHang(@RequestBody GioHangRequest gioHangRequest) {
        Ban ban = banRepo.findById(gioHangRequest.getIdBan()).get();
        MonAn monAn = monAnRepo.findById(gioHangRequest.getIdMonAn()).get();

        GioHang gioHangCheck = gioHangRepo.findByIdBanAndIdMonAn(gioHangRequest.getIdBan(), gioHangRequest.getIdMonAn(), GioHangRepository.CHO_GUI_MON);
        if (gioHangCheck == null){
            GioHang gioHang = new GioHang();
            gioHang.setIdBan(ban);
            gioHang.setIdMonAn(monAn);
            gioHang.setSoLuong(gioHangRequest.getSoLuong());
            gioHang.setGiaTien(gioHangRequest.getGiaTien());
            gioHang.setNgayTao(LocalDateTime.now());
            gioHang.setTrangThai(GioHangRepository.CHO_GUI_MON);
            return ResponseEntity.ok(gioHangRepo.save(gioHang));
        }else {
            gioHangCheck.setSoLuong(gioHangCheck.getSoLuong() + gioHangRequest.getSoLuong());
            return ResponseEntity.ok(gioHangRepo.save(gioHangCheck));
        }

    }

    @PutMapping("dat-mon")
    ResponseEntity<Void> datMon(@RequestBody GioHangRequest gioHangRequest) {

        System.out.println("========================================idNV: "+gioHangRequest.getIdNhanVien());
        System.out.println("========================================idBan: "+gioHangRequest.getIdBan());
        System.out.println("========================================idMonAn: "+gioHangRequest.getIdMonAn());

        List<GioHang> listGioHang = gioHangRepo.getAllByIdBan(gioHangRequest.getIdBan(), GioHangRepository.CHO_GUI_MON);

        NhanVien nhanVien = nhanVienRepo.findById(gioHangRequest.getIdNhanVien()).get();
        Ban ban = banRepo.findById(gioHangRequest.getIdBan()).get();

        HoaDon hoaDonTrangThai1 = hoaDonRepo.findByIdBanAndTrangThai(gioHangRequest.getIdBan(), HoaDonRepository.CHO_XAC_NHAN);
        HoaDon hoaDonTrangThai2 = hoaDonRepo.findByIdBanAndTrangThai(gioHangRequest.getIdBan(), HoaDonRepository.DANG_CHUAN_BI);
        HoaDon hoaDonTrangThai3 = hoaDonRepo.findByIdBanAndTrangThai(gioHangRequest.getIdBan(), HoaDonRepository.HOAN_THANH_MON);
        if (hoaDonTrangThai1 == null && hoaDonTrangThai2 == null && hoaDonTrangThai3 == null){
            HoaDon hoaDon = new HoaDon();
            hoaDon.setIdNhanVien(nhanVien);
            hoaDon.setIdBan(ban);
            hoaDon.setMa("HDFOOD" + (hoaDonRepo.getSoLuongHoaDon() + 100));
            hoaDon.setNgayTao(LocalDateTime.now());
            hoaDon.setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
            hoaDonRepo.save(hoaDon);

            for (GioHang gioHang : listGioHang){
                MonAn monAn = monAnRepo.findById(gioHang.getIdMonAn().getId()).get();
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setIdHoaDon(hoaDon);
                hoaDonChiTiet.setIdMonAn(monAn);
                hoaDonChiTiet.setSoLuong(gioHang.getSoLuong());
                hoaDonChiTiet.setGiaTien(gioHang.getGiaTien());
                hoaDonChiTiet.setNgayTao(LocalDateTime.now());
                hoaDonChiTiet.setTrangThai(HoaDonChiTietRepository.CHUA_HOAN_THANH);
                hoaDonChiTietRepo.save(hoaDonChiTiet);
            }
        }else {
            for (GioHang gioHang : listGioHang){
                MonAn monAn = monAnRepo.findById(gioHang.getIdMonAn().getId()).get();
                HoaDonChiTiet hoaDonChiTietCheck = hoaDonChiTietRepo.findByIdMonAnAndTrangThai(monAn.getId(), HoaDonChiTietRepository.CHUA_HOAN_THANH);
                if (hoaDonChiTietCheck == null){
                    HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                    if (hoaDonTrangThai1 == null && hoaDonTrangThai2 == null){
                        hoaDonChiTiet.setIdHoaDon(hoaDonTrangThai3);
                    }else if (hoaDonTrangThai2 == null && hoaDonTrangThai3 == null){
                        hoaDonChiTiet.setIdHoaDon(hoaDonTrangThai1);
                    }else if (hoaDonTrangThai1 == null && hoaDonTrangThai3 == null){
                        hoaDonChiTiet.setIdHoaDon(hoaDonTrangThai2);
                    }
                    hoaDonChiTiet.setIdMonAn(monAn);
                    hoaDonChiTiet.setSoLuong(gioHang.getSoLuong());
                    hoaDonChiTiet.setGiaTien(gioHang.getGiaTien());
                    hoaDonChiTiet.setNgayTao(LocalDateTime.now());
                    hoaDonChiTiet.setTrangThai(HoaDonChiTietRepository.CHUA_HOAN_THANH);
                    hoaDonChiTietRepo.save(hoaDonChiTiet);

                    hoaDonChiTiet.getIdHoaDon().setTrangThai(HoaDonRepository.CHO_XAC_NHAN);
                    hoaDonRepo.save(hoaDonChiTiet.getIdHoaDon());
                }else {
                    hoaDonChiTietCheck.setSoLuong(hoaDonChiTietCheck.getSoLuong() + gioHang.getSoLuong());
                    hoaDonChiTietRepo.save(hoaDonChiTietCheck);
                }
            }
        }

        for (GioHang gioHang : listGioHang){
            gioHang.setTrangThai(GioHangRepository.DA_GUI_MON);
            gioHangRepo.save(gioHang);
        }

        return ResponseEntity.ok().build();
    }


    @GetMapping("get-all-hoa-don")
    ResponseEntity<List<HoaDon>> getAllHoaDon() {
        return ResponseEntity.ok(hoaDonRepo.getAllHoaDon());
    }

    @GetMapping("get-hoa-don-xac-nhan")
    ResponseEntity<List<HoaDon>> getHoaDonXacNhan() {
        return ResponseEntity.ok(hoaDonRepo.getHoaDonByTrangThai(HoaDonRepository.CHO_XAC_NHAN));
    }

    @GetMapping("get-hoa-don-dang-chuan-bi")
    ResponseEntity<List<HoaDon>> getHoaDonDangChuanBi() {
        return ResponseEntity.ok(hoaDonRepo.getHoaDonByTrangThai(HoaDonRepository.DANG_CHUAN_BI));
    }

    @GetMapping("get-hoa-don-hoan-thanh-mon")
    ResponseEntity<List<HoaDon>> getHoaDonHoanThanh() {
        return ResponseEntity.ok(hoaDonRepo.getHoaDonByTrangThai(HoaDonRepository.HOAN_THANH_MON));
    }

    @GetMapping("get-hoa-don-da-thanh-toan")
    ResponseEntity<List<HoaDon>> getHoaDonDaThanhToan() {
        return ResponseEntity.ok(hoaDonRepo.getHoaDonByTrangThai(HoaDonRepository.DA_THANH_TOAN));
    }

    @GetMapping("get-mon-an-da-goi/{idHoaDon}")
    ResponseEntity<List<HoaDonChiTiet>> getMonAnDaGoi(@PathVariable("idHoaDon") String idHoaDon) {
        return ResponseEntity.ok(hoaDonChiTietRepo.getHoaDonChiTietByIdHoaDon(idHoaDon));
    }

    @GetMapping("find-hoa-don-by-id/{idHoaDon}")
    ResponseEntity<HoaDon> getHoaDon(@PathVariable("idHoaDon") String idHoaDon) {
        return ResponseEntity.ok(hoaDonRepo.findById(idHoaDon).get());
    }

    @GetMapping("cap-nhat-trang-thai/{idHoaDon}")
    ResponseEntity<HoaDon> capNhatTrangThai(@PathVariable("idHoaDon") String idHoaDon) {
        HoaDon hoaDon = hoaDonRepo.findById(idHoaDon).get();
        if (hoaDon.getTrangThai() == HoaDonRepository.CHO_XAC_NHAN){
            hoaDon.setTrangThai(HoaDonRepository.DANG_CHUAN_BI);
        }else if (hoaDon.getTrangThai() == HoaDonRepository.DANG_CHUAN_BI){
            hoaDon.setTrangThai(HoaDonRepository.HOAN_THANH_MON);
            List<HoaDonChiTiet> listHDCTByIdHD = hoaDonChiTietRepo.getHoaDonChiTietByIdHoaDon(hoaDon.getId());
            for (HoaDonChiTiet hoaDonChiTiet : listHDCTByIdHD){
                hoaDonChiTiet.setTrangThai(HoaDonChiTietRepository.DA_HOAN_THANH);
                hoaDonChiTietRepo.save(hoaDonChiTiet);
            }
        }
        return ResponseEntity.ok(hoaDonRepo.save(hoaDon));
    }

    @PutMapping("thanh-toan")
    ResponseEntity<HoaDon> thanhToan(@RequestBody HoaDonRequest hoaDonRequest) {
        List<HoaDonChiTiet> listHDCTByIdHD = hoaDonChiTietRepo.getHoaDonChiTietByIdHoaDon(hoaDonRequest.getId());
        for (HoaDonChiTiet hoaDonChiTiet : listHDCTByIdHD){
            hoaDonChiTiet.setTrangThai(HoaDonChiTietRepository.DA_THANH_TOAN);
            hoaDonChiTietRepo.save(hoaDonChiTiet);
        }

        HoaDon hoaDon = hoaDonRepo.findById(hoaDonRequest.getId()).get();
        hoaDon.setTongTien(hoaDonRequest.getTongTien());
        hoaDon.setNgayThanhToan(LocalDateTime.now());
        hoaDon.setTrangThai(HoaDonRepository.DA_THANH_TOAN);

        return ResponseEntity.ok(hoaDonRepo.save(hoaDon));
    }

    @GetMapping("get-so-luong-hoa-don-tat-ca")
    ResponseEntity<Integer> getSoLuongHoaDonTatCa() {
        return ResponseEntity.ok(hoaDonRepo.getSoLuongHoaDon());
    }

    @GetMapping("get-so-luong-hoa-don-xac-nhan")
    ResponseEntity<Integer> getSoLuongHoaDonXacNhan() {
        return ResponseEntity.ok(hoaDonRepo.getSoLuongHoaDonByTrangThai(HoaDonRepository.CHO_XAC_NHAN));
    }

    @GetMapping("get-so-luong-hoa-don-dang-chuan-bi")
    ResponseEntity<Integer> getSoLuongHoaDonDangChuanBi() {
        return ResponseEntity.ok(hoaDonRepo.getSoLuongHoaDonByTrangThai(HoaDonRepository.DANG_CHUAN_BI));
    }

    @GetMapping("get-so-luong-hoa-don-hoan-thanh")
    ResponseEntity<Integer> getSoLuongHoaDonHoanThanh() {
        return ResponseEntity.ok(hoaDonRepo.getSoLuongHoaDonByTrangThai(HoaDonRepository.HOAN_THANH_MON));
    }

    @GetMapping("get-so-luong-hoa-don-da-thanh-toan")
    ResponseEntity<Integer> getSoLuongHoaDonDaThanhToan() {
        return ResponseEntity.ok(hoaDonRepo.getSoLuongHoaDonByTrangThai(HoaDonRepository.DA_THANH_TOAN));
    }

}




