package com.bug1024.msystem.coma.service.impl;



import com.bug1024.msystem.coma.service.UserService;
import com.bug1024.msystem.coma.dao.UserDao;
import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.User;
import com.bug1024.msystem.utils.orm.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImpUserService implements UserService {


    private UserDao userDao= new SqlSession().getMapper(UserDao.class);

    public User login(String uname, String upass) {
        Map<String,String> map = new HashMap<String,String>();
        map.put("uname",uname);
        map.put("upass",upass);
        return userDao.selectOne(map);
    }

    public List userList() {
        return userDao.selectUserList();
    }

    public void userAdd(User user){
        userDao.userAdd(user);
    }

    public User selectOne(Integer uno) {
        return userDao.selectOne(uno);
    }
    public User selectOneByName(String uname) {
        Map<String,String> map = new HashMap<String,String>();
        map.put("uname",uname);
        return userDao.selectOneByName(map);
    }

    public void updatePass(User user){
        userDao.updatePass(user);
    };

    public void userDelete(Integer uno) {
        userDao.deleteOne(uno);
    }

    public void userUpdate(User user) {
        userDao.updateOne(user);
    }

    public List<Menu> getMenusByUno(Integer uno) {
        return userDao.getMenusByUno(uno);
    }

}
