package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Category;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class CategoryModel {
    public static List<Category> findAll() {
        final String query = "select * from category";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }

    public static Category findById(int id) {
        final String query = "select * from category where CatID = :CatID";
        try (Connection con = DbUtils.getConnection()) {
            List<Category> list = con.createQuery(query)
                    .addParameter("CatID", id)
                    .executeAndFetch(Category.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static void add(Category c) {
        String Sql = "insert into category(CatName) values (:CatName)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("CatName", c.getCatName())
                    .executeUpdate();
        }
    }

    public static void update(Category c) {
        String sql = "update category set CatName = :CatName where CatID = :CatID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("CatID", c.getCatID())
                    .addParameter("CatName", c.getCatName())
                    .executeUpdate();
        }

    }

    public static void delete(int id) {
        String sql = "delete from category where CatID = :CatID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("CatID",id)
                    .executeUpdate();
        }

    }
}



