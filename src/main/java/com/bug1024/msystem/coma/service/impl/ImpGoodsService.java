package com.bug1024.msystem.coma.service.impl;


import com.bug1024.msystem.coma.dao.GoodsDao;
import com.bug1024.msystem.coma.service.GoodsService;
import com.bug1024.msystem.entity.Goods;
import com.bug1024.msystem.utils.orm.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImpGoodsService implements GoodsService {
    private GoodsDao dao = new SqlSession().getMapper(GoodsDao.class);

    @Override
    public List goodsList(Integer nowPage, Integer limit) {
        HashMap<String,Integer> map = new HashMap();
        map.put("begin",(nowPage-1)*limit);
        map.put("end",limit);
        return dao.selectGoodsList(map);
    }

    @Override
    public void goodsAdd(Goods goods) {
        Map<String,String> map = new HashMap<>();
        map.put("gno",goods.getGno());
        map.put("gname",goods.getGname());
        map.put("gtype",goods.getGtype());
         dao.goodsAdd(map);
    }

    @Override
    public Goods selectOne(String gno) {
        return dao.selectOne(gno);
    }

    @Override
    public void goodsDelete(String gno) {
        dao.deleteOne(gno);
    }

    @Override
    public void goodsUpdate(Goods goods) {
        Map<String,String> map = new HashMap<>();
        map.put("gno",goods.getGno());
        map.put("gname",goods.getGname());
        map.put("gtype",goods.getGtype());
        dao.updateOne(map);
    }

    @Override
    public Integer getAllNum() {
            return dao.getAllNum();
    }
}
