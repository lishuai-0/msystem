package com.bug1024.msystem.coma.service.impl;

import com.bug1024.msystem.coma.dao.RoleDao;
import com.bug1024.msystem.coma.dao.imp.ImpRoleDao;
import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.coma.service.RoleService;
import com.bug1024.msystem.utils.orm.SqlSession;


import java.util.HashMap;
import java.util.List;

public class ImpRoleService  implements RoleService {

    private RoleDao roleDao = new ImpRoleDao();

    private RoleDao dao = new SqlSession().getMapper(RoleDao.class);

    public List<Role> roleList(Integer nowPage, Integer rowNum, Integer rno, String rname, String description) {
        return roleDao.selectList((nowPage-1)*rowNum,rowNum,rno,rname,description);
    }

    public Integer getAllNum(Integer rno,String rname,String description) {
        return roleDao.getAllNum(rno,rname,description);
    }

    public List<Menu> selectMenusByRoleId(Integer rno) {
        return dao.selectMenusByRoleId(rno);
    }

    public List<Menu> selectNoMenusByRoleId(Integer rno) {
        return dao.selectNoMenusByRoleId(rno);
    }

    public void saveMenusForRole(Integer rno, Integer mno) {
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        map.put("rno",rno);
        map.put("mno",mno);
        dao.saveMenusForRole(map);
    }

    public void deleteMenusForRole(Integer rno) {
        dao.deleteMenusForRole(rno);
    }

    @Override
    public Integer delete(Integer rno) {
        return roleDao.delete(rno);
    }
}
