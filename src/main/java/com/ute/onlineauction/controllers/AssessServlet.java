package com.ute.onlineauction.controllers;

import com.ute.onlineauction.beans.Assess;
import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.models.AssessModel;
import com.ute.onlineauction.models.UserModel;
import com.ute.onlineauction.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AssessServlet", value = "/assess/*")
public class AssessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }
        switch (path) {
            case "/index":
                List<User> users = UserModel.findAll();
                request.setAttribute("user",users);
                List<Assess> assess = AssessModel.findAll();
                request.setAttribute("assess",assess);
                ServletUtils.forward("/views/assess/index.jsp",request,response);
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
