package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.beans.User1;
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
        String Sql = "INSERT INTO users (UserName, PassWord, Name, Email, Dob, Permission, Notify) VALUES (:UserName,:PassWord,:Name,:Email,:Dob,:Permission,:Notify)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("UserName", c.getUserName())
                    .addParameter("PassWord", c.getPassWord())
                    .addParameter("Name", c.getName())
                    .addParameter("Email", c.getEmail())
                    .addParameter("Dob", c.getDob())
                    .addParameter("Permission", c.getPermission())
                    .addParameter("Notify",c.getNotify())
                    .executeUpdate();
        }
    }
    public static List<User> findAll () {
        final String query = "select * from users";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(User.class);
        }
    }
    public static User findById(int id) {
        final String query = "select * from users where ID = :ID";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("ID", id)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static void update(User c) {
        String sql = "update users set PassWord = :PassWord where UserName = :UserName";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("UserName",c.getUserName())
                    .addParameter("PassWord",c.getPassWord())
                    .executeUpdate();
        }
    }
    public static void update2(User1 c) {
        String sql = "update users set UserName = :UserName where Name = :Name";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("UserName",c.getUserName())
                    .addParameter("Name",c.getName())
                    .executeUpdate();
        }
    }
    public static void update1(User a) {
        String sql = "update users set Permission = :Permission where UserName = :UserName";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("UserName",a.getUserName())
                    .addParameter("Permission",a.getPermission())
                    .executeUpdate();
        }
    }
    public static void notify(User c) {
        String sql = "update users set Notify = :Notify where ID = :ID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("ID",c.getId())
                    .addParameter("Notify",c.getNotify())
                    .executeUpdate();
        }
    }
}
