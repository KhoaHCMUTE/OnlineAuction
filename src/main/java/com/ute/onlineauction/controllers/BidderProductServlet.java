package com.ute.onlineauction.controllers;

import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.models.ProductModel;
import com.ute.onlineauction.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BidderProductServlet", value = "/user/product/*")
public class BidderProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/vwAllPro";
        }
        switch (path) {
            case "/vwAllPro":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("product",list);
                ServletUtils.forward("/views/product/vwAllPro.jsp",request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
