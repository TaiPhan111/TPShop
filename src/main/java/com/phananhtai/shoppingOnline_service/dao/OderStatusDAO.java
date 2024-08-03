package com.phananhtai.shoppingOnline_service.dao;

import com.phananhtai.shoppingOnline_service.entity.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface OderStatusDAO extends JpaRepository<OrderStatus,Long> {
    Optional<OrderStatus> findById(Long id);
}
