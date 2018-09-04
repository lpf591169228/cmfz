package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by lenovo on 2018/9/4.
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;
    private Admin admin;

    @RequestMapping("/login.do")
    public ModelAndView login(Admin admin) {
        ModelAndView mv = new ModelAndView();

        boolean login = adminService.login(admin);
        if (login) {
            mv.setViewName("forward:/main/main.jsp");

            return mv;
        } else {

            mv.addObject("error", "用户名或密码错误");

            mv.setViewName("forward:/login.jsp");

            return mv;
        }

    }
}
