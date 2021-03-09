package com.bug1024.msystem.coma.service;



import com.bug1024.msystem.entity.Supplier;

import java.util.List;


/**
 * 定义处理com.bug1024.msystem.entity.Supplier信息的service
 */
public interface SupplierService {

    public List supplierList(Integer nowPage,Integer limit);
    public void supplierAdd(Supplier supplier);
    public Supplier selectOne(String sno);
    public void supplierDelete(String sno);
    public void supplierUpdate(Supplier supplier);
    public Integer getAllNum();
}
