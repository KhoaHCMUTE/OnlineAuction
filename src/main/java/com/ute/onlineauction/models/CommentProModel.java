package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Bidding;
import com.ute.onlineauction.beans.Category;
import com.ute.onlineauction.beans.CommentPro;
import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class CommentProModel {
    public static void addCommentPro(CommentPro c) {
        String Sql = "INSERT INTO commentpro(ProID,UserID,text, Day) VALUES (:ProID,:UserID,:text, :Day)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProID", c.getProID())
                    .addParameter("UserID", c.getUserID())
                    .addParameter("text", c.getText())
                    .addParameter("Day", c.getDay())
                    .executeUpdate();
        }
    }
    public static List<CommentPro> getCommentByProID (int id) {
        final String query = "select * from commentpro where ProID = :ProID";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("ProID",id)
                    .executeAndFetch(CommentPro.class);
        }
    }
}