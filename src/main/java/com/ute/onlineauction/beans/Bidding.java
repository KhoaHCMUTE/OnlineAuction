package com.ute.onlineauction.beans;


import java.time.LocalDateTime;

public class Bidding {
    private int ProID,ID,UserID,SellerID,Price ;
    LocalDateTime Day;

    public Bidding  (int iD,int proID,int price,int userID, int sellerID, LocalDateTime day){
        this.ID = iD;
        this.ProID = proID;
        this.UserID = userID;
        this.Price = price;
        this.SellerID = sellerID;
        this.Day = day;
    }

    public Bidding  (int proID,int userID,int price, int sellerID, LocalDateTime day){
        this.ID = -1;
        this.ProID = proID;
        this.UserID = userID;
        this.Price = price;
        this.SellerID = sellerID;
        this.Day = day;
    }

    public Bidding  (int proID){
        this.ProID = proID;
    }

    public int getID() {return ID;}
    public int getSellerID() {return SellerID;}
    public int getProID() {return ProID;}
    public int getPrice() {return Price;}
    public int getUserID() {return UserID;}
    public LocalDateTime getDay() {return Day;}
}
