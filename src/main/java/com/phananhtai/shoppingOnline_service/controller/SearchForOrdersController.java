package com.phananhtai.shoppingOnline_service.controller;

import com.phananhtai.shoppingOnline_service.dao.OrderDAO;
import com.phananhtai.shoppingOnline_service.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class SearchForOrdersController {
    @Autowired
    OrderDAO orderDAO;
    @GetMapping("/search-order")
    public String searchOrder(@RequestParam(name = "code", required = false) String orderCode,
                              @RequestParam(name = "phone", required = false) Integer phone,
                              Model model) {
        if (orderCode == null || orderCode.isEmpty() || phone == null || phone == 0) {
            model.addAttribute("error", "Vui lòng nhập mã đơn hàng và số điện thoại để tìm kiếm.");
            return "SearchForOrders";
        }

        Optional<Order> orderSearch = orderDAO.findByPhoneAndOderCode(phone, orderCode);
        if (orderSearch.isPresent()) {
            model.addAttribute("order", orderSearch.get());
        } else {
            model.addAttribute("error", "Không tìm thấy đơn hàng nào với mã " + orderCode + " và số điện thoại " + phone);
        }
        return "SearchForOrders";
    }

}
