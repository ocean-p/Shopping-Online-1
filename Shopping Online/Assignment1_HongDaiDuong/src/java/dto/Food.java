/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class Food implements Serializable{
    private int fid;
    private String fname;
    private double fprice;
    private String fimg;
    private int quantity;
    private int isdelete;
    private int cid;
    private String createtime;

    public Food() {
    }

    public Food(int fid, String fname, double fprice, String fimg, int quantity, int isdelete, int cid, String createtime) {
        this.fid = fid;
        this.fname = fname;
        this.fprice = fprice;
        this.fimg = fimg;
        this.quantity = quantity;
        this.isdelete = isdelete;
        this.cid = cid;
        this.createtime = createtime;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public double getFprice() {
        return fprice;
    }

    public void setFprice(double fprice) {
        this.fprice = fprice;
    }

    public String getFimg() {
        return fimg;
    }

    public void setFimg(String fimg) {
        this.fimg = fimg;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(int isdelete) {
        this.isdelete = isdelete;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    
}
