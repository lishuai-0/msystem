package com.bug1024.msystem.coma.service.impl;


import com.bug1024.msystem.coma.dao.BaseDao;
import com.bug1024.msystem.coma.service.BaseService;
import com.bug1024.msystem.entity.Base;
import com.bug1024.msystem.utils.orm.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImpBaseService implements BaseService {
    private BaseDao dao = new SqlSession().getMapper(BaseDao.class);

    @Override
    public List baseList(Integer nowPage, Integer limit) {
        HashMap<String,Integer> map = new HashMap();
        map.put("begin",(nowPage-1)*limit);
        map.put("end",limit);
        return dao.selectBaseList(map);
    }

    @Override
    public void baseAdd(Base base) {
        Map<String,String> map = new HashMap<>();
        map.put("bno",base.getBno());
        map.put("bname",base.getBname());
        map.put("adress",base.getAdress());
         dao.baseAdd(map);
    }

    @Override
    public Base selectOne(String bno) {
        return dao.selectOne(bno);
    }

    @Override
    public void baseDelete(String bno) {
        dao.deleteOne(bno);
    }

    @Override
    public void baseUpdate(Base base) {
        Map<String,String> map = new HashMap<>();
        map.put("bno",base.getBno());
        map.put("bname",base.getBname());
        map.put("adress",base.getAdress());
        dao.updateOne(map);
    }

    @Override
    public Integer getAllNum() {
            return dao.getAllNum();
    }
}
