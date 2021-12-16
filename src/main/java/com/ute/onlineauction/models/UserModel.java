package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

public class UserModel {

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
