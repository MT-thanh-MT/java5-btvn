package com.example.modelattributehomework.controller;

import com.example.modelattributehomework.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {
    @GetMapping("product")
    public String displayProductForm(Model model){
        model.addAttribute("product", new Product());
        return "product/form";
    }

    @PostMapping("product-detail")
    public String productDetail(@ModelAttribute("product") Product product, Model model) {
        model.addAttribute("product", product);
        if(checkProduct(model, product)){
            return "product/result";
        } else {
            return "product/form";
        }
    }

    private boolean checkProduct(Model model, Product product) {
        boolean check = true;
        String blankMsg = "Please put something here";
        if (product.getProductName().trim().isBlank()) {
            model.addAttribute("nameError", blankMsg);
            check = false;
        }

        if (product.getPrice().trim().isBlank()) {
            model.addAttribute("priceError", blankMsg);
            check = false;
        } else if (!product.getPrice().matches("^\\d+$")) {
            model.addAttribute("priceError", "Invalid price format or price is negative number");
            check = false;
        } else if (product.getPrice().length() > 11) {
            model.addAttribute("priceError", "Price does not exceed 99999999999$");
            check = false;
        }

        if (product.getQuantity().trim().isBlank()) {
            model.addAttribute("quantityError", blankMsg);
            check = false;
        } else if (!product.getQuantity().matches("^\\d+$")) {
            model.addAttribute("quantityError", "Invalid quantity format or quantity is negative number");
            check = false;
        } else if (product.getQuantity().length() > 6) {
            model.addAttribute("quantityError", "Quantity does not exceed 999.999");
            check = false;
        }

        return check;
    }
}
