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
public class OrderDetail implements Serializable{
    private int oid;
    private int fid;
    private String fname;
    private double uprice;
    private int quantity;
    private double tprice;

    public OrderDetail() {
    }

    public OrderDetail(int oid, int fid, String fname, double uprice, int quantity, double tprice) {
        this.oid = oid;
        this.fid = fid;
        this.fname = fname;
        this.uprice = uprice;
        this.quantity = quantity;
        this.tprice = tprice;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
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

    public double getUprice() {
        return uprice;
    }

    public void setUprice(double uprice) {
        this.uprice = uprice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTprice() {
        return tprice;
    }

    public void setTprice(double tprice) {
        this.tprice = tprice;
    }
    
}
