package com.phananhtai.shoppingOnline_service.controller.auth;

import com.phananhtai.shoppingOnline_service.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Locale;

@Controller
public class LogoutController {
    @Autowired
    SessionService sessionService;
    @Autowired
    MessageSource messageSource;
    @GetMapping("/logout")
    public String logout(Model model, RedirectAttributes redirectAttributes, Locale locale){
        redirectAttributes.addFlashAttribute("success", messageSource.getMessage("logout.success", null, locale));
        sessionService.remove("user");
        return "redirect:/?logout";
    }
}
