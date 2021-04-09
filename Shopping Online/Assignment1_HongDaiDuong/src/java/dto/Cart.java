/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class Cart implements Serializable{
    private Food fd;
    private int quantity;

    public Cart() {
    }

    public Cart(Food fd, int quantity) {
        this.fd = fd;
        this.quantity = quantity;
    }

    public Food getFd() {
        return fd;
    }

    public void setFd(Food fd) {
        this.fd = fd;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public static int isExist(String id, ArrayList<Cart> list){
        for(int i=0; i<list.size(); i++){
            if(list.get(i).getFd().getFid() == Integer.parseInt(id)){
                return i;
            }
        }
        return -1;
    }
}
