package com.ute.onlineauction.beans;

public class Assess {
    private int UserID,Type,AssessorID;
    private String Comment;

    public Assess(int UserID , int Type , int AssessorID , String Comment) {
        this.UserID = UserID;
        this.Type = Type;
        this.AssessorID = AssessorID;
        this.Comment = Comment;
    }
    public int getUserID() {return UserID;}
    public int getType() {return Type;}
    public int getAssessorID() {return AssessorID;}
    public String getComment() {return Comment;}

}
