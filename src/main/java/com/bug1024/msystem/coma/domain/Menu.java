package com.bug1024.msystem.coma.domain;

public class Menu {
    private Integer mno;
    private String mname;
    private String mhref;
    private String mtarget;
    private Integer pno;
    private String yl1;
    private String yl2;

    public Menu(Integer mno, String mname, String mhref, String mtarget, Integer pno, String yl1, String yl2) {
        this.mno = mno;
        this.mname = mname;
        this.mhref = mhref;
        this.mtarget = mtarget;
        this.pno = pno;
        this.yl1 = yl1;
        this.yl2 = yl2;
    }

    public Menu() {
    }

    public Integer getMno() {
        return mno;
    }

    public void setMno(Integer mno) {
        mno = mno;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMhref() {
        return mhref;
    }

    public void setMhref(String mhref) {
        this.mhref = mhref;
    }

    public String getMtarget() {
        return mtarget;
    }

    public void setMtarget(String mtarget) {
        this.mtarget = mtarget;
    }

    public Integer getPno() {
        return pno;
    }

    public void setPno(Integer pno) {
        pno = pno;
    }

    public String getYl1() {
        return yl1;
    }

    public void setY11(String yl1) {
        this.yl1 = yl1;
    }

    public String getYl2() {
        return yl2;
    }

    public void setY12(String yl2) {
        this.yl2 = yl2;
    }
}
