package com.phananhtai.shoppingOnline_service.implement;

import com.phananhtai.shoppingOnline_service.dao.ProductDAO;
import com.phananhtai.shoppingOnline_service.dto.ShoppingCartDTO;
import com.phananhtai.shoppingOnline_service.entity.Product;
import com.phananhtai.shoppingOnline_service.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Service
@SessionScope

public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Autowired
    private ProductDAO productDAO;
    private Map<Integer, ShoppingCartDTO> map = new HashMap<>();

    @Override
    public ShoppingCartDTO add(Integer id) {
        ShoppingCartDTO item = map.get(id);
        if (item == null) {
            Product product = productDAO.getProductByIdAndActive(id, true);
            if (product != null) {
                item = new ShoppingCartDTO();
                item.setId(product.getId());
                item.setName(product.getName());
                item.setPrice(product.getPrice());
                item.setQty(1);
                map.put(id, item);
            }
        } else {
            item.setQty(item.getQty() + 1);
        }
        return item;
    }

    @Override
    public void remove(Integer id) {
        map.remove(id);
    }

    @Override
    public ShoppingCartDTO update(Integer id, int qty) {
        ShoppingCartDTO item = map.get(id);
        if (item != null) {
            item.setQty(qty);
        }
        return item;
    }

    @Override
    public void clear() {
        map.clear();
    }

    @Override
    public Collection<ShoppingCartDTO> getProducts() {
        return map.values();
    }

    @Override
    public int getCount() {
        return map.size();
    }

    @Override
    public double getAmount() {
        return map.values().stream()
                .mapToDouble(item -> item.getPrice() * item.getQty())
                .sum();
    }
}
