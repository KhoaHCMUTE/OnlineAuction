package com.ute.onlineauction.beans;

public class Like {
    private int ProID,Value,UserID;

    public Like (int ProID, int UserID ,int Value){
        this.ProID = ProID;
        this.UserID = UserID;
        this.Value = Value;
    }

    public int getProID() {return ProID;}
    public int getUserID() {return UserID;}
    public int getValue() {return Value;}
}
