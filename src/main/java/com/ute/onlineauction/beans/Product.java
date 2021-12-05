package com.ute.onlineauction.beans;

import java.util.Date;

public class Product {
    private int ProID;
    private String ProName, TinyDes, FullDes;
    private int Price, CatID , PrinceDifference;
    private Date StartDate , EndDate;
    public Product() {
    }

    public Product(int proID, String proName, String tinyDes, String fullDes, int price, int catID,Date startdate , Date enddate, int pricedifference) {
        ProID = proID;
        ProName = proName;
        TinyDes = tinyDes;
        FullDes = fullDes;
        Price = price;
        CatID = catID;
        PrinceDifference = pricedifference;
        StartDate = startdate;
        EndDate = enddate;
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
    public int getPrinceDifference() {
        return PrinceDifference;
    }
    public Date getStartDate() {
        return StartDate;
    }
    public Date getEndDate() {
        return EndDate;
    }
}