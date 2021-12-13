package com.ute.onlineauction.beans;



public class Product {
    private String ProName, TinyDes, FullDes;
    private int ProID,Price, CatID , PriceDifference;
    public Product() {
    }
    public Product(int proID, String proName, String tinyDes, String fullDes,int price,  int priceDifference, int catID) {
        this.ProID = proID;
       this.ProName = proName;
       this.TinyDes = tinyDes;
       this.FullDes = fullDes;
       this.Price = price;
       this.PriceDifference = priceDifference;
       this.CatID = catID;
    }
    public Product( String proName, String tinyDes, String fullDes,int price,  int priceDifference, int catID) {
        this.ProID=-1;
        this.ProName = proName;
        this.TinyDes = tinyDes;
        this.FullDes = fullDes;
        this.Price = price;
        this.PriceDifference = priceDifference;
        this.CatID = catID;

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

//    public Date getStartDate() { return StartDate; }
//
//    public Date getEndDate() { return EndDate; }
}