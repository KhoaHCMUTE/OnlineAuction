package com.ute.onlineauction.controllers;


import com.ute.onlineauction.beans.*;
import com.ute.onlineauction.models.*;
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

@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
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
                request.setAttribute("product", list);
                List<Bidding> listbidding = BiddingModel.findAll();
                request.setAttribute("listbidding", listbidding);
                List<User> users = UserModel.findAll();
                request.setAttribute("user", users);
                ServletUtils.forward("/views/product/index.jsp", request, response);
                break;
            case "/add":

                List<User> users2 = UserModel.findAll();
                request.setAttribute("user", users2);
                List<Product> products = ProductModel.findAll();
                request.setAttribute("product", products);
                ServletUtils.forward("/views/product/add.jsp", request, response);
                break;
            case "/edit":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                List<Category> c = CategoryModel.findAll();
                request.setAttribute("categories", c);
                Product p = ProductModel.findById(id);
                if (p != null || c != null) {
                    request.setAttribute("product", p);
                    ServletUtils.forward("/views/product/edit.jsp", request, response);
                } else {
                    ServletUtils.redirect("/views/product/index.jsp", request, response);
                }
                break;
            case "/vwAll":
                List<Product> products2 = ProductModel.findAll();
                request.setAttribute("product", products2);
                List<Bidding> listbidding2 = BiddingModel.findAll();
                request.setAttribute("listbidding", listbidding2);
                List<User> users3 = UserModel.findAll();
                request.setAttribute("user", users3);
                ServletUtils.forward("/views/product/vwAll.jsp", request, response);

                break;
            case "/ProSearch":
                String txtSr = request.getParameter("txtSr");
                List<Product> SrPro = ProductModel.findByTextSearch(txtSr);
                request.setAttribute("product", SrPro);
                List<Bidding> listbidding3 = BiddingModel.findAll();
                request.setAttribute("listbidding", listbidding3);
                List<User> users4 = UserModel.findAll();
                request.setAttribute("user", users4);
                ServletUtils.forward("/views/product/ProSearch.jsp", request, response);
                break;
            case "/byProID":
                int ProId = 0;
                try {
                    ProId = Integer.parseInt(request.getParameter("ProId"));
                } catch (NumberFormatException e) {
                }
                Product c1 = ProductModel.findById(ProId);
                List<CommentPro> m = CommentProModel.getCommentByProID(ProId);
                List<Bidding> listbiddings = BiddingModel.findAll();
                request.setAttribute("listbidding", listbiddings);
                List<Product> listproduct = ProductModel.findAll();
                request.setAttribute("listproduct", listproduct);
                List<User> usersss = UserModel.findAll();

                request.setAttribute("user", usersss);
                if (c1 != null || m != null) {
                    request.setAttribute("product", c1);
                    request.setAttribute("comment", m);
                    ServletUtils.forward("/views/product/byProID.jsp", request, response);
                } else {
                    ServletUtils.redirect("/views/product/vwAll.jsp", request, response);
                }
                break;
            case "/resultProID":
                int resultId = 0;
                try {
                    resultId = Integer.parseInt(request.getParameter("ProID"));
                } catch (NumberFormatException e) {
                }
                LocalDateTime localDateTime = LocalDateTime.now();
                DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                String localDate = localDateTime.format(df);
                request.setAttribute("localDate",localDate);
                request.setAttribute("localDateNotFormatted",localDateTime);
                Product pro = ProductModel.findById(resultId);
                List<CommentPro> com = CommentProModel.getCommentByProID(resultId);
                List<Bidding> listbiddings1 = BiddingModel.findAll();
                request.setAttribute("listbidding", listbiddings1);
                List<Product> listproduct1 = ProductModel.findAll();
                request.setAttribute("listproduct", listproduct1);
                List<User> usersss1 = UserModel.findAll();
                request.setAttribute("user", usersss1);
                List<Bidding> top3bid = BiddingModel.findtop3byProID(resultId);
                request.setAttribute("top3bid", top3bid);
                if (pro != null || com != null) {
                    request.setAttribute("product", pro);
                    request.setAttribute("comment", com);
                    ServletUtils.forward("/views/product/resultProID.jsp", request, response);
                } else {
                    ServletUtils.redirect("/views/product/vwAll.jsp", request, response);
                }
                break;
            case "/Notify":
                int UserID = 0;
                try {
                    UserID = Integer.parseInt(request.getParameter("UserID"));
                } catch (NumberFormatException e) {
                }
                List<AuctionNotify> Not = NotificationModel.findByUserId(UserID);
                request.setAttribute("NotifyByUser", Not);
                List<AuctionNotify> NotSeller = NotificationModel.findBySellerId(UserID);
                request.setAttribute("NotifyBySeller", NotSeller);
                List<Product> Prolist = ProductModel.findAll();
                request.setAttribute("product", Prolist);
                List<Bidding> listbidding1 = BiddingModel.findAll();
                request.setAttribute("listbidding", listbidding1);
                List<User> users1 = UserModel.findAll();
                request.setAttribute("user", users1);
                ServletUtils.forward("/views/product/Notify.jsp", request, response);
                break;
            case "/PayOrNot":
                int ProID = 0;
                int UserId = 0;
                int NotifyID = 0;

                try {
                    ProID = Integer.parseInt(request.getParameter("ProID"));
                    UserId = Integer.parseInt(request.getParameter("UserID"));
                    NotifyID = Integer.parseInt(request.getParameter("NotifyID"));

                } catch (NumberFormatException e) {
                }
                Product c2 = ProductModel.findById(ProID);
                List<CommentPro> m1 = CommentProModel.getCommentByProID(ProID);
                List<Bidding> listbiddings2 = BiddingModel.findAll();
                request.setAttribute("listbidding", listbiddings2);
                List<Product> listproduct2 = ProductModel.findAll();
                request.setAttribute("listproduct", listproduct2);
                List<User> usersss2 = UserModel.findAll();
                request.setAttribute("user", usersss2);
                List<Bidding> b1 = BiddingModel.findByProIDandUserID(UserId, ProID);
                request.setAttribute("bid", b1);
                List<AuctionNotify> NotifyByID = NotificationModel.findByID(NotifyID);
                request.setAttribute("NotifyByID", NotifyByID);

                if (c2 != null || m1 != null) {
                    request.setAttribute("product", c2);
                    request.setAttribute("comment", m1);
                    ServletUtils.forward("/views/product/PayOrNot.jsp", request, response);
                } else {
                    ServletUtils.redirect("/views/product/index.jsp", request, response);
                }
                break;

            case "/LikeOrNot":
                int ProID1 = 0;
                int UserId1 = 0;
                int NotifyID1 = 0;

                try {
                    ProID1 = Integer.parseInt(request.getParameter("ProID"));
                    UserId1 = Integer.parseInt(request.getParameter("UserID"));
                    NotifyID1 = Integer.parseInt(request.getParameter("NotifyID"));

                } catch (NumberFormatException e) {
                }
                Product c3 = ProductModel.findById(ProID1);
                List<CommentPro> m2 = CommentProModel.getCommentByProID(ProID1);
                List<Bidding> listbiddings3 = BiddingModel.findAll();
                request.setAttribute("listbidding", listbiddings3);
                List<Product> listproduct3 = ProductModel.findAll();
                request.setAttribute("listproduct", listproduct3);
                List<User> usersss3 = UserModel.findAll();
                request.setAttribute("user", usersss3);
                List<Bidding> b2 = BiddingModel.findByProIDandUserID(UserId1, ProID1);
                request.setAttribute("bid", b2);
                List<AuctionNotify> NotifyByID1 = NotificationModel.findByID(NotifyID1);
                request.setAttribute("NotifyByID", NotifyByID1);

                if (c3 != null || m2 != null) {
                    request.setAttribute("product", c3);
                    request.setAttribute("comment", m2);
                    ServletUtils.forward("/views/product/LikeOrNot.jsp", request, response);
                } else {
                    ServletUtils.redirect("/views/product/index.jsp", request, response);
                }
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
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
                deleteProduct(request, response);
                break;
            case "/Update":
                updateProduct(request, response);
                break;
            case "/addBid":
                addBidding(request, response);
                break;
            case "/addCommentPro":
                addCommentPro(request, response);
                break;
            case "/sendNotify":
                SendNotify(request, response);
            case "/LikeOrNot":
                int PayOrNot = Integer.parseInt(request.getParameter("PayOrNot"));
                if (PayOrNot == 1) {
                    updateProductStatus(request, response);
                    YesPay(request,response);
                }
                if (PayOrNot == 2) {
                    NoPay(request, response);
                }
                PayOrNot(request, response);
                ToSeller(request, response);
                ResToSeller(request,response);
                ServletUtils.redirect("/admin/product/index", request, response);

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
        String txtProID = request.getParameter("txtProID");
        int proID = Integer.parseInt(request.getParameter("ProID"));
        float price = Float.parseFloat(request.getParameter("Price"));
        float priceDifference = Float.parseFloat(request.getParameter("PriceDifference"));
        int catID = Integer.parseInt(request.getParameter("CatID"));
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        float currentPrice = Float.parseFloat(request.getParameter("CurrentPrice"));
        int status = 0;

        String strSD = request.getParameter("StartDay");
        String strED = request.getParameter("EndDay");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime startDay = LocalDateTime.parse(strSD, df);
        LocalDateTime endDay = LocalDateTime.parse(strED, df);

        Product p = new Product(proID, name, tiny, full, price, priceDifference, catID, sellerID, startDay, endDay, currentPrice, status);
        ProductModel.add(p);
        Bidding b = new Bidding(proID, price, sellerID, sellerID, startDay);
        BiddingModel.addBid(b);
        Part partmain = request.getPart("ImageMain");
        Part partsub1 = request.getPart("ImageSub1");
        Part partsub2 = request.getPart("ImageSub2");
        Part partsub3 = request.getPart("ImageSub3");
        String realpath = "/public/imgs/sp/";
        String realpathall = realpath.concat(txtProID);
        String realPath = this.getServletContext().getRealPath(realpathall);
        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
            partmain.write(realPath + "/" + "main.jpg");
            partsub1.write(realPath + "/" + "sub1.jpg");
            partsub2.write(realPath + "/" + "sub2.jpg");
            partsub3.write(realPath + "/" + "sub3.jpg");
        } else {
            partmain.write(realPath + "/" + "main.jpg");
            partsub1.write(realPath + "/" + "sub1.jpg");
            partsub2.write(realPath + "/" + "sub2.jpg");
            partsub3.write(realPath + "/" + "sub3.jpg");
        }
        ServletUtils.redirect("/admin/product/index", request, response);

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ProID"));
        int price = Integer.parseInt(request.getParameter("Price"));
        int priceDifference = Integer.parseInt(request.getParameter("PriceDifference"));
        int catID = Integer.parseInt(request.getParameter("CatID"));
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        int currentPrice = Integer.parseInt(request.getParameter("CurrentPrice"));
        int status = Integer.parseInt(request.getParameter("Status"));
        String name = request.getParameter("ProName");
        String tiny = request.getParameter("TinyDes");
        String full = request.getParameter("FullDes");

        String strSD = request.getParameter("StartDay");
        String strED = request.getParameter("EndDay");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime startDay = LocalDateTime.parse(strSD, df);
        LocalDateTime endDay = LocalDateTime.parse(strED, df);

        Product p = new Product(id, name, tiny, full, price, priceDifference, catID, sellerID, startDay, endDay, currentPrice, status);
        ProductModel.update(p);
        ServletUtils.redirect("/admin/product/index", request, response);
    }

    private void updateProductStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ProID"));
        int status = Integer.parseInt(request.getParameter("UserID"));

        Product p = new Product(id, status);
        ProductModel.updateStatus(p);
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
        float priceDifference = Float.parseFloat(request.getParameter("PriceDifference"));
        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        if ((price + priceDifference) > newPrice) {
            ServletUtils.redirect("/views/ErrorPrice.jsp", request, response);
        } else {
            Bidding b = new Bidding(proID, newPrice, userID, sellerID, day);
            BiddingModel.addBid(b);
            ServletUtils.redirect("/admin/product/index", request, response);
        }
    }

    private void addCommentPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int proID = Integer.parseInt(request.getParameter("ProID"));
        int userID = Integer.parseInt(request.getParameter("ComUserID"));
        String text = request.getParameter("comment");

        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        CommentPro c = new CommentPro(proID, text, userID, day);
        CommentProModel.addCommentPro(c);
        ServletUtils.redirect("/admin/product/index", request, response);
    }

    private void SendNotify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int proID = Integer.parseInt(request.getParameter("ProID"));
        int userID = Integer.parseInt(request.getParameter("UserID"));
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        int status = Integer.parseInt(request.getParameter("Confirm"));
        int confirm = Integer.parseInt(request.getParameter("Status"));

        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        AuctionNotify a = new AuctionNotify(sellerID, userID, proID, status, confirm, day);
        NotificationModel.addNotify(a);

        ServletUtils.redirect("/admin/product/index", request, response);
    }

    private void PayOrNot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int NotID = Integer.parseInt(request.getParameter("NotifyID"));
        int proID = Integer.parseInt(request.getParameter("ProID"));
        int userID = Integer.parseInt(request.getParameter("UserID"));
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        int confirm = Integer.parseInt(request.getParameter("PayOrNot"));
        int status = 1;
        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        AuctionNotify a = new AuctionNotify(NotID, sellerID, userID, proID, status, confirm, day);
        NotificationModel.updateNot(a);
    }

    private void NoPay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int get = Integer.parseInt(request.getParameter("UserID"));
        int give = Integer.parseInt(request.getParameter("SellerID"));
        int score = 0;
        String text = "Bidder don't pay for winning product";
        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        Score a = new Score(get, give, score, day, text);
        ScoreModel.add(a);
    }

    private void YesPay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int get = Integer.parseInt(request.getParameter("UserID"));
        int give = Integer.parseInt(request.getParameter("SellerID"));
        int score = 1;
        String text = "Bidder pay for winning product";
        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        Score a = new Score(get, give, score, day, text);
        ScoreModel.add(a);
    }

    private void ToSeller(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int give = Integer.parseInt(request.getParameter("UserID"));
        int get = Integer.parseInt(request.getParameter("SellerID"));
        int score = Integer.parseInt(request.getParameter("LikeOrNot"));
        String text = request.getParameter("Comment");
        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        Score a = new Score(get, give, score, day, text);
        ScoreModel.add(a);
    }

    private void ResToSeller(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int NotID = Integer.parseInt(request.getParameter("NotifyID"));
        int proID = Integer.parseInt(request.getParameter("ProID"));
        int userID = Integer.parseInt(request.getParameter("UserID"));
        int sellerID = Integer.parseInt(request.getParameter("SellerID"));
        int confirm = Integer.parseInt(request.getParameter("PayOrNot"));

        int status = 2;
        String strD = request.getParameter("Day");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime day = LocalDateTime.parse(strD, df);

        AuctionNotify a = new AuctionNotify(NotID, sellerID, userID, proID, status, confirm, day);
        NotificationModel.updateNot(a);


    }
}

