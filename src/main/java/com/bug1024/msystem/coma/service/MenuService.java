package com.bug1024.msystem.coma.service;



import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.Role;

import java.util.List;

public interface MenuService {

    public List<Menu> getMenus();

    public void addMenu(String mname,String mhref,String mtarget,Integer pno);

    public Menu selectMenuByMname(String mname);

    public void deleteMenuById(Integer mno);

    public List<Role> selectRoleWithUser(Integer uno);

    public List<Role> selectNoRoleWithUser(Integer uno);

    public void addRoleForUserById(Integer uno,Integer rno);

    public void deleteRoleForUserByUserId(Integer uno);
}
