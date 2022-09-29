package com.example.jpahomework.controller;

import com.example.jpahomework.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ThucTapController {
    @Autowired
    TBLDeTaiRepository tblDeTaiRepository;
    @Autowired
    TBLGiangVienRepository tblGiangVienRepository;
    @Autowired
    TBLKhoaRepository tblKhoaRepository;
    @Autowired
    TBLSinhVienRepository tblSinhVienRepository;
    @Autowired
    TBLHuongDanRepository tblHuongDanRepository;

    @GetMapping("show-thuctap")
    public String show(Model model){
        model.addAttribute("khoaList", tblKhoaRepository.findAll());
        model.addAttribute("svList", tblSinhVienRepository.findAll());
        model.addAttribute("gvList", tblGiangVienRepository.findAll());
        model.addAttribute("hdList", tblHuongDanRepository.findAll());
        model.addAttribute("deTaiList", tblDeTaiRepository.findAll());

        return "index";
    }

}
