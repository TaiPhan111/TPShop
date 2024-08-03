package com.phananhtai.shoppingOnline_service.dao;

import com.phananhtai.shoppingOnline_service.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {}