package com.ute.onlineauction.models;

import com.ute.onlineauction.beans.Assess;
import com.ute.onlineauction.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class AssessModel {
    public static List<Assess> findAll () {
        final String query = "select * from assess";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Assess.class);
        }
    }
}
