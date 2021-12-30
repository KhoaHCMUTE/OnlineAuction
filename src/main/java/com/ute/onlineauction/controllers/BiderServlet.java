package com.ute.onlineauction.controllers;

import com.ute.onlineauction.beans.*;
import com.ute.onlineauction.models.*;
import com.ute.onlineauction.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "BiderServlet", value = "/bider/*")
public class BiderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/byUserID":
                List<User> users2 = UserModel.findAll();
                request.setAttribute("user",users2);
                List<Bidding> bidding2 = BiddingModel.findAll();
                request.setAttribute("bidding",bidding2);
                List<Product> products = ProductModel.findAll();
                request.setAttribute("product",products);
                int userid = Integer.parseInt(request.getParameter("userid"));
                List<Product> PriceByUser = ProductModel.findTop5HighestPriceByUser(userid);
                ServletUtils.forward("/views/product/bidinglist.jsp",request,response);
                break;
            case "/byuserID":
                List<User> users = UserModel.findAll();
                request.setAttribute("user",users);
                List<Bidding> bidding = BiddingModel.findAll();
                request.setAttribute("bidding",bidding);
                List<Product> product = ProductModel.findAll();
                request.setAttribute("product",product);
                ServletUtils.forward("/views/product/wonlist.jsp",request,response);
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
