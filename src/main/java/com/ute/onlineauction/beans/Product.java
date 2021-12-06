package com.ute.onlineauction.beans;

import java.util.Date;
import java.util.Calendar;


public class Product {
    private int ProID;
    private String ProName, TinyDes, FullDes;
    private int Price, CatID , PriceDifference;
    private Calendar  StartDate , EndDate;
    public Product() {
    }

    public Product(int proID, String proName, String tinyDes, String fullDes, int price, int catID, Calendar startDate , Calendar endDate, int priceDifference) {
        ProID = proID;
        ProName = proName;
        TinyDes = tinyDes;
        FullDes = fullDes;
        Price = price;
        CatID = catID;
        PriceDifference = priceDifference;
        StartDate = startDate;
        EndDate = endDate;
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