package com.bug1024.msystem.coma.dao;



import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.utils.orm.annotation.Delete;
import com.bug1024.msystem.utils.orm.annotation.Insert;
import com.bug1024.msystem.utils.orm.annotation.Select;

import java.util.HashMap;
import java.util.List;

public interface MenuDao {

        @Select("select * from t_menu")
        public List<Menu> selectMenus();

        @Insert("insert into t_menu values(#{mno},#{mname},#{mhref},#{mtarget},#{pno},#{yl1},#{yl2})")
        public void addMenu(Menu menu);

        @Select("select * from t_menu where mname = #{mname}")
        public Menu selectMenuByMname(String mname);

        @Delete("delete from t_menu where mno=#{mno}")
        public void deleteMenuById(Integer mno);

        @Select("select * from t_role where rno in (select rno from t_user_role where uno=#{uno})")
        public List<Role> selectRoleWithUser(Integer uno);

        @Select("select * from t_role where rno not in (select rno from t_user_role where uno=#{uno})")
        public List<Role> selectNoRoleWithUser(Integer uno);

        @Delete("delete from t_user_role where uno = #{uno}")
        public void deleteRoleForUserByUserId(Integer uno);

        @Insert("insert into t_user_role values(#{uno},#{rno})")
        public void addRoleForUserById(HashMap<String,Integer> map);
}
