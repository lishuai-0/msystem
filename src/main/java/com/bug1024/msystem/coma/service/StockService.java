package com.bug1024.msystem.coma.service;



import com.bug1024.msystem.entity.Stock;

import java.util.List;


/**
 * 定义处理com.bug1024.msystem.entity.Stock信息的service
 */
public interface StockService {


    public List stockList(Integer nowPage,Integer limit);
    public void stockAdd(Stock stock);
    public Stock selectOne(String gno,String bno);
    public void stockDelete(String gno,String bno);
    public void stockUpdate(Stock stock);
    public Integer getAllNum();
}
