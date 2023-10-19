package com.poly.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.model.OrderDetail;

public interface OrderDetailsDAO extends JpaRepository<OrderDetail, Long> {
	
//	@Query("SELECT o FROM Order o WHERE o.date BETWEEN :startDate AND :endDate")
//    List<OrderDetail> findOrdersInDateRange(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
	
	
	
	Page<OrderDetail> findByDateBetween(Date startDate, Date endDate, Pageable pageable);
}
