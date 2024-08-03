package com.phananhtai.shoppingOnline_service.dao;


import com.phananhtai.shoppingOnline_service.entity.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CategoryDAO extends JpaRepository<Category, String> {
    // Truy vấn tất cả
    Page<Category> findAll(Pageable pageable);
    List<Category> findByActive(boolean active);
    // Truy vấn theo active
    Page<Category> findByActive(boolean active, Pageable pageable);

    Optional<Category> findByIdAndActive(String id,boolean active);
}
