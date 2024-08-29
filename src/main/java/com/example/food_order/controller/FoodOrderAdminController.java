package com.example.food_order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class FoodOrderAdminController {

    @GetMapping("dang-nhap-view")
    public String getDangNhap (){
        return "/view_admin/dang-nhap.jsp";
    }

    @GetMapping("trang-chu")
    public String getTrangChu (){
        return "/view_admin/trang-chu.jsp";
    }

    @GetMapping("quan-ly-danh-muc")
    public String getDanhMuc (){
        return "/view_admin/danh-muc-quan-ly-ban.jsp";
    }

    @GetMapping("quan-ly-ban")
    public String getBan (){
        return "/view_admin/quan-ly-ban.jsp";
    }

    @GetMapping("quan-ly-goi-mon")
    public String getGoiMon (){
        return "/view_admin/quan-ly-goi-mon.jsp";
    }

}
