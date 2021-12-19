package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Bidding;
import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

public class BiddingModel {
    public static void addBid(Bidding b) {
        String Sql = " INSERT INTO auctionhistory (ProID, Price) VALUES (:ProID,:Price)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProID", b.getProID())
                    .addParameter("Price", b.getPrice())
                    .executeUpdate();
        }
    }
}