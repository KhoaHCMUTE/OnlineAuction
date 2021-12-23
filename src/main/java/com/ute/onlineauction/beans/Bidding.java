package com.ute.onlineauction.beans;



public class Bidding {
    private int ProID,ID,Price,UserID,SellerID;

    public Bidding  (int proID,int iD,int userID, int price, int sellerID){
        this.ID = iD;
        this.ProID = proID;
        this.UserID = userID;
        this.Price = price;
        this.SellerID = sellerID;
    }

    public Bidding  (int proID, int userID, int price, int sellerID){
        this.ID = -1;
        this.ProID = proID;
        this.UserID = userID;
        this.Price = price;
        this.SellerID = sellerID;
    }

    public int getID() {return ID;}
    public int getSellerID() {return SellerID;}
    public int getProID() {return ProID;}
    public int getPrice() {return Price;}
    public int getUserID() {return UserID;}
}

