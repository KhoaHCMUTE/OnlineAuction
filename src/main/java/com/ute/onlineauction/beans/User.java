package com.ute.onlineauction.beans;

import java.time.LocalDate;

public class User {
    private int ID;
    private String UserName, PassWord, Name, Email;
    private LocalDate Dob;
    private int Permission;
    private int Notify;

    public User(int ID, String UserName, String PassWord, String Name, String Email, LocalDate Dob, int Permission) {
        this.ID = ID;
        this.UserName = UserName;
        this.PassWord = PassWord;
        this.Name = Name;
        this.Email = Email;
        this.Dob = Dob;
        this.Permission = Permission;
    }
    public User(String UserName, String PassWord) {
        this.UserName = UserName;
        this.PassWord = PassWord;
    }
    public User(int ID, String UserName, int Permission) {
        this.ID = ID;
        this.UserName = UserName;
        this.Permission = Permission;
    }
    public User(String UserName, int Permission) {
        this.UserName = UserName;
        this.Permission = Permission;
    }
    public User() {

    }

    public int getId() {
        return ID;
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
