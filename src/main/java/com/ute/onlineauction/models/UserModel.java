package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

public class UserModel {

//
//    public static Category findById(int id) {
//        final String query = "select * from category where CatID = :CatID";
//        try (Connection con = DbUtils.getConnection()) {
//            List<Category> list = con.createQuery(query)
//                    .addParameter("CatID", id)
//                    .executeAndFetch(Category.class);
//            if (list.size() == 0) {
//                return null;
//            }
//            return list.get(0);
//        }
//    }

    public static void add(User c) {
        String Sql = "INSERT INTO users (UserName, PassWord, Name, Email, Dob, Permission) VALUES (:UserName,:PassWord,:Name,:Email,:Dob,:Permission)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("UserName", c.getUserName())
                    .addParameter("PassWord", c.getPassWord())
                    .addParameter("Name", c.getName())
                    .addParameter("Email", c.getEmail())
                    .addParameter("Dob", c.getDob())
                    .addParameter("Permission", c.getPermission())
                    .executeUpdate();
        }
    }
}
