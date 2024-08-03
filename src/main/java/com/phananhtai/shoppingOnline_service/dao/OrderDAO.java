package com.phananhtai.shoppingOnline_service.dao;


import com.phananhtai.shoppingOnline_service.entity.Order;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface OrderDAO extends JpaRepository<Order, Long> {
    Optional<Order> findByPhoneAndOderCode(Integer phone,String orderCode );
}