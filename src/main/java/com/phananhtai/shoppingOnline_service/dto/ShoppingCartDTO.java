package com.phananhtai.shoppingOnline_service.dto;

import com.phananhtai.shoppingOnline_service.dao.ProductDAO;
import com.phananhtai.shoppingOnline_service.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingCartDTO {


    Integer id;
    String name;
    double price;
    int qty = 1;





}
