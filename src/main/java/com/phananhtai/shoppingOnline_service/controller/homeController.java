package com.phananhtai.shoppingOnline_service.controller;


import com.phananhtai.shoppingOnline_service.dao.AccountDAO;
import com.phananhtai.shoppingOnline_service.dao.ProductDAO;
import com.phananhtai.shoppingOnline_service.entity.Product;
import com.phananhtai.shoppingOnline_service.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@Controller
public class homeController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    AccountDAO accountDAO;
    @Autowired
    SessionService session;

    @GetMapping("/")  public String showIndex(Model model,
                                               @RequestParam("p") Optional<Integer> p) {

        Pageable pageable = PageRequest.of(p.orElse(0), 8);
        Page<Product> page = productDAO.getAllByActiveOrderByIdAsc(true,pageable);
        model.addAttribute("page", page);
        return "index";
    }



}
