package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CartItemDAO;
import com.poly.dao.ProductDAO;
import com.poly.model.Account;
import com.poly.model.CartItem;
import com.poly.model.Product;
import com.poly.model.Role;
import com.poly.model.RoleDetail;
import com.poly.service.AccountService;
import com.poly.service.CartService;
import com.poly.service.MailerService;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	SessionService session;

	@Autowired
	AccountService aService;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	CartItemDAO cartItemDAO;

	@Autowired
	CartService cartService;

	@Autowired
	MailerService mailer;

	@GetMapping({ "/", "/index" })
	public String index(Model model) {

		List<Product> items = productDAO.findAll();
		model.addAttribute("items", items);
		return "index";
	}

	@GetMapping("/user")
	public String checkout(Model model, HttpSession ses) {
		Account user = (Account) ses.getAttribute("userLogin");
		model.addAttribute("Amout", cartService.getAmout(user));

		List<CartItem> cart = cartItemDAO.findByUser(user);
		model.addAttribute("cartItems", cart);
		model.addAttribute("userDetail", session.get("user"));
		return "user";
	}

	@GetMapping("/login")
	public String formLogin(Model model, @RequestParam(value = "message", required = false) String message) {
		model.addAttribute("message", message);
		return "login";
	}


	@PostMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
	                    Model model, HttpSession session) {
	    try {
	        Account account = aService.findByUsername(username);

	        if (account != null && account.getPassword().equals(password)) {
	            model.addAttribute("message", "Đăng nhập thành công");
	            model.addAttribute("loginSuccess", true);
	            session.setAttribute("userLogin", account);
	            session.setAttribute("user", account);
	            if (this.checkAdmin(account)) {
	                session.setAttribute("userAdmin", "admin");
	            }
	            return "redirect:/index"; // or any other appropriate page after successful login
	        } else {
	            model.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
	        }
	    } catch (Exception e) {
	        model.addAttribute("message", "Đăng nhập thất bại");
	    }
	    return "login";
	}

	public Boolean checkAdmin(Account account) {
		for (RoleDetail roleDetail : account.getRoleDetails()) {
			if (roleDetail.getRole().getRole().equals("director")) {
				return true;
			}
		}
		return false;
	}

	@PostMapping("/register")
	public String signup(Model model, @ModelAttribute Account account) {
		if (aService.existsById(account.getUsername())) {
			model.addAttribute("error", "Đã tồn tại username " + account.getUsername());
			return null;
		} else {
			account.setActivated(true);

			account.setPhoto("logo.jpg");

			Role r = new Role();
			r.setRole("user");
			RoleDetail rd = new RoleDetail();
			rd.setAccount(account);
			rd.setRole(r);

			aService.save(account);
			aService.saveRoleDetail(rd);
			return "redirect:/register/success";
		}
	}

	@RequestMapping("/register/success")
	public String registerSuccess(Model model) {
		model.addAttribute("message", "Đăng ký thành công");
		return "login";
	}

	@RequestMapping("/logout")
	public String logoutSuccess(Model model, HttpSession ses) {
		session.remove("user");
		session.remove("userAdmin");
		session.remove("security-uri");
		session.remove("uri");
		model.addAttribute("message", "Đăng xuất thành công");
		ses.setAttribute("count", null);
		return "login";
	}

	@GetMapping("forgot-password")
	public String forgot() {
		return "forgot";
	}

	@PostMapping("forgot-password")
	public String forgot(@RequestParam("username") String username, Model model) {
		try {
			Account account = aService.findByUsername(username);
			String to = account.getEmail();
			String email = to.substring(0, 2);

			double randomDouble = Math.random();
			randomDouble = randomDouble * 1000000 + 1;
			int randomInt = (int) randomDouble;

			String subject = "Lấy lại mật khẩu";
			String body = "Mật khẩu của bạn là:" + randomInt;
			mailer.send(to, subject, body);

			account.setPassword(String.valueOf(randomInt));
			aService.save(account);

			model.addAttribute("message", "Mật khẩu mới đã được gửi đến mail " + email + "***");
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("message", "Invalid Username");
		}
		return "forgot";
	}

}
