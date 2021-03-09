package com.bug1024.msystem.coma.service.impl;


import com.bug1024.msystem.coma.dao.StockDao;
import com.bug1024.msystem.coma.service.StockService;
import com.bug1024.msystem.entity.Stock;
import com.bug1024.msystem.utils.orm.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImpStockService implements StockService {
    private StockDao dao = new SqlSession().getMapper(StockDao.class);

    @Override
    public List stockList(Integer nowPage, Integer limit) {
        HashMap<String,Integer> map = new HashMap();
        map.put("begin",(nowPage-1)*limit);
        map.put("end",limit);
        return dao.selectStockList(map);
    }

    @Override
    public void stockAdd(Stock stock) {
        Map<String,Object> map = new HashMap<>();
        map.put("gno",stock.getGno());
        map.put("bno",stock.getBno());
        map.put("stockNum",stock.getStockNum());
         dao.stockAdd(map);
    }

    @Override
    public Stock selectOne(String gno,String bno) {
        Map<String,String> map = new HashMap<>();
        map.put("gno",gno);
        map.put("bno",bno);
        return dao.selectOne(map);
    }

    @Override
    public void stockDelete(String gno,String bno) {
        Map<String,String> map = new HashMap<>();
        map.put("gno",gno);
        map.put("bno",bno);
        dao.deleteOne(map);
    }

    @Override
    public void stockUpdate(Stock stock) {
        dao.updateOne(stock);
    }

    @Override
    public Integer getAllNum() {
            return dao.getAllNum();
    }
}
