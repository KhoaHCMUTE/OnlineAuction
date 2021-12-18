package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductModel {
    public static List<Product> findAll () {
        final String query = "select * from products";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static Product findById (int id) {
        final String query = "select * from products where ProID = :ProID";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("ProID",id)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static void add(Product p) {
        String Sql = " INSERT INTO products (ProName, TinyDes, FullDes, Price, PriceDifference, CatID, PerID) VALUES (:ProName,:TinyDes,:FullDes,:Price,:PriceDifference,:CatID,:PerID)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProName", p.getProName())
                    .addParameter("TinyDes", p.getTinyDes())
                    .addParameter("FullDes", p.getFullDes())
                    .addParameter("Price", p.getPrice())
                    .addParameter("PriceDifference", p.getPriceDifference())
                    .addParameter("CatID", p.getCatID())
                    .addParameter("PerID", p.getPerID())
                    .executeUpdate();
        }
    }

    public static void update(Product p) {
        String sql = "update products set  ProName = :ProName, TinyDes = :TinyDes, FullDes = :FullDes, Price = :Price, PriceDifference = :PriceDifference, CatID = :CatID, PerID = :PerID WHERE ProID = :ProID  ";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("ProName", p.getProName())
                    .addParameter("TinyDes", p.getTinyDes())
                    .addParameter("FullDes", p.getFullDes())
                    .addParameter("Price", p.getPrice())
                    .addParameter("PriceDifference", p.getPriceDifference())
                    .addParameter("CatID", p.getCatID())
                    .addParameter("PerID", p.getPerID())
                    .addParameter("ProID",p.getProID())
                    .executeUpdate();
        }

    }

    public static void delete(int id) {
        String sql = "delete from products where ProID = :ProID  ";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("ProID",id)
                    .executeUpdate();
        }

    }
}





