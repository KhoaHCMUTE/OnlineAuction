package com.ute.onlineauction.beans;

public class Category {
    private int CatID;
    private String CatName;

    public Category() {

    }

    public Category(int id, String name){
        this.CatID = id;
        this.CatName = name;
    }

    public int getCatID() {
        return CatID;
    }

    public String getCatName() {
        return CatName;
    }
}
