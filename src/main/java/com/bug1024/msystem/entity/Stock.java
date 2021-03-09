package com.bug1024.msystem.entity;

public class Stock {
    private String gno;
    private String bno;
    private Integer stockNum;

    public Stock() {
    }

    public Stock(String gno, String bno, Integer stockNum) {
        this.gno = gno;
        this.bno = bno;
        this.stockNum = stockNum;
    }

    public String getGno() {
        return gno;
    }

    public void setGno(String gno) {
        this.gno = gno;
    }

    public String getBno() {
        return bno;
    }

    public void setBno(String bno) {
        this.bno = bno;
    }

    public Integer getStockNum() {
        return stockNum;
    }

    public void setStockNum(Integer stockNum) {
        this.stockNum = stockNum;
    }
}
