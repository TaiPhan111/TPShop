package com.phananhtai.shoppingOnline_service.config;


import com.phananhtai.shoppingOnline_service.implement.AuthInterceptor;
import com.phananhtai.shoppingOnline_service.implement.GlobalInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Autowired
    GlobalInterceptor globalInterceptor;
    @Autowired
    AuthInterceptor authInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(globalInterceptor).addPathPatterns("/", "/about","/register","/login","/account","/product/**","/admin/**")//cho phép chia sẻ với các req
                .excludePathPatterns("/assets/**","/mail/mail", "/admin/home/index");// ngoại trừ các req
        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/account/**", "/admin/**")
                .excludePathPatterns("/assets/**", "/login", "/register");

    }

}
