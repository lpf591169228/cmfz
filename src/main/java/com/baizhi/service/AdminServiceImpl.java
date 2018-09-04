package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lenovo on 2018/9/4.
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminDao adminDao;


    @Override
    public boolean login(Admin admin) {

        Admin admin1 = adminDao.select(admin);

        if (admin1 != null) {
            return true;
        } else {
            return false;
        }

    }

    @Override
    public void regist(Admin admin) {
        adminDao.insert(admin);
    }
}
