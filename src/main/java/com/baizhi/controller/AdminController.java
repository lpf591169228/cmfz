package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lenovo on 2018/9/4.
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @RequestMapping("/login.do")
    public String login(Admin admin) {
        boolean login = adminService.login(admin);
        if (login) {
            return "/main/main";
        } else {
            return "login";
        }

    }
}
