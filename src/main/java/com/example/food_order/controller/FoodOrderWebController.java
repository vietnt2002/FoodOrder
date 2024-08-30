package com.example.food_order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("client")
public class FoodOrderWebController {

    @GetMapping("trang-chu")
    public String getTrangChu (){
        return "/view_web/trang-chu.jsp";
    }

    @GetMapping("menu")
    public String getMenu (){
        return "/view_web/menu.jsp";
    }

    @GetMapping("gio-hang")
    public String getGioHang (){
        return "/view_web/gio-hang.jsp";
    }
}
