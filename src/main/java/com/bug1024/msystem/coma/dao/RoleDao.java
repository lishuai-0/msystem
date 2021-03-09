package com.bug1024.msystem.coma.dao;



import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.utils.orm.annotation.Delete;
import com.bug1024.msystem.utils.orm.annotation.Insert;
import com.bug1024.msystem.utils.orm.annotation.Select;

import java.util.HashMap;
import java.util.List;

public interface RoleDao {

    public List<Role> selectList(Integer nowPage, Integer rowNum, Integer rno, String rname, String description);

    public Integer getAllNum(Integer rno,String rname,String description);

    @Select("select * from t_menu where mno in (select mno from t_role_menu where rno = #{rno})")
    public List<Menu> selectMenusByRoleId(Integer rno);

    @Select("select * from t_menu where mno not in (select mno from t_role_menu where rno = #{rno})")
    public List<Menu> selectNoMenusByRoleId(Integer rno);

    @Insert("insert into t_role_menu values(#{rno},#{mno})")
    public void saveMenusForRole(HashMap<String,Integer> map);

    @Delete("delete from t_role_menu where rno=#{rno}")
    public void deleteMenusForRole(Integer rno);

    @Delete("delete from t_role where rno=#{rno}")
    public Integer delete(Integer rno);
}
