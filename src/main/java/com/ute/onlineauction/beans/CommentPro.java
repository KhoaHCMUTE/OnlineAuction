package com.ute.onlineauction.beans;



public class CommentPro {
    private int ProID,ID;
    private String Text;

    public CommentPro(int iD, int proID, String text){
        this.ID = iD;
        this.ProID = proID;
        this.Text = text;
    }

    public CommentPro(int proID, String text){
        this.ID = -1;
        this.ProID = proID;
        this.Text = text;
    }
    public int getID() {return ID;}
    public int getProID() {return ProID;}
    public String getText() {return Text;}
}

