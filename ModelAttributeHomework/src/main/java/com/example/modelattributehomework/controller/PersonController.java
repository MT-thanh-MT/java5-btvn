package com.example.modelattributehomework.controller;

import com.example.modelattributehomework.model.Person;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

@Controller
public class PersonController {
    @GetMapping("person-info")
    public String displayPerson(Model model){
        model.addAttribute("person", new Person());
        return "person/form.html";
    }
    @PostMapping("person-info")
    public String personInfo(Model model,
                             @ModelAttribute("person") Person person) {
        model.addAttribute("person", person);
        if (personValidate(person, model)){
            return "person/result.html";
        } else {
            return "person/form.html";
        }

    }

    private boolean personValidate(Person person, Model model) {
        String blankMsg = "Please put something here";
        boolean check = true;
        if (person.getName().trim().isBlank()){
            model.addAttribute("nameError", blankMsg);
            check = false;
        }
        if (person.getBrithday().trim().isBlank()){
            model.addAttribute("brithdayError", blankMsg);
            check = false;
        } else {
            try{
                int nowYear = Calendar.getInstance().get(Calendar.YEAR);
                Calendar birth = Calendar.getInstance();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
                birth.setTime(sdf.parse(person.getBrithday()));
                int age = nowYear - birth.get(Calendar.YEAR);
                if (age <= 0){
                    model.addAttribute("brithdayError", "Year of birth must be greater than current");
                    check = false;
                } else {
                    model.addAttribute("age", age);
                }
            }catch (Exception e) {
                model.addAttribute("brithdayError", "Invalid Date Format (dd/MM/yyyy)!");
                e.printStackTrace();
                check = false;
            }
        }
        if (person.getAddress().trim().isBlank()){
            model.addAttribute("addressError", blankMsg);
            check = false;
        }
        return check;
    }
}
