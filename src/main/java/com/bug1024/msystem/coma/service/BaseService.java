package com.bug1024.msystem.coma.service;



import com.bug1024.msystem.entity.Base;

import java.util.List;


/**
 * 定义处理com.bug1024.msystem.entity.Base信息的service
 */
public interface BaseService {


    public List baseList(Integer nowPage,Integer limit);
    public void baseAdd(Base base);
    public Base selectOne(String bno);
    public void baseDelete(String bno);
    public void baseUpdate(Base base);
    public Integer getAllNum();
}
