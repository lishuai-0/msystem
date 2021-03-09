package com.bug1024.msystem.filter;

import com.bug1024.msystem.coma.domain.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class IdentifyFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }


    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpSession session = ((HttpServletRequest) servletRequest).getSession();
        User user = (User) session.getAttribute("loginUser");
        if (user!=null){
            //如果已经登录，则放行
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
                ((HttpServletRequest) servletRequest).getRequestDispatcher("index.jsp").forward(servletRequest,servletResponse);
        }
    }

    public void destroy() {

    }
}
