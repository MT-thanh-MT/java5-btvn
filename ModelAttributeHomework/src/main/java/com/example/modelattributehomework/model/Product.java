package com.example.modelattributehomework.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Calendar;

@Data
public class Product {
    private String productName;
    private String price;
    private String quantity;
    private Calendar date;
    private BigDecimal total;

    public Calendar getDate() {
        return Calendar.getInstance();
    }

    public BigDecimal getTotal(){
        double totalPrice = Double.parseDouble(this.price) * Double.parseDouble(this.quantity);
        return BigDecimal.valueOf(totalPrice);
    }
}
