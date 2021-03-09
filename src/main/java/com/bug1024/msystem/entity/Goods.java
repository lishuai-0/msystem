package com.bug1024.msystem.entity;
public class Goods {
    private String gno;
    private String gname;
    private String gtype;

    public Goods() {
    }

    public Goods(String gno, String gname, String gtype) {
        this.gno = gno;
        this.gname = gname;
        this.gtype = gtype;
    }

    public String getGno() {
        return gno;
    }

    public void setGno(String gno) {
        this.gno = gno;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGtype() {
        return gtype;
    }

    public void setGtype(String gtype) {
        this.gtype = gtype;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "gno='" + gno + '\'' +
                ", gname='" + gname + '\'' +
                ", gtype='" + gtype + '\'' +
                '}';
    }
}
