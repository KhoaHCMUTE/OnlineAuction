package com.ute.onlineauction.filters;

import com.ute.onlineauction.beans.Bidding;
import com.ute.onlineauction.beans.Category;
import com.ute.onlineauction.beans.User;
import com.ute.onlineauction.models.BiddingModel;
import com.ute.onlineauction.models.CategoryModel;
import com.ute.onlineauction.models.UserModel;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "LayoutFilter")
public class LayoutFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        List<Category> list = CategoryModel.findAll();
        req.setAttribute("categoriesWithDetails",list);
        List<Bidding> biddings = BiddingModel.findAll();
        req.setAttribute("bindding",biddings);
        List<User> users = UserModel.findAll();
        req.setAttribute("user",users);
        chain.doFilter(req, res);
    }
}
