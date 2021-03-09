package com.bug1024.msystem.coma.dao;



import com.bug1024.msystem.entity.Base;
import com.bug1024.msystem.utils.orm.annotation.Delete;
import com.bug1024.msystem.utils.orm.annotation.Insert;
import com.bug1024.msystem.utils.orm.annotation.Select;
import com.bug1024.msystem.utils.orm.annotation.Update;

import java.util.List;
import java.util.Map;

public interface BaseDao {

    @Select("select * from base where bname=#{bname}")
    public Base selectOne(Map<String,String> params);

    @Select("select * from base limit #{begin},#{end}")
    public List<Base> selectBaseList(Map<String,Integer> params);

    @Insert("insert into base(bno,bname,adress) values(#{bno},#{bname}, #{adress})")
    public void baseAdd(Map<String,String> params);

    @Select("select * from base where bno=#{bno}")
    public Base selectOne(String bno);

    @Delete("delete from base where bno=#{bno}")
    public void deleteOne(String bno);

    @Update("Update base set bname=#{bname},adress=#{adress} where bno=#{bno}")
    public void updateOne(Map<String,String> params);

    @Select("select count(*) from base")
    public int getAllNum();
}
