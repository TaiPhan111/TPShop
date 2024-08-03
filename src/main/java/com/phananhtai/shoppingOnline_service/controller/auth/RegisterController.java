package com.phananhtai.shoppingOnline_service.controller.auth;

import com.phananhtai.shoppingOnline_service.dao.AccountDAO;
import com.phananhtai.shoppingOnline_service.dto.UserDTO;

import com.phananhtai.shoppingOnline_service.entity.Account;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegisterController {
    @Autowired
    AccountDAO accountDAO;

    @GetMapping("/register")
    public String showRegistration(Model model){
        model.addAttribute("create", new UserDTO());
        return "auth/register";
    }

    @PostMapping("/register")
    public String handleRegistration(@Valid @ModelAttribute("create") UserDTO user,
                                     BindingResult result,
                                     RedirectAttributes redirectAttributes) {
        // Kiểm tra lỗi xác thực
        if (result.hasErrors()) {
            return "auth/register";
        }

        // Kiểm tra sự tồn tại của tài khoản
        Account existingAccount = accountDAO.findByUsername(user.getUsername().trim());
        if (existingAccount != null) {
            result.rejectValue("username", "register.username", "register.username.exists");
            return "auth/register";
        }

        // Kiểm tra mật khẩu và xác nhận mật khẩu có khớp không
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            String errorMsg = "register.password.mismatch";
            result.rejectValue("password", "register.password", errorMsg);
            result.rejectValue("confirmPassword", "register.confirmPassword", errorMsg);
            return "auth/register";
        }

        // Tạo tài khoản mới và lưu vào cơ sở dữ liệu
        Account newAccount = new Account();
        newAccount.setUsername(user.getUsername().trim());
        newAccount.setPassword(user.getPassword());
        newAccount.setEmail(user.getEmail());
        newAccount.setAdmin(false);
        newAccount.setActivated(true);

        accountDAO.save(newAccount);

        // Thêm thông báo thành công và chuyển hướng
        redirectAttributes.addFlashAttribute("success", "register.success");
        return "redirect:/login?success=Registration successful!";
    }

}
