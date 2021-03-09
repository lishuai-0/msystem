package com.bug1024.msystem.coma.dao;



import com.bug1024.msystem.entity.Goods;
import com.bug1024.msystem.utils.orm.annotation.Delete;
import com.bug1024.msystem.utils.orm.annotation.Insert;
import com.bug1024.msystem.utils.orm.annotation.Select;
import com.bug1024.msystem.utils.orm.annotation.Update;

import java.util.List;
import java.util.Map;

public interface GoodsDao {

    @Select("select * from goods where gname=#{gname}")
    public Goods selectOne(Map<String,String> params);

    @Select("select * from goods limit #{begin},#{end}")
    public List<Goods> selectGoodsList(Map<String,Integer> params);

    @Insert("insert into goods(gno,gname,gtype) values(#{gno},#{gname}, #{gtype})")
    public void goodsAdd(Map<String,String> params);

    @Select("select * from goods where gno=#{gno}")
    public Goods selectOne(String gno);

    @Delete("delete from goods where gno=#{gno}")
    public void deleteOne(String gno);

    @Update("Update goods set gname=#{gname},gtype=#{gtype} where gno=#{gno}")
    public void updateOne(Map<String,String> params);

    @Select("select count(*) from goods")
    public int getAllNum();
}
