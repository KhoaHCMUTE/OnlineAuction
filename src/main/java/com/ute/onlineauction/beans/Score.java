package com.ute.onlineauction.beans;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Score {
    private int ID,UserIDgive,UserIDget,Score;
    private LocalDateTime Day;
    private String Text;

    public Score(int iD,int userIDget,int userIDgive,int score, LocalDateTime day, String text){
        this.ID = iD;
        this.UserIDget = userIDget;
        this.UserIDgive = userIDgive;
        this.Score = score;
        this.Day = day;
        this.Text = text;
    }

    public Score(int userIDget, int userIDgive, int score, LocalDateTime day, String text){
        this.ID = -1;
        this.UserIDget = userIDget;
        this.UserIDgive = userIDgive;
        this.Score = score;
        this.Day = day;
        this.Text = text;
    }

    public int getID() {
        return ID;
    }

    public int getScore() {
        return Score;
    }

    public int getUserIDget() {
        return UserIDget;
    }

    public int getUserIDgive() {
        return UserIDgive;
    }

    public LocalDateTime getDay() {
        return Day;
    }

    public String getText() {
        return Text;
    }

}
