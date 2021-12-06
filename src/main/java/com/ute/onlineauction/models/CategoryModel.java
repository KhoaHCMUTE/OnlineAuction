package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Category;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

public class CategoryModel {
    public static List<Category> findAll () {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/abc", "root" , "");
        final String query = "select * from category";
        try (Connection con = sql2o.open()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
}
