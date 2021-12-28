package com.ute.onlineauction.beans;

import java.time.LocalDateTime;


public class AuctionNotify {
    private int ProID,ID,UserID,SellerID,Status,Confirm;
    LocalDateTime Day;


    public AuctionNotify(int iD,int sellerID, int userID, int proID ,  int status, int confirm,LocalDateTime day){
        this.ID = iD;
        this.SellerID = sellerID;
        this.UserID = userID;
        this.ProID = proID;
        this.Day = day;
        this.Status = status;
        this.Confirm = confirm;
    }



    public AuctionNotify(int sellerID, int userID, int proID ,  int status, int confirm,LocalDateTime day){
        this.ID = -1;
        this.SellerID = sellerID;
        this.UserID = userID;
        this.ProID = proID;
        this.Day = day;
        this.Status = status;
        this.Confirm = confirm;
    }


    public int getID() {return ID;}
    public int getProID() {return ProID;}
    public int getUserID() {return UserID;}
    public int getSellerID() {return SellerID;}
    public int getStatus() {return Status;}
    public int getConfirm() {return Confirm;}
    public LocalDateTime getDay() {return Day;}
}

