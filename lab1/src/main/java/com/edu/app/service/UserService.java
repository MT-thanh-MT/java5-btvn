package com.edu.app.service;

import com.edu.app.model.User;
import com.edu.app.respository.UserResponsitory;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UserService {
    private UserResponsitory userResp;

    public UserService() {
        this.userResp = new UserResponsitory();
    }

    public void create(HttpServletRequest request) throws Exception{
        User user = new User();
        BeanUtils.populate(user, request.getParameterMap());
        if (userResp.findByUsername(user.getUsername()) != null) {
            request.setAttribute("error", "Error: Username already exists!");
        } else {
            userResp.save(user);
            request.setAttribute("messenger", "Create successfully!");
        }
        request.setAttribute("registerUser", user);
    }
    public void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            User user = new User();
            BeanUtils.populate(user, request.getParameterMap());
            User oldUser = (User) request.getSession().getAttribute("userLogin");
            if (oldUser == null) {
                request.setAttribute("error", "Error: Username not exists!");
            } else {
                oldUser.setEmail(user.getEmail());
                oldUser.setFullname(user.getFullname());
                oldUser.setAddress(user.getAddress());
                oldUser.setAge(user.getAge());
                userResp.update(oldUser);
                request.setAttribute("messenger", "Update successfully!");
                request.getSession().setAttribute("userLogin", oldUser);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
    public void checkUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = userResp.findByUsername(username);

            if (user == null) {
                request.setAttribute("error", "Username is not exit!");
            } else if(!user.getPassword().equals(password)) {
                request.setAttribute("error", "Invalid password!");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("userLogin", user);
                session.setAttribute("username", username);
                request.setAttribute("messenger", "Login successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid username or password");
        }
    }

    public List<User> findAll() {
        return userResp.findAll();
    }

    public void changePassword(HttpServletRequest request, HttpServletResponse response) {
        String oldPassword = request.getParameter("oldPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String newPassword = request.getParameter("newPassword");
        User user = (User) request.getSession().getAttribute("userLogin");
        if (!oldPassword.equals(user.getPassword())) {
            request.setAttribute("error", "Old Password incorrect");
        } else if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Confirm Password incorrect");
        } else {
            try {
                user.setPassword(newPassword);
                userResp.update(user);
                request.setAttribute("messenger", "Update Password successful. Now please sing in again with new Password!");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Can't Update new Password!!!");
            }
        }
    }
}
