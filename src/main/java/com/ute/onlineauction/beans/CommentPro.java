package com.ute.onlineauction.beans;



public class CommentPro {
    private int ProID,ID,UserID;
    private String Text;

    public CommentPro(int iD, int proID,int userID, String text){
        this.ID = iD;
        this.ProID = proID;
        this.UserID = userID;
        this.Text = text;

    }

    public CommentPro(int proID,int userID, String text){
        this.ID = -1;
        this.ProID = proID;
        this.UserID = userID;
        this.Text = text;
    }

    public int getID() {return ID;}
    public int getProID() {return ProID;}
    public int getUserID() {return UserID;}
    public String getText() {return Text;}
}

