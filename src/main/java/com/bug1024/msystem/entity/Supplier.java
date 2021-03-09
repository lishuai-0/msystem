package com.bug1024.msystem.entity;

public class Supplier {
    private String sno;
    private String sname;
    private String adress;
    private String phone;

    public Supplier() {
    }

    public Supplier(String sno, String sname, String adress, String phone) {
        this.sno = sno;
        this.sname = sname;
        this.adress = adress;
        this.phone = phone;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
