package com.poly.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.dao.CartItemDAO;
import com.poly.dao.ProductDAO;
import com.poly.model.Account;
import com.poly.model.CartItem;
import com.poly.model.Product;
import com.poly.service.CartService;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	AccountDAO accountDAO;

	@Autowired
	CartItemDAO cartItemDAO;
	@Autowired
	CartService cartService;
	@Autowired
	SessionService session;
	
	

//	@RequestMapping("/detail/{id}")
//	public String edit(Model model, @PathVariable("id") Integer id) {
//		Product item = productDAO.findById(id).orElse(new Product());
//
//		model.addAttribute("item", item);
//
//		return "detail";
//	}

	
	@GetMapping("/cart")
	public String cart(Model model, HttpSession ses) {

		Account user = (Account) ses.getAttribute("userLogin");

		if (user != null) {
			List<CartItem> cart = cartItemDAO.findByUser(user);
			model.addAttribute("cartItems", cart);
		}
		if (user != null) {
			model.addAttribute("Amout", cartService.getAmout(user));
			ses.setAttribute("count", cartService.getCount(user));
		}

		return "cart";
	}

	@PostMapping("/cart/add")
	public String addCart(@RequestParam Integer productId, @RequestParam int quantity, HttpSession ses) {
		Account user = (Account) ses.getAttribute("userLogin");
		Product product = productDAO.findById(productId).orElse(null);
		cartService.addToCart(user, product, quantity);
		ses.setAttribute("count", cartService.getCount(user));
		return "redirect:/cart";
		
	}

	@RequestMapping("/cart/update/{id}/{pre}")
	public String update(@PathVariable("id") Integer id, @PathVariable("pre") String pre, HttpSession ses) {

		Account user = (Account) ses.getAttribute("userLogin");
		cartService.updateCart(id, pre);
		ses.setAttribute("count", cartService.getCount(user));
		return "redirect:/cart";

	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id, HttpSession ses) {
		Account user = (Account) ses.getAttribute("userLogin");
		Product product = productDAO.findById(id).orElse(null);
		cartItemDAO.deleteByAccountAndProduct(user, product);

		return "redirect:/cart";
	}

}
