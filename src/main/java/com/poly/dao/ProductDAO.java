package com.poly.dao;


import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.model.Product;

public interface ProductDAO extends JpaRepository<Product, Integer>{
Page<Product> findByPriceBetween(double minPrice, double maxPrice, Pageable pageable);
	
	@Query("SELECT DISTINCT p FROM Product p, Category pc WHERE p.category.id = pc.id AND pc.id = :cid")
	public Page<Product> findByCategory1(@Param("cid") Optional<String> cid, Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
	Page<Product> findByKeywords(String keywords, Pageable pageable);
}

