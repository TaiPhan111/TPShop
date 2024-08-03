package com.phananhtai.shoppingOnline_service.controller.rest;

import com.phananhtai.shoppingOnline_service.dto.ShoppingCartDTO;
import com.phananhtai.shoppingOnline_service.service.ShoppingCartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/cart")
public class restShoppingCartController {

    @Autowired
    private ShoppingCartService cartService;

    @GetMapping("")
    public ResponseEntity<List<ShoppingCartDTO>> getAll() {
        try {
            Collection<ShoppingCartDTO> items = cartService.getProducts();
            List<ShoppingCartDTO> itemList = items.stream().collect(Collectors.toList());
            return ResponseEntity.ok(itemList);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(null);
        }
    }

    @GetMapping("/add/{id}")
    public ResponseEntity<String> add(@PathVariable("id") Integer id) {
        try {
            cartService.add(id);
            return ResponseEntity.ok("{\"message\": \"Item added to cart successfully.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"message\": \"Error adding item to cart.\"}");
        }
    }

    @GetMapping("/remove/{id}")
    public ResponseEntity<String> remove(@PathVariable("id") Integer id) {
        try {
            cartService.remove(id);
            return ResponseEntity.ok("{\"message\": \"Item removed from cart successfully.\"}");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"message\": \"Error removing item from cart.\"}");
        }
    }

    @GetMapping("/clear")
    public ResponseEntity<String> clear() {
        try {
            cartService.clear();
            return ResponseEntity.ok("{\"message\": \"Cart cleared successfully.\"}");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"message\": \"Error clearing cart.\"}");
        }
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<String> update(@PathVariable int id, @RequestParam("qty") int qty) {
        try {
            cartService.update(id, qty);
            return ResponseEntity.ok("{\"message\": \"Item quantity updated successfully.\"}");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"message\": \"Error updating item quantity.\"}");
        }
    }
    @GetMapping("/count")
    public ResponseEntity<Integer> getCount() {
        try {
            int count = cartService.getCount();
            return ResponseEntity.ok(count);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(null);
        }
    }
    @GetMapping("/amount")
    public ResponseEntity<Double> getAmount() {
        try {
            double amount = cartService.getAmount();
            return ResponseEntity.ok(amount);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(null);
        }
    }

}
