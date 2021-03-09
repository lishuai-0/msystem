package com.bug1024.msystem.coma.service.impl;


import com.bug1024.msystem.coma.service.MenuService;
import com.bug1024.msystem.coma.dao.MenuDao;
import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.utils.orm.SqlSession;

import java.util.HashMap;
import java.util.List;

public class ImpMenuService implements MenuService {

    private MenuDao dao = new SqlSession().getMapper(MenuDao.class);
    public List<Menu> getMenus() {
        return dao.selectMenus();
    }

    public void addMenu(String mname, String mhref, String mtarget,Integer pno) {
        Menu menu = new Menu(null,mname,mhref,mtarget,pno,null,null);
        dao.addMenu(menu);
    }

    public Menu selectMenuByMname(String mname) {
        return dao.selectMenuByMname(mname);
    }

    public void deleteMenuById(Integer mno) {
        List<Menu> menus = dao.selectMenus();
        for(Menu menu:menus){
            if (menu.getPno().equals(mno)){
                deleteMenuById(menu.getMno());
            }
        }
        dao.deleteMenuById(mno);
    }

    public List<Role> selectRoleWithUser(Integer uno) {
        return dao.selectRoleWithUser(uno);
    }

    public List<Role> selectNoRoleWithUser(Integer uno) {
        return dao.selectNoRoleWithUser(uno);
    }

    public void addRoleForUserById(Integer uno,Integer rno) {
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        map.put("uno",uno);
        map.put("rno",rno);
        dao.addRoleForUserById(map);
    }

    public void deleteRoleForUserByUserId(Integer uno) {
        dao.deleteRoleForUserByUserId(uno);
    }
}
