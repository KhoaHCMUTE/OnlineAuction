package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.beans.Score;
import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.beans.User1;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;


public class ScoreModel {
    public static void add(Score p) {
        String Sql = " insert into userscore (UserIDget, UserIDgive, Score, Day, Text) VALUES (:UserIDget, :UserIDgive, :Score, :Day, :Text)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("UserIDget", p.getUserIDget())
                    .addParameter("UserIDgive", p.getUserIDgive())
                    .addParameter("Score", p.getScore())
                    .addParameter("Day", p.getDay())
                    .addParameter("Text", p.getText())
                    .executeUpdate();
        }
    }

}
