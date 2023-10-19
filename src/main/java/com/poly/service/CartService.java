package com.poly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.AccountDAO;
import com.poly.dao.CartItemDAO;
import com.poly.dao.ProductDAO;
import com.poly.model.Account;
import com.poly.model.CartItem;
import com.poly.model.Product;

import jakarta.servlet.http.HttpSession;
@Service
public class CartService {
	@Autowired
	CartItemDAO dao;
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	HttpSession ses;
	
	public void addToCart(Account user , Product product , int quantity) {
		
		CartItem existingCartItem = dao.findByUserAndProduct(user, product);
		if(existingCartItem != null) {
			existingCartItem.setQuantity(existingCartItem.getQuantity()+1);
			dao.save(existingCartItem);
		}else {
			CartItem cartItem = new CartItem();
			cartItem.setAccount(user);
			cartItem.setProduct(product);
			cartItem.setQuantity(quantity);
			dao.save(cartItem);
			
		}
		
		
	}
	
	
	
	public void updateCart(Integer id , String pre) {
		if(pre.equals("plus")) {
			Account user = (Account) ses.getAttribute("userLogin");
			Product product = productDAO.findById(id).orElse(null);
		    CartItem cartItem = dao.findByUserAndProduct(user, product);
		    if (cartItem != null) {
		        cartItem.setQuantity(cartItem.getQuantity() + 1);
		        dao.save(cartItem);
		    }
			
		}else if(pre.equals("dis")) {
			Account user = (Account) ses.getAttribute("userLogin");
			Product product = productDAO.findById(id).orElse(null);
		    CartItem cartItem = dao.findByUserAndProduct(user, product);
		    if (cartItem != null && cartItem.getQuantity()>1) {
		        cartItem.setQuantity(cartItem.getQuantity() - 1);
		        dao.save(cartItem);
		    }
			
		}
	}
	

	public long getAmout(Account account) {
		List<CartItem> cartItem = dao.findByUser(account);
		long total = (long) cartItem.stream()
				.mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
				.sum();
		
		return total;
	}
	public int getCount(Account account) {
	    List<CartItem> cartItems = dao.findByUser(account);
	    
	    int totalCount = cartItems.stream()
	        .mapToInt(CartItem::getQuantity)
	        .sum();
	    
	    return totalCount;
	}

}
