package com.bug1024.msystem.coma.service.impl;



import com.bug1024.msystem.coma.dao.SupplierDao;
import com.bug1024.msystem.coma.service.SupplierService;
import com.bug1024.msystem.entity.Supplier;
import com.bug1024.msystem.utils.orm.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImpSupplierService implements SupplierService {
    private SupplierDao dao = new SqlSession().getMapper(SupplierDao.class);

    @Override
    public List supplierList(Integer nowPage, Integer limit) {
        HashMap<String,Integer> map = new HashMap();
        map.put("begin",(nowPage-1)*limit);
        map.put("end",limit);
        return dao.selectSupplierList(map);
    }

    @Override
    public void supplierAdd(Supplier supplier) {
        Map<String,String> map = new HashMap<>();
        map.put("sno",supplier.getSno());
        map.put("sname",supplier.getSname());
        map.put("adress",supplier.getAdress());
        map.put("phone",supplier.getPhone());
         dao.supplierAdd(map);
    }

    @Override
    public Supplier selectOne(String sno) {
        return dao.selectOne(sno);
    }

    @Override
    public void supplierDelete(String sno) {
        dao.deleteOne(sno);
    }

    @Override
    public void supplierUpdate(Supplier supplier) {
        Map<String,String> map = new HashMap<>();
        map.put("sno",supplier.getSno());
        map.put("sname",supplier.getSname());
        map.put("adress",supplier.getAdress());
        map.put("phone",supplier.getPhone());
        dao.updateOne(map);
    }

    @Override
    public Integer getAllNum() {
            return dao.getAllNum();
    }
}
