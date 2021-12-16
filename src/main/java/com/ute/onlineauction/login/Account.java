package com.ute.onlineauction.login;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.models.UserModel;
import com.ute.onlineauction.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "Account", value = "/account/*")
public class Account extends HttpServlet {
    private Object User;
    private com.ute.onlineauction.beans.User c;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        switch (path) {
            case "/register":
                ServletUtils.forward("/views/login/register.jsp", request, response);
                break;
            case "/login":
                ServletUtils.forward("/views/login/login.jsp", request, response);
                break;
//            case "/Profile":
//                ServletUtils.forward("/views/category/index.jsp", request, response);
//                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/register":
                register(request, response);
                break;
            case "/login":
                login(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Name = request.getParameter("Name");

        String Email = request.getParameter("Email");

        String strDob = request.getParameter("Dob");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate Dob = LocalDate.parse(strDob, df);

        String UserName = request.getParameter("UserName");

        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

        int Permission = 0;

        User c = new User(0, UserName, bcryptHashString, Name, Email, Dob, Permission);
        UserModel.add(c);
        ServletUtils.forward("/views/login/register.jsp", request, response);
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}