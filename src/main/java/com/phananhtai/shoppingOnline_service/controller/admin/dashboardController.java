package com.phananhtai.shoppingOnline_service.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class dashboardController {
    @GetMapping("/admin")
    public String showDashboard(){
        return "admin/dashboard";
    }
}
