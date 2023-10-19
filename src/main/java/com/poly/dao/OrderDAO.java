package com.poly.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.model.Account;
import com.poly.model.Order;
import com.poly.model.OrderDetail;

public interface OrderDAO extends JpaRepository<Order, Long> {
	@Query("Select u from Order u where u.account = :account ")
	
	List<Order> findByUser(Account account);
	
	
	
	@Query("SELECT COUNT(o.account) FROM Order o where o.account = :account")
	int getOrderCountByUserId(Account account);

	List<Order> findByOrderDetail_Id(Long long1);

	
	
	
}
