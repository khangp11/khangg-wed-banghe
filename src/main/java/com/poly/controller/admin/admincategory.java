package com.poly.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDetailsDAO;
import com.poly.model.Account;
import com.poly.model.Category;
import com.poly.model.Order;
import com.poly.model.OrderDetail;
import com.poly.model.RoleDetail;

@Controller
public class admincategory {
	@Autowired
	CategoryDAO dao;
	@Autowired
	OrderDetailsDAO orderdao;
	
	@GetMapping("/admin/category")
	public String category(Model model,@RequestParam("p") Optional<Integer> p) {
		int pageValue = p.orElse(0);
	    if (pageValue < 0) {
	        pageValue = 0; // If p is less than 0, set it to 0
	    }
	    Pageable pageable = PageRequest.of(pageValue, 6);
		Category item = new Category();
		model.addAttribute("item", item);
		Page<Category> page = dao.findAll(pageable);
		model.addAttribute("page",page);
		
		if (page.isEmpty()) {
	        int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
	        pageable = PageRequest.of(lastPage, 6);
	        page = dao.findAll(pageable);
	        model.addAttribute("page", page);
	        pageValue = lastPage;
	    }
		return "admin/category";
	}
	
	@RequestMapping("/admin/categoryEdit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Category item = dao.findById(id).orElse(new Category()); 																	// may not exist.
		model.addAttribute("item", item);
		
		Page<Category> page = dao.findAll(pageable);
		model.addAttribute("page",page);
				
		return "admin/category";
	}
	
	@RequestMapping("/admin/categoryresest")
	public String roleresest() {
		
		return "redirect:/admin/category";
	}
	
	@RequestMapping("/admin/categoryCreate")
	public String create(Category item) {   
	    dao.save(item);
	    return "redirect:/admin/category";
	}
	
	@RequestMapping("/admin/categoryupdate")
	public String roleupdate(Category item) {
		dao.save(item);
		return "redirect:/admin/categoryEdit/" + item.getId();
	}
	
	@RequestMapping("/admin/categorydelete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		dao.deleteById(id);
	    return "redirect:/admin/category";
	}
	
}
