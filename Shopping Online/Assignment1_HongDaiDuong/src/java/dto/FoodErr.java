/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author DELL
 */
public class FoodErr {
    private String nameErr;
    private String priceErr;
    private String imgErr;
    private String quantityErr;

    public FoodErr() {
    }

    public FoodErr(String nameErr, String priceErr, String imgErr, String quantityErr) {
        this.nameErr = nameErr;
        this.priceErr = priceErr;
        this.imgErr = imgErr;
        this.quantityErr = quantityErr;
    }

    public String getNameErr() {
        return nameErr;
    }

    public void setNameErr(String nameErr) {
        this.nameErr = nameErr;
    }

    public String getPriceErr() {
        return priceErr;
    }

    public void setPriceErr(String priceErr) {
        this.priceErr = priceErr;
    }

    public String getImgErr() {
        return imgErr;
    }

    public void setImgErr(String imgErr) {
        this.imgErr = imgErr;
    }

    public String getQuantityErr() {
        return quantityErr;
    }

    public void setQuantityErr(String quantityErr) {
        this.quantityErr = quantityErr;
    }
    
}
