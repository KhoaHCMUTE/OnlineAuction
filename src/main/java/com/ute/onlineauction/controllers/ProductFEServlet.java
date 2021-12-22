package com.ute.onlineauction.controllers;


import com.ute.onlineauction.beans.Product;
import com.ute.onlineauction.models.ProductModel;
import com.ute.onlineauction.utils.ServletUtils;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "ProductFEServlet", value = "/product/*")
public class ProductFEServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/bycat":
                int catId = Integer.parseInt(request.getParameter("id"));
               List<Product> list = ProductModel.findByCatId(catId);
                request.setAttribute("product",list);
                ServletUtils.forward("/views/product/bycat.jsp",request,response);
                break;
            case "/byUserID":
                int userid = Integer.parseInt(request.getParameter("userid"));
                List<Product> listuser = ProductModel.findByUserId(userid);
                request.setAttribute("product",listuser);
                ServletUtils.forward("/views/product/byUserID.jsp",request,response);
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
            default:
                ServletUtils.forward("/views/404.jsp",request,response);
                break;
    }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
