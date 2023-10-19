package com.poly.controller;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CartItemDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailsDAO;
import com.poly.model.Account;
import com.poly.model.CartItem;
import com.poly.model.Order;
import com.poly.model.OrderDetail;
import com.poly.service.CartService;
import com.poly.service.OrderService;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	
	@Autowired
	CartItemDAO cartItemDAO;
	@Autowired
	SessionService session;
	@Autowired
	OrderService service;
	@Autowired
	CartService cartService;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailsDAO detalDao;

	@GetMapping("/order")
	public String checkout(Model model, HttpSession ses) {

		Account user = (Account) ses.getAttribute("userLogin");
		List<CartItem> cart = cartItemDAO.findByUser(user);
		model.addAttribute("cartItems", cart);
		model.addAttribute("userDetail", session.get("user"));
		model.addAttribute("Amount", cartService.getAmout(user));
		ses.setAttribute("count", cartService.getCount(user));
		return "user";
	}
	@PostMapping("/order")
	public String add(Model model,HttpSession ses,@RequestParam("account") Account account, @RequestParam("address") String address) {
		Account user = (Account) ses.getAttribute("userLogin");
		List<CartItem> cart = cartItemDAO.findByUser(user);
		OrderDetail od = new OrderDetail(); 
		od.setPrice((double) cartService.getAmout(user));
		od.setQuantity(cartService.getCount(user));
		od.setDate(new Date());
		od.setTrangThai("chuagiao");
		od.setAddress(address);
		detalDao.save(od);
		for (CartItem cartItem : cart) {
		    Order order = new Order(); // Tạo một đối tượng Order mới cho mỗi mục trong danh sách cart
		    ses.setAttribute("count", cartService.getCount(user));
		    order.setAccount(account);
		    order.setProduct(cartItem.getProduct()); // Gán sản phẩm từ cartItem cho order
		    order.setQuantity(cartItem.getQuantity());
		    order.setCreateDate(new Date());
		    order.setAddress(address);
		    order.setOrderDetail(od);
		    model.addAttribute("order", order);
		    service.add(order); // Thêm order mới vào cơ sở dữ liệu
		}		
//		Order orderSaved = service.add(order);
		
		
		model.addAttribute("cartItems", cart);
		model.addAttribute("userDetail", session.get("user"));
		model.addAttribute("Amount", cartService.getAmout(user));
//		model.addAttribute("order",);
		
		
		//xoá hết giỏ hàng - sau khi đặt hàng
		
		cartItemDAO.deleteByAccount(user);

		return "thankyou";
	}
	
	@RequestMapping("/orderdetail")
	public String totalOrder(Model model, HttpSession session) {
		
		// đếm số lần đã mua hàng
		Account user = (Account) session.getAttribute("userLogin");
		int orderCountByUser = orderDAO.getOrderCountByUserId(user);
		session.setAttribute("count", cartService.getCount(user));
		model.addAttribute("orderCount",orderCountByUser);
		
		//đổ lại list order theo user
		List<Order> order1 = orderDAO.findByUser(user);
		model.addAttribute("orders",order1);
		
		
		
		return "totalorder";
	}
	
	
}
