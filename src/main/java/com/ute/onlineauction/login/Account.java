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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
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
                HttpSession Session = request.getSession();
                if((boolean) Session.getAttribute("Auth")) {
                    ServletUtils.redirect("/home/index",request,response);
                } else ServletUtils.forward("/views/login/login.jsp", request, response);
                break;
            case "/profile":
                ServletUtils.forward("/views/login/profile.jsp", request, response);
                break;
            case "/changepw":
                ServletUtils.forward("/views/login/cpassword.jsp", request, response);
                break;
            case "/isavailable":
                String UserName = request.getParameter("User");
                User User = UserModel.findByUserName(UserName);
                boolean false1 = (User == null);
                PrintWriter out = response.getWriter();

                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(false1);
                out.flush();
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
            case "/register":
                register(request, response);
                break;
            case "/login":
                login(request, response);
                break;
            case "/logout":
                logout(request, response);
                break;
            case "/changepw":
                changepw(request, response);
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
        String UserName = request.getParameter("UserName");
        String PassWord = request.getParameter("PassWord");

        User User = UserModel.findByUserName(UserName);
        if(User != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(PassWord.toCharArray(), User.getPassWord());
            if(result.verified) {
                HttpSession Session = request.getSession();
                Session.setAttribute("Auth", true);
                Session.setAttribute("AuthUser", User);

                String url = (String) Session.getAttribute("retUrl");
                if(url == null)
                    url = "/home/index";
                    ServletUtils.redirect(url,request,response);
                } else {
                    request.setAttribute("HasError", true);
                    request.setAttribute("ErrorMessage","Invalid Login");
                    ServletUtils.forward("/views/login/login.jsp",request,response);
                }
                    } else {
                        request.setAttribute("HasError", true);
                        request.setAttribute("ErrorMessage","Invalid Login");
                        ServletUtils.forward("/views/login/login.jsp",request,response);
                    }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                HttpSession Session = request.getSession();
                Session.setAttribute("Auth", false);
                Session.setAttribute("AuthUser", new User());

                String url = request.getHeader("referer");
                if (url == null)
                    url = "/home/index";
                ServletUtils.redirect(url,request,response);
    }
    private void changepw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String UserName = request.getParameter("UserName");
        String PassWord = request.getParameter("PassWord");

        User User = UserModel.findByUserName(UserName);
        if(User != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(PassWord.toCharArray(), User.getPassWord());
            if(result.verified) {
                HttpSession Session = request.getSession();
                Session.setAttribute("Auth", true);
                Session.setAttribute("AuthUser", User);

                String rawpwd = request.getParameter("rawpwd");
                String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
                User c = new User(UserName,bcryptHashString);
                UserModel.update(c);
                ServletUtils.redirect("/account/profile", request, response);

            } else {
                request.setAttribute("HError", true);
                request.setAttribute("Error","Please re-enter ");
                ServletUtils.forward("/views/login/cpassword.jsp",request,response);
            }
        } else {
            request.setAttribute("HError", true);
            request.setAttribute("Error","Please re-enter ");
            ServletUtils.forward("/views/login/cpassword.jsp",request,response);
        }
    }

}