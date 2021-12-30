package com.ute.onlineauction.beans;

import java.time.LocalDate;

public class Score {
    private int ID,UserIDgive,UserIDget,Score;
    private LocalDate Day;
    private String Text;

    public Score(int iD,int userIDgive,int userIDget,int score, LocalDate day, String text){
        this.ID = iD;
        this.UserIDget = userIDget;
        this.UserIDgive = userIDgive;
        this.Score = score;
        this.Day = day;
        this.Text = text;
    }

    public Score(int userIDgive,int userIDget,int score, LocalDate day, String text){
        this.ID = -1;
        this.UserIDget = userIDget;
        this.UserIDgive = userIDgive;
        this.Score = score;
        this.Day = day;
        this.Text = text;
    }

}
