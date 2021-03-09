package com.bug1024.msystem.coma.domain;

import java.io.Serializable;
import java.util.List;

public class User implements Serializable {
    private Integer uno;
    private String uname;
    private String upass;
    private String trueName;
    private Integer age;
    private String sex;
    private String phone;
    private String email;
    private String yl2;
//    private List<Role> roleList;

    public User() {
    }

    public User(Integer uno, String uname, String upass, String trueName, Integer age, String sex, String phone, String email, String yl2) {
        this.uno = uno;
        this.uname = uname;
        this.upass = upass;
        this.trueName = trueName;
        this.age = age;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
        this.yl2 = yl2;
    }

    public Integer getUno() {
        return uno;
    }

    public void setUno(Integer uno) {
        this.uno = uno;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getYl2() {
        return yl2;
    }

    public void setYl2(String yl2) {
        this.yl2 = yl2;
    }

//    public List<Role> getRoleList() {
//        return roleList;
//    }
//
//    public void setRoleList(List<Role> roleList) {
//        this.roleList = roleList;
//    }

    @Override
    public String toString() {
        return "User{" +
                "uno=" + uno +
                ", uname='" + uname + '\'' +
                ", upass='" + upass + '\'' +
                ", trueName='" + trueName + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", yl2='" + yl2 + '\'' +
                '}';
    }
}
