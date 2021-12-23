package com.ute.onlineauction.beans;

import java.time.LocalDate;

public class User {
    private int UserID;
    private String UserName, PassWord, Name, Email;
    private LocalDate Dob;
    private int Permission;

    public User(int UserID, String UserName, String PassWord, String Name, String Email, LocalDate Dob, int Permission) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.PassWord = PassWord;
        this.Name = Name;
        this.Email = Email;
        this.Dob = Dob;
        this.Permission = Permission;
    }

    public User() {

    }

    public int getId() {
        return UserID;
    }

    public String getUserName() {
        return UserName;
    }

    public String getPassWord() {
        return PassWord;
    }

    public String getName() {
        return Name;
    }

    public String getEmail() {
        return Email;
    }

    public LocalDate getDob() {
        return Dob;
    }

    public int getPermission() {
        return Permission;
    }
}
