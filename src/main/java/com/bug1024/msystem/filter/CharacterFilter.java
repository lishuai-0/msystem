package com.bug1024.msystem.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

public class CharacterFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        chain.doFilter(request,response);
    }

    public void destroy() {

    }
}
