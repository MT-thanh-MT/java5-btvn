package com.edu.app.filter;

import com.edu.app.model.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter({"/list-user", "/account/edit-profile", "/account/sign-out", "/account/change-password"})
public class AuthFilter implements HttpFilter {

    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        String uri = request.getRequestURI();
        User user = (User) request.getSession().getAttribute("userLogin");
        String error = "";
        if (user == null) {
            error = response.encodeURL("Pleas sign in now!");
        }
        if (!error.isEmpty()) {
            request.getSession().setAttribute("securi", error);
            response.sendRedirect(request.getContextPath()+"/account/sign-in?error="+response.encodeURL(error));
        } else {
            chain.doFilter(request, response);
        }
    }
}
