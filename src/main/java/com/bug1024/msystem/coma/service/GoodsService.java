package com.bug1024.msystem.coma.service;



import com.bug1024.msystem.entity.Goods;

import java.util.List;


/**
 * 定义处理com.bug1024.msystem.entity.Goods信息的service
 */
public interface GoodsService {


    public List goodsList(Integer nowPage,Integer limit);
    public void goodsAdd(Goods goods);
    public Goods selectOne(String gno);
    public void goodsDelete(String gno);
    public void goodsUpdate(Goods goods);
    public Integer getAllNum();
}
