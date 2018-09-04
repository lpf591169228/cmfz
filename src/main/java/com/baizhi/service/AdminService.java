package com.baizhi.service;

import com.baizhi.entity.Admin;

/**
 * Created by lenovo on 2018/9/4.
 */
public interface AdminService {
    //登陆
    public boolean login(Admin admin);

    //注册
    public void regist(Admin admin);
}
