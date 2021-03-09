package com.bug1024.msystem.entity;

public class Base {
    private String bno;
    private String bname;
    private String adress;

    public Base() {
    }

    public Base(String bno, String bname, String adress) {
        this.bno = bno;
        this.bname = bname;
        this.adress = adress;
    }

    public String getBno() {
        return bno;
    }

    public void setBno(String bno) {
        this.bno = bno;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }
}
