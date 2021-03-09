package com.bug1024.msystem.coma.domain;

import java.util.List;

public class Role {
    private int rno;
    private String rname;
    private String description;
    private String yl1;
    private String yl2;
    private List<Menu> menuList;

    public Role() {
    }

    public Role(int rno, String rname, String description, String yl1, String yl2) {
        this.rno = rno;
        this.rname = rname;
        this.description = description;
        this.yl1 = yl1;
        this.yl2 = yl2;
    }

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getYl1() {
        return yl1;
    }

    public void setYl1(String yl1) {
        this.yl1 = yl1;
    }

    public String getYl2() {
        return yl2;
    }

    public void setYl2(String yl2) {
        this.yl2 = yl2;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }
}
