package com.ute.onlineauction.beans;



public class Product {
    private int ProID,UserID;
    private String ProName, TinyDes, FullDes, PerID;
    private int Price, CatID , PriceDifference;

    public Product(int proID, String proName, String tinyDes, String fullDes,int price,  int priceDifference, int catID, String perID,int userID) {
        this.ProID = proID;
       this.ProName = proName;
       this.TinyDes = tinyDes;
       this.FullDes = fullDes;
       this.Price = price;
       this.PriceDifference = priceDifference;
       this.CatID = catID;
        this.PerID = perID;
        this.UserID = userID;
    }
    public Product( String proName, String tinyDes, String fullDes,int price,  int priceDifference, int catID, String perID, int userID) {
        this.ProID=-1;
        this.ProName = proName;
        this.TinyDes = tinyDes;
        this.FullDes = fullDes;
        this.Price = price;
        this.PriceDifference = priceDifference;
        this.CatID = catID;
        this.PerID = perID;
        this.UserID = userID;

    }

    public int getProID() {
        return ProID;
    }

    public String getProName() {
        return ProName;
    }

    public String getTinyDes() {
        return TinyDes;
    }

    public String getFullDes() {
        return FullDes;
    }

    public int getPrice() {
        return Price;
    }

    public int getCatID() {
        return CatID;
    }

    public int getPriceDifference() {
        return PriceDifference;
    }

    public String getPerID() {
        return PerID;
    }

    public int getUserID(){return  UserID;}

//    public Date getStartDate() { return StartDate; }
//
//    public Date getEndDate() { return EndDate; }
}