package com.bug1024.msystem.coma.dao;



import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.User;
import com.bug1024.msystem.utils.orm.annotation.Delete;
import com.bug1024.msystem.utils.orm.annotation.Insert;
import com.bug1024.msystem.utils.orm.annotation.Select;
import com.bug1024.msystem.utils.orm.annotation.Update;

import java.util.List;
import java.util.Map;

public interface UserDao {

    @Select("select * from t_user where uname=#{uname} and upass=#{upass}")
    public User selectOne(Map<String,String> params);

    @Select("select * from t_user")
    public List<User> selectUserList();

    @Insert("insert into t_user(uname,upass,trueName,age,sex,phone,email,yl2) values(#{uname}, #{upass},#{trueName},#{age},#{sex},#{phone},#{email},#{yl2})")
    public void userAdd(User user);

    @Select("select * from t_user where uno=#{uno}")
    public User selectOne(Integer uno);

    @Select("select * from t_user where uname=#{uname}")
    public User selectOneByName(Map<String,String> params);


    @Delete("delete from t_user where uno=#{uno}")
    public void deleteOne(Integer uno);

    @Update("Update t_user set uname=#{uname},trueName=#{trueName},age=#{age},sex=#{sex},phone=#{phone} where uno=#{uno}")
    public void updateOne(User user);

    @Update("Update t_user set upass=#{upass} where uno=#{uno}")
    public void updatePass(User user);

    @Select("select * from t_menu where mno in (select mno from t_role_menu where rno in (select rno from t_user_role where uno = #{uno}))")
    public List<Menu> getMenusByUno(Integer uno);

}
