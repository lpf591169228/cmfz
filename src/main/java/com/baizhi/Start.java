package com.baizhi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Created by lenovo on 2018/9/4.
 */

@SpringBootApplication
@MapperScan("com.baizhi.dao")
public class Start {
    public static void main(String[] args) {
        SpringApplication.run(Start.class, args);
    }
}
