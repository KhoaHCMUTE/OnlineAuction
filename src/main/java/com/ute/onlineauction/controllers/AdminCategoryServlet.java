package com.ute.onlineauction.controllers;

import com.ute.onlineauction.beans.Category;
import com.ute.onlineauction.models.CategoryModel;
import com.ute.onlineauction.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategoryServlet", value = "/admin/category/*")
public class AdminCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }
        switch (path) {
            case "/index":
                List<Category> list = CategoryModel.findAll();
                request.setAttribute("categories", list);
                ServletUtils.forward("/views/category/index.jsp", request, response);
                break;
            case "/add":
                ServletUtils.forward("/views/category/add.jsp", request, response);
                break;
            case "/edit":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }

                Category c = CategoryModel.findById(id);
                if (c != null) {
                    request.setAttribute("category", c);
                    ServletUtils.forward("/views/category/edit.jsp", request, response);
                } else {
                    ServletUtils.redirect("/views/category/index.jsp", request, response);
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
                addCategory(request, response);
                break;
            case "/Delete":
                deleteCategory(request,response);
                break;
            case "/Update":
                updateCategory(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("CatName");
        Category c = new Category(name);
        CategoryModel.add(c);
        ServletUtils.redirect("/admin/category/index", request, response);
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("CatID"));
        String name = request.getParameter("CatName");
        Category c = new Category(id, name);
        CategoryModel.update(c);
        ServletUtils.redirect("/admin/category/index", request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("CatID"));
        CategoryModel.delete(id);
        ServletUtils.redirect("/admin/category/index", request, response);
    }
}