package com.ute.onlineauction.controllers;



import com.ute.onlineauction.beans.Bidding;
import com.ute.onlineauction.beans.CommentPro;
import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.models.BiddingModel;
import com.ute.onlineauction.models.CommentProModel;
import com.ute.onlineauction.models.ProductModel;
import com.ute.onlineauction.models.UserModel;
import com.ute.onlineauction.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductServlet", value = "/admin/product/*")
public class AdminProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }
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
                request.setAttribute("product",list);
                ServletUtils.forward("/views/product/index.jsp",request,response);
                break;
            case "/add":
                List<User> users = UserModel.findAll();
                request.setAttribute("user",users);
                List<Product> products = ProductModel.findAll();
                request.setAttribute("product",products);
                ServletUtils.forward("/views/product/add.jsp", request, response);
                break;
            case "/edit":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }

                Product p = ProductModel.findById(id);
                if (p != null) {
                    request.setAttribute("product", p);
                    ServletUtils.forward("/views/product/edit.jsp", request, response);
                } else {
                    ServletUtils.redirect("/views/product/index.jsp", request, response);
                }
                break;
            case "/vwAll":
                List<Product> productss = ProductModel.findAll();
                request.setAttribute("product",productss);
                List<Bidding> listbidding = BiddingModel.findAll();
                request.setAttribute("listbidding",listbidding);
                List<User> userss = UserModel.findAll();
                request.setAttribute("user",userss);
                ServletUtils.forward("/views/product/vwAll.jsp",request,response);
                break;
            case "/byProID":
                int ProId = 0;
                try {
                    ProId = Integer.parseInt(request.getParameter("ProId"));
                } catch (NumberFormatException e) {
                }
                Product c = ProductModel.findById(ProId);
                List<CommentPro> m = CommentProModel.getCommentByProID(ProId);
                List<Bidding> listbiddings = BiddingModel.findAll();
                request.setAttribute("listbidding",listbiddings);
                List<User> usersss = UserModel.findAll();
                request.setAttribute("user",usersss);
                if (c != null || m != null ) {
                    request.setAttribute("product", c);
                    request.setAttribute("comment", m);
                    ServletUtils.forward("/views/product/byProID.jsp", request, response);
                } else {
                    ServletUtils.redirect("/views/product/vwAll.jsp", request, response);
                }
                break;
            default:
                ServletUtils.forward("/views/404.jsp",request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/add":
                addProduct(request, response);
                break;
            case "/Delete":
                deleteProduct(request,response);
                break;
            case "/Update":
                updateProduct(request,response);
                break;
            case "/addBid":
                addBidding(request,response);
                break;
            case "/addCommentPro":
                addCommentPro(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("ProName");
        String tiny = request.getParameter("TinyDes");
        String full = request.getParameter("FullDes");
        int price = Integer.parseInt(request.getParameter("Price"));
        int priceDifference = Integer.parseInt(request.getParameter("PriceDifference"));
        int catID = Integer.parseInt(request.getParameter("CatID"));
        int userID = Integer.parseInt(request.getParameter("UserID"));
        String perID = request.getParameter("PerID");
        int proID = Integer.parseInt(request.getParameter("ProID"));
        Product p = new Product(proID,name,tiny,full,price,priceDifference,catID,perID,userID);
        ProductModel.add(p);
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        Bidding b = new Bidding(proID,sellerID,price,sellerID);
        BiddingModel.addBid(b);
        ServletUtils.redirect("/admin/product/index", request, response);
    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ProID"));
        int price = Integer.parseInt(request.getParameter("Price"));
        int priceDifference = Integer.parseInt(request.getParameter("PriceDifference"));
        int catID = Integer.parseInt(request.getParameter("CatID"));
        int userID = Integer.parseInt(request.getParameter("UserID"));
        String name = request.getParameter("ProName");
        String tiny = request.getParameter("TinyDes");
        String full = request.getParameter("FullDes");
        String perID = request.getParameter("PerID");
        Product p = new Product(id,name,tiny,full,price,priceDifference,catID,perID,userID);
        ProductModel.update(p);
        ServletUtils.redirect("/admin/product/index", request, response);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ProID"));
        ProductModel.delete(id);
        ServletUtils.redirect("/admin/product/index", request, response);
    }
    private void addBidding(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int price = Integer.parseInt(request.getParameter("NewPrice"));
        int proID = Integer.parseInt(request.getParameter("ProID"));
        int userID = Integer.parseInt(request.getParameter("UserID"));
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        Bidding b = new Bidding(proID,userID,price,sellerID);
        BiddingModel.addBid(b);
        ServletUtils.redirect("/admin/product/vwAll",request,response);
    }
    private void addCommentPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int proID = Integer.parseInt(request.getParameter("ProID"));
        int userID = Integer.parseInt(request.getParameter("ComUserID"));
        String text = request.getParameter("comment");
        CommentPro c = new CommentPro(proID, userID, text);
        CommentProModel.addCommentPro(c);
        ServletUtils.redirect("/admin/product/vwAll", request, response);
    }
}