package com.btvn.lab2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeWorkController {
    @RequestMapping("/bai1")
    public String bai1(@RequestParam(name = "str1") String str1,
                        @RequestParam(name = "str2") String str2,
                        Model model) {
        String showStr = (str1.length() > str2.length() ? str1 : str2);
        model.addAttribute("showResult", showStr);
        model.addAttribute("title", "Displays strings of greater length");
        return "index";
    }

    @RequestMapping("/bai2")
    public String bai2(@RequestParam(name = "str1") String str1,
                       Model model) {
        String showStr = new StringBuilder(str1).reverse().toString();
        model.addAttribute("showResult", showStr);
        model.addAttribute("title", "Chain inversion");
        return "index";
    }

    @RequestMapping("/bai3")
    public String bai3(@RequestParam(name = "number") int number,
                       Model model) {
        int prime;
        int i = 1;
        while (true) {
            if (isPrimeNumber(number + i)){
                prime = number + i;
                break;
            }
            i++;
        }
        model.addAttribute("showResult", prime);
        model.addAttribute("title", "Prime less than number");
        return "index";
    }

    public boolean isPrimeNumber(int n) {
        if (n < 2) {
            return false;
        }
        int squareRoot = (int) Math.sqrt(n);
        for (int i = 2; i <= squareRoot; i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}
