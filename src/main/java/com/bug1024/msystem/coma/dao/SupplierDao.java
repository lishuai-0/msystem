package com.bug1024.msystem.coma.dao;



import com.bug1024.msystem.entity.Supplier;
import com.bug1024.msystem.utils.orm.annotation.Delete;
import com.bug1024.msystem.utils.orm.annotation.Insert;
import com.bug1024.msystem.utils.orm.annotation.Select;
import com.bug1024.msystem.utils.orm.annotation.Update;

import java.util.List;
import java.util.Map;

public interface SupplierDao {

    @Select("select * from supplier where sno=#{sno}")
    public Supplier selectOne(Integer sno);

    @Select("select * from supplier limit #{begin},#{end}")
    public List<Supplier> selectSupplierList(Map<String,Integer> params);

    @Insert("insert into supplier(sno,sname,adress,phone) values(#{sno},#{sname},#{adress},#{phone})")
    public void supplierAdd(Map<String,String> params);

    @Select("select * from supplier where sno=#{sno}")
    public Supplier selectOne(String sno);

    @Delete("delete from supplier where sno=#{sno}")
    public void deleteOne(String sno);

    @Update("Update supplier set sname=#{sname},adress=#{adress},phone=#{phone} where sno=#{sno}")
    public void updateOne(Map<String,String> params);

    @Select("select count(*) from supplier")
    public int getAllNum();
}
