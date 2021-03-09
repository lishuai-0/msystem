package com.bug1024.msystem.coma.dao;



import com.bug1024.msystem.entity.Stock;
import com.bug1024.msystem.utils.orm.annotation.Delete;
import com.bug1024.msystem.utils.orm.annotation.Insert;
import com.bug1024.msystem.utils.orm.annotation.Select;
import com.bug1024.msystem.utils.orm.annotation.Update;

import java.util.List;
import java.util.Map;

public interface StockDao {

    @Select("select * from stock where gno=#{gno} and bno=#{bno}")
    public Stock selectOne(Map<String,String> params);

    @Select("select * from stock limit #{begin},#{end}")
    public List<Stock> selectStockList(Map<String,Integer> params);

    @Insert("insert into stock(gno,bno,stockNum) values(#{gno},#{bno}, #{stockNum})")
    public void stockAdd(Map<String,Object> params);

    @Select("select * from stock where gno=#{gno}")
    public Stock selectOne(String gno);

    @Delete("delete from stock where gno=#{gno} and bno=#{bno}")
    public void deleteOne(Map<String,String> params);

    @Update("Update stock set stockNum=#{stockNum} where gno=#{gno} and bno=#{bno}")
    public void updateOne(Stock stock);

    @Select("select count(*) from stock")
    public int getAllNum();
}
