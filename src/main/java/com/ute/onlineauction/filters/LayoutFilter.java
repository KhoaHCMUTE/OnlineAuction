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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebFilter(filterName = "LayoutFilter")
public class LayoutFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        List<Category> list = CategoryModel.findAll();
        request.setAttribute("categoriesWithDetails",list);
        List<Bidding> biddings = BiddingModel.findAll();
        request.setAttribute("bindding",biddings);
        List<User> users = UserModel.findAll();
        request.setAttribute("user",users);
        LocalDateTime localDateTime = LocalDateTime.now();
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String localDate = localDateTime.format(df);
        request.setAttribute("localDate",localDate);
        request.setAttribute("localDateNotFormatted",localDateTime);
        chain.doFilter(request, response);
    }
}
