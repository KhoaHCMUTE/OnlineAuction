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
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
            case "/index":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("product",list);
                List<Bidding> listbidding = BiddingModel.findAll();
                request.setAttribute("listbidding",listbidding);
                List<User> users = UserModel.findAll();
                request.setAttribute("user",users);
                ServletUtils.forward("/views/product/index.jsp",request,response);
                break;
            case "/add":
                List<User> users2 = UserModel.findAll();
                request.setAttribute("user",users2);
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
                List<Product> products2 = ProductModel.findAll();
                request.setAttribute("product",products2);
                List<Bidding> listbidding2 = BiddingModel.findAll();
                request.setAttribute("listbidding",listbidding2);
                List<User> users3 = UserModel.findAll();
                request.setAttribute("user",users3);
                ServletUtils.forward("/views/product/vwAll.jsp",request,response);

                break;
            case "/ProSearch":
                String txtSr = request.getParameter("txtSr");
                List<Product> SrPro = ProductModel.findByTextSearch(txtSr);
                request.setAttribute("product",SrPro);
                List<Bidding> listbidding3 = BiddingModel.findAll();
                request.setAttribute("listbidding",listbidding3);
                List<User> users4 = UserModel.findAll();
                request.setAttribute("user",users4);
                ServletUtils.forward("/views/product/ProSearch.jsp", request, response);
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
                List<Product> listproduct = ProductModel.findAll();
                request.setAttribute("listproduct",listproduct);
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
        int proID = Integer.parseInt(request.getParameter("ProID"));
        float price = Float.parseFloat(request.getParameter("Price"));
        float priceDifference =Float.parseFloat(request.getParameter("PriceDifference"));
        int catID = Integer.parseInt(request.getParameter("CatID"));
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        float currentPrice = Float.parseFloat(request.getParameter("CurrentPrice"));

        String strSD = request.getParameter("StartDay");
        String strED = request.getParameter("EndDay");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime startDay = LocalDateTime.parse(strSD, df);
        LocalDateTime endDay = LocalDateTime.parse(strED, df);

        Product p = new Product(proID,name,tiny,full,price,priceDifference,catID,sellerID,startDay,endDay,currentPrice);
        ProductModel.add(p);
        Bidding b = new Bidding(proID,sellerID,price,sellerID, startDay);
        BiddingModel.addBid(b);
        ServletUtils.redirect("/admin/product/index", request, response);

        try{
            Part partmain = request.getPart("ImageMain");
            Part partsub1 = request.getPart("ImageSub1");
            Part partsub2 = request.getPart("ImageSub2");
            Part partsub3 = request.getPart("ImageSub3");
            String realPath = request.getServletContext().getRealPath("/public/imgs/sp");
   //         String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
            if(!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }
            partmain.write(realPath + "/" + proID + "/main" );
            partsub1.write(realPath + "/" + proID + "/sub1" );
            partsub2.write(realPath + "/" + proID + "/sub2" );
            partsub3.write(realPath + "/" + proID + "/sub3" );

        } catch (Exception e){
            e.printStackTrace();
        }

    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ProID"));
        int price = Integer.parseInt(request.getParameter("Price"));
        int priceDifference = Integer.parseInt(request.getParameter("PriceDifference"));
        int catID = Integer.parseInt(request.getParameter("CatID"));
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        int currentPrice = Integer.parseInt(request.getParameter("CurrentPrice"));
        String name = request.getParameter("ProName");
        String tiny = request.getParameter("TinyDes");
        String full = request.getParameter("FullDes");

        String strSD = request.getParameter("StartDay");
        String strED = request.getParameter("EndDay");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime startDay = LocalDateTime.parse(strSD, df);
        LocalDateTime endDay = LocalDateTime.parse(strED, df);

        Product p = new Product(id,name,tiny,full,price,priceDifference,catID,sellerID,startDay,endDay,currentPrice);
        ProductModel.update(p);
        ServletUtils.redirect("/admin/product/index", request, response);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ProID"));
        ProductModel.delete(id);
        ServletUtils.redirect("/admin/product/index", request, response);
    }
    private void addBidding(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float newPrice = Float.parseFloat(request.getParameter("NewPrice"));
        int proID = Integer.parseInt(request.getParameter("ProID"));
        int userID = Integer.parseInt(request.getParameter("UserID"));
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        float price = Float.parseFloat(request.getParameter("Price"));
        float priceDifference =  Float.parseFloat(request.getParameter("PriceDifference"));
        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        if ((price + priceDifference) > newPrice ){
            ServletUtils.redirect("/views/ErrorPrice.jsp",request,response);
        }
        else {
            Bidding b = new Bidding(proID , userID,newPrice, sellerID, day);
            BiddingModel.addBid(b);
            ServletUtils.redirect("/admin/product/vwAll", request, response);
        }
    }
    private void addCommentPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int proID = Integer.parseInt(request.getParameter("ProID"));
        int userID = Integer.parseInt(request.getParameter("ComUserID"));
        String text = request.getParameter("comment");

        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        CommentPro c = new CommentPro(proID,text,userID, day);
        CommentProModel.addCommentPro(c);
        ServletUtils.redirect("/admin/product/vwAll", request, response);
    }
}