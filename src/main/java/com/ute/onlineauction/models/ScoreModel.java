package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.*;
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

    public static List<Score> findAll () {
        final String query = "select * from userscore";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Score.class);
        }
    }

}
