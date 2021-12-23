package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Bidding;
import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class BiddingModel {
    public static void addBid(Bidding b) {
        String Sql = " INSERT INTO auctionhistory (ProID, UserID, Price , SellerID) VALUES (:ProID,:UserID,:Price,:SellerID)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProID", b.getProID())
                    .addParameter("UserID",b.getUserID())
                    .addParameter("Price", b.getPrice())
                    .addParameter("SellerID", b.getSellerID())
                    .executeUpdate();
        }
    }

    public static List<Bidding> findAll () {
        final String query = "select * from auctionhistory ";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Bidding.class);
        }
    }
}