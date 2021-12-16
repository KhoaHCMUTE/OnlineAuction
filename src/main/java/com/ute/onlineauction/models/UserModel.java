package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Category;
import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserModel {
    public static User findByUserName(String UserName) {
        final String query = "select * from users where UserName = :UserName";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("UserName", UserName)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
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
