package com.phananhtai.shoppingOnline_service.controller.rest;

import com.phananhtai.shoppingOnline_service.dao.AccountDAO;
import com.phananhtai.shoppingOnline_service.dao.ProductDAO;
import com.phananhtai.shoppingOnline_service.entity.Product;
import com.phananhtai.shoppingOnline_service.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class restProductController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    AccountDAO accountDAO;
    @Autowired
    SessionService session;

    @GetMapping("/api/v1/products")
    public Page<Product> getProducts(@RequestParam(name = "page", defaultValue = "0") int page,
                                     @RequestParam(name = "size", defaultValue = "8") int size,
                                     @RequestParam(name = "active", defaultValue = "true") boolean active) {
        Pageable pageable = PageRequest.of(page, size);
        return productDAO.getAllByActiveOrderByIdAsc(active, pageable);
    }

}
