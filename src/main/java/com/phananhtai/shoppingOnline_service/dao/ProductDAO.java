package com.phananhtai.shoppingOnline_service.dao;


import com.phananhtai.shoppingOnline_service.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Integer> {

        List<Product> findByPriceBetween(Double min, Double max);

        @Query("SELECT p FROM Product p WHERE p.name LIKE %:keywords% AND p.active = :active AND p.category.id = :categoryId " +
                "ORDER BY p.price ASC")
        Page<Product> findByKeywordsAndActiveAndCategoryOrderByPriceAsc(
                @Param("keywords") String keywords,
                @Param("active") boolean active,
                @Param("categoryId") Integer categoryId,
                Pageable pageable
        );

        @Query("SELECT p FROM Product p WHERE p.name LIKE %:keywords% AND p.active = :active AND p.category.id = :categoryId " +
                "ORDER BY p.price DESC")
        Page<Product> findByKeywordsAndActiveAndCategoryOrderByPriceDesc(
                @Param("keywords") String keywords,
                @Param("active") boolean active,
                @Param("categoryId") Integer categoryId,
                Pageable pageable
        );

        @Query("SELECT p FROM Product p WHERE p.name LIKE %:keywords% AND p.active = :active " +
                "ORDER BY p.price ASC")
        Page<Product> findByKeywordsAndActiveOrderByPriceAsc(
                @Param("keywords") String keywords,
                @Param("active") boolean active,
                Pageable pageable
        );

        @Query("SELECT p FROM Product p WHERE p.name LIKE %:keywords% AND p.active = :active " +
                "ORDER BY p.price DESC")
        Page<Product> findByKeywordsAndActiveOrderByPriceDesc(
                @Param("keywords") String keywords,
                @Param("active") boolean active,
                Pageable pageable
        );













        Page<Product> getAllByActiveOrderByIdAsc(boolean active,Pageable pageable);


        Page<Product> findByCreateDateBetween(Date before, Date after, Pageable pageable);

        Product getProductByIdAndActive(Integer id,Boolean active);
        Product getProductById(Integer id);


}
