package com.ute.onlineauction.controllers;

import com.ute.onlineauction.beans.Assess;
import com.ute.onlineauction.beans.CommentPro;
import com.ute.onlineauction.beans.Score;
import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.models.AssessModel;
import com.ute.onlineauction.models.CommentProModel;
import com.ute.onlineauction.models.ScoreModel;
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
        switch (path) {
            case "/index":
                int UserId = 0;
                try {
                    UserId = Integer.parseInt(request.getParameter("UserId"));
                } catch (NumberFormatException e) {
                }
                List<User> users = UserModel.findAll();
                request.setAttribute("listuser",users);
                List<Score> scores = ScoreModel.findAll();
                request.setAttribute("score",scores);
                User m = UserModel.findById(UserId);
                if ( m != null) {
                    request.setAttribute("user", m);
                    ServletUtils.forward("/views/assess/index.jsp", request, response);
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
    }
}
