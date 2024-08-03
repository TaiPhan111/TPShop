package com.phananhtai.shoppingOnline_service.controller;

import com.phananhtai.shoppingOnline_service.dao.ProductDAO;
import com.phananhtai.shoppingOnline_service.entity.Category;
import com.phananhtai.shoppingOnline_service.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class productController {
    @Autowired
    private ProductDAO productDAO;

    @GetMapping("/product")
    public String searchProducts(
            @RequestParam("keywords") Optional<String> keywords,
            @RequestParam("category") Optional<Integer> categoryId,
            @RequestParam("p") Optional<Integer> p,
            @RequestParam("orderByPrice") Optional<Integer> orderByPrice,


            Model model
    ) {
        String kw = keywords.orElse("");
        Integer catId = categoryId.orElse(null);
        Boolean orderByPriceAsc = orderByPrice.orElse(1) == 1;

        Pageable pageable = PageRequest.of(p.orElse(0), 12);
        Page<Product> products;
        if (catId != null) {
            products = orderByPriceAsc ?
                    productDAO.findByKeywordsAndActiveAndCategoryOrderByPriceAsc(kw, true, catId, pageable) :
                    productDAO.findByKeywordsAndActiveAndCategoryOrderByPriceDesc(kw, true, catId, pageable);
        } else {
            products = orderByPriceAsc ?
                    productDAO.findByKeywordsAndActiveOrderByPriceAsc(kw, true, pageable) :
                    productDAO.findByKeywordsAndActiveOrderByPriceDesc(kw, true, pageable);
        }

        model.addAttribute("page", products);
        model.addAttribute("kw", kw);
        model.addAttribute("categoryId", catId);
        model.addAttribute("orderByPrice", orderByPriceAsc);

        return "product";
    }

    @GetMapping("/product/{id}")
    public String showProductDetail(@PathVariable("id") Integer id,
                                    @RequestParam("p") Optional<Integer> p,
                                    Model model) {
        Optional<Product> productOpt = Optional.ofNullable(productDAO.getProductByIdAndActive(id, true));
        Page<Product> products;
        if (productOpt.isPresent()) {
            model.addAttribute("product", productOpt.get());

            Pageable pageable = PageRequest.of(p.orElse(0), 12);
            products=productDAO.findByKeywordsAndActiveAndCategoryOrderByPriceAsc("", true,Integer.parseInt(productOpt.get().getCategory().getId()), pageable);
            model.addAttribute("page", products);
            return "product-detail";
        } else {
            return "redirect:/product";
        }
    }





}
