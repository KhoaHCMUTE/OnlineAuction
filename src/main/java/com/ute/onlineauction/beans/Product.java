package com.ute.onlineauction.beans;

import java.time.LocalDateTime;

public class Product {
    private int ProID, UserID;
    private String ProName, TinyDes, FullDes;
    private int CatID;
    private LocalDateTime StartDay, EndDay;
    private float Price,PriceDifference,CurrentPrice;

    public Product(int proID, String proName, String tinyDes, String fullDes, float price, float priceDifference, int catID, int userID, LocalDateTime startDay, LocalDateTime endDay,float currentPrice) {
        this.ProID = proID;
        this.ProName = proName;
        this.TinyDes = tinyDes;
        this.FullDes = fullDes;
        this.Price = price;
        this.PriceDifference = priceDifference;
        this.CatID = catID;
        this.UserID = userID;
        this.StartDay = startDay;
        this.EndDay = endDay;
        this.CurrentPrice = currentPrice;
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

    public float getPrice() {
        return Price;
    }

    public int getCatID() {
        return CatID;
    }

    public float getPriceDifference() {
        return PriceDifference;
    }

    public int getUserID() {
        return UserID;
    }

    public LocalDateTime getStartDay() {
        return StartDay;
    }

    public LocalDateTime getEndDay() {
        return EndDay;
    }

    public float getCurrentPrice() {
        return CurrentPrice;
    }
}