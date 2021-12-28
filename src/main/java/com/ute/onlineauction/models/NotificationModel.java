package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.AuctionNotify;
import com.ute.onlineauction.beans.CommentPro;
import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class NotificationModel {
    public static void addNotify(AuctionNotify t) {
        String Sql = "INSERT INTO auctionnotify (SellerID,UserID,ProID,Status,Confirm,Day) VALUES (:SellerID,:UserID,:ProID,:Status,:Confirm,:Day)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProID", t.getProID())
                    .addParameter("UserID", t.getUserID())
                    .addParameter("SellerID",t.getSellerID())
                    .addParameter("Status",t.getStatus())
                    .addParameter("Confirm",t.getConfirm())
                    .addParameter("Day",t.getDay())
                    .executeUpdate();
        }
    }
    public static List<AuctionNotify> findByUserId (int id) {
        final String query = "select * from auctionnotify where UserID = :UserID order by Day desc";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("UserID",id)
                    .executeAndFetch(AuctionNotify.class);
        }
    }
}