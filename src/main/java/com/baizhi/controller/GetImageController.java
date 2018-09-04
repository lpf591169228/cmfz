package com.baizhi.controller;

import com.baizhi.util.SecurityCode;
import com.baizhi.util.SecurityImage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by lenovo on 2018/9/4.
 */

@Controller
@RequestMapping("/image")
public class GetImageController {

    @RequestMapping("/image.do")
    public void getImage(HttpServletResponse response, HttpSession session) {

        String code = SecurityCode.getSecurityCode();

        session.setAttribute("code", code);


        BufferedImage image = SecurityImage.createImage(code);

        try {
            ServletOutputStream out = response.getOutputStream();

            ImageIO.write(image, "jpg", out);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/code.do")
    @ResponseBody
    public String code(HttpSession session, String imagecode) {
        Object codes = session.getAttribute("code");

        if (imagecode == codes) {
            return "1";
        } else {
            return "2";
        }
    }
}
