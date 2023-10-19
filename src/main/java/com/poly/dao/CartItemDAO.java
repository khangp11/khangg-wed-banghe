package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.poly.model.Account;
import com.poly.model.CartItem;
import com.poly.model.Product;

@Repository
public interface CartItemDAO extends JpaRepository<CartItem, Integer> {
	@Query("Select u from CartItem u where u.account = :account ")

	List<CartItem> findByUser(Account account);

	@Transactional
	void deleteByAccount(@Param("account") Account account);

	@Query("Select u from CartItem u where u.account = :account and u.product = :product")
	CartItem findByUserAndProduct(Account account, Product product);

//	@Query("delete o from CartItem o WHERE o.user = :user and o.product = :product")
//	CartItem deleteByUserAndProduct(Account user, Product product);
	@Transactional
	void deleteByAccountAndProduct(Account account, Product product);

}
