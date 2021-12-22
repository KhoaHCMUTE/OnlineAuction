package com.ute.onlineauction.beans;



public class Bidding {
    private int ProID,ID,Price,UserID;

    public Bidding  (int proID,int iD,int userID, int price){
        this.ID = iD;
        this.ProID = proID;
        this.UserID = userID;
        this.Price = price;

    }

    public Bidding  (int proID, int userID, int price){
        this.ID = -1;
        this.ProID = proID;
        this.UserID = userID;
        this.Price = price;

    }
    public int getID() {return ID;}
    public int getProID() {return ProID;}
    public int getPrice() {return Price;}
    public int getUserID() {return UserID;}
}

