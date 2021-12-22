package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Bidding;
import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class BiddingModel {
    public static void addBid(Bidding b) {
        String Sql = " INSERT INTO auctionhistory (ProID, UserID, Price) VALUES (:ProID,:UserID,:Price)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProID", b.getProID())
                    .addParameter("UserID",b.getUserID())
                    .addParameter("Price", b.getPrice())
                    .executeUpdate();
        }
    }
    public static Bidding getNewestPriceByID(int id) {
    final String Sql = "SELECT * FROM auctionhistory WHERE Price=(SELECT Max(Price) FROM auctionhistory WHERE ProID = :ProID)";
        try (Connection con = DbUtils.getConnection()) {
            List<Bidding> list = con.createQuery(Sql)
                    .addParameter("ProID", id)
                    .executeAndFetch(Bidding.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
}