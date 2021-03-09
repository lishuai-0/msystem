package com.bug1024.msystem.coma.service;



import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.Role;

import java.util.List;

public interface RoleService {

    public List<Role> roleList(Integer nowPage, Integer rowNum, Integer rno, String rname, String description);
    public Integer getAllNum(Integer rno,String rname,String description);

    public List<Menu> selectMenusByRoleId(Integer rno);

    public List<Menu> selectNoMenusByRoleId(Integer rno);

    public void saveMenusForRole(Integer rno,Integer mno);

    public void deleteMenusForRole(Integer rno);
    public Integer delete(Integer rno);
}
