package com.example.demologin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String checkLogin(@RequestParam(name = "username") String username,
                                 @RequestParam(name = "password") String password,
                                 Model model) {
        boolean check = true;
        model.addAttribute("username", username);
        model.addAttribute("password", password);
        if (username.isEmpty()) {
            check = false;
            model.addAttribute("usernameError", "Username is empty!");
        } else if (!username.equals("admin")){
            check = false;
            model.addAttribute("usernameError", "Username is not exit!");
        }

        if (password.isEmpty()) {
            check = false;
            model.addAttribute("passError", "Password is empty!");
        } else if (!password.equals("123")) {
            check = false;
            model.addAttribute("passError", "Password Incorrect!");
        }

        if (check){
            model.addAttribute("success", "Login successfully!");
        }
        return "login";
    }
}
