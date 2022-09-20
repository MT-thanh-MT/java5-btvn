package com.edu.app.servlet;

import com.edu.app.model.User;
import com.edu.app.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet({"/account/sign-up", "/account/sign-in", "/account/sign-out", "/account/edit-profile", "/account/change-password"})
public class AccountServlet extends HttpServlet {
    private UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("sign-in")){
            request.getRequestDispatcher("/views/account/login.jsp").forward(request, response);
        } else if (uri.contains("sign-up")) {
            request.getRequestDispatcher("/views/account/register.jsp").forward(request, response);
        } else if (uri.contains("sign-out")) {
            request.getSession().removeAttribute("userLogin");
            request.getSession().removeAttribute("username");
            response.sendRedirect(request.getContextPath() + "/account/sign-in");
        } else if (uri.contains("edit-profile")) {
            request.getRequestDispatcher("/views/account/profile.jsp").forward(request, response);
        } else if (uri.contains("change-password")) {
            request.getRequestDispatcher("/views/account/changePassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("sign-in")){
            userService.checkUser(request, response);
            request.getSession().removeAttribute("securi");
            request.getRequestDispatcher("/views/account/login.jsp").forward(request, response);
        } else if (uri.contains("sign-up")) {
            try {
                userService.create(request);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error: Register Faile!");
            }
            request.getRequestDispatcher("/views/account/register.jsp").forward(request, response);
        } else if (uri.contains("edit-profile")) {
            userService.update(request,response);
            request.getRequestDispatcher("/views/account/profile.jsp").forward(request, response);
        } else if (uri.contains("change-password")) {
            userService.changePassword(request, response);
            request.getRequestDispatcher("/views/account/changePassword.jsp").forward(request, response);
        }
    }
}
