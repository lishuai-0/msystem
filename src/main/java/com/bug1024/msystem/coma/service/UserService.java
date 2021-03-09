package com.bug1024.msystem.coma.service;

import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.User;

import java.util.List;


/**
 * 定义处理User信息的service
 */
public interface UserService {

    public User login(String uname, String upass);

    public List userList();

    public void userAdd(User user);

    public User selectOne(Integer uno);

    public User selectOneByName(String name);

    public void userDelete(Integer uno);

    public void userUpdate(User user);


    public void updatePass(User user);
    public List<Menu> getMenusByUno(Integer uno);
}
