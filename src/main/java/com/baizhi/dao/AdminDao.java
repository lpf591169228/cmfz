package com.baizhi.dao;

import com.baizhi.entity.Admin;

/**
 * Created by lenovo on 2018/9/4.
 */
public interface AdminDao {


    public Admin select(Admin admin);


    public void insert(Admin admin);

}
