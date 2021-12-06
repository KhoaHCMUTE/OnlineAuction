package com.ute.onlineauction.controllers;

import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.models.ProductModel;
import com.ute.onlineauction.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductServlet", value = "/home/product/*")
public class AdminProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
//            case "/index":
//                ServletUtils.forward("/views/home/index.jsp",request,response);
//                break;
//            case "/login":
//                ServletUtils.forward("/views/login/login.jsp",request,response);
//                break;
//            case "/register":
//                ServletUtils.forward("/views/login/register.jsp",request,response);
//                break;
//            case "/product":
//                ServletUtils.forward("/views/product/index.jsp",request,response);
//                break;
            case "/index":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("products",list);
                ServletUtils.forward("/views/product/index.jsp",request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp",request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
