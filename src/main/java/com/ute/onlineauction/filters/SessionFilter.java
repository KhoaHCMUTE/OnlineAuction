package com.ute.onlineauction.filters;

import com.ute.onlineauction.beans.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "SessionFilter")
public class SessionFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession Session = request.getSession();
        if(Session.getAttribute("Auth") == null) {
            Session.setAttribute("Auth", false);
            Session.setAttribute("AuthUser", new User());
        }
        chain.doFilter(req, res);
    }
}
