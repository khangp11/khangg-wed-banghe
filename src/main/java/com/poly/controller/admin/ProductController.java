package com.poly.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.model.Product;
import com.poly.service.imgservice;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.model.Category;


@Controller
public class ProductController {
	
	@Autowired
	ServletContext app;
	@Autowired
	imgservice paramService;
	@Autowired
	ProductDAO prodDao;
	@Autowired
	CategoryDAO cateDAO;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/admin/product")
	public String admin(Model model,@RequestParam("p") Optional<Integer> p) {
		
		if (p.isPresent() && (p.get() < 0)) {
			String referer = request.getHeader("Referer");
			return "redirect:" + referer;
		}
		
		Product item = new Product(); 
		model.addAttribute("item", item);
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<Product> items = prodDao.findAll(pageable);
		
		if (p.isPresent() && (p.get() == items.getTotalPages())) {
			String referer = request.getHeader("Referer");
			return "redirect:" + referer;
		}
		
		model.addAttribute("page", items);				
		List<Category> category = cateDAO.findAll();
		model.addAttribute("category", category);
			
			return "admin/product";
	}
	@ModelAttribute("available")
	public Map<Boolean, String> getGenders() {
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Yes");
		map.put(false, "No");
		return map;
	}
	@PostMapping("/product/create")
	public String create(@Valid @ModelAttribute("item") Product item, BindingResult result,
			@RequestParam("imageUpload") MultipartFile file,
	        @RequestParam("p") Optional<Integer> p, Model model) {
	    int pageValue = p.orElse(0);
	    if (pageValue < 0) {
	        pageValue = 0; // If p is less than 0, set it to 0
	    }
	    Pageable pageable = PageRequest.of(pageValue, 6);
	    Page<Product> page = prodDao.findAll(pageable);
	    model.addAttribute("page", page);

	    if (page.isEmpty()) {
	        int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
	        pageable = PageRequest.of(lastPage, 6);
	        page = prodDao.findAll(pageable);
	        model.addAttribute("page", page);
	        pageValue = lastPage;
	    }
	    if (result.hasErrors()) {
	        // Return the appropriate view if there are errors
	        List<Category> category = cateDAO.findAll();
	        model.addAttribute("category", category);
	        List<Product> items = prodDao.findAll();
	        model.addAttribute("items", items);
	        return "admin/product";
	    } else {
	        if (!file.isEmpty()) {
	            String imagePath = "images";
	            String originalFilename = file.getOriginalFilename();
	            item.setImage(originalFilename);
	            paramService.save(file, imagePath);
	        }
	        prodDao.save(item);
	        return "redirect:/admin/product";
	    }
	}
	
	@RequestMapping("/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id,@RequestParam("p") Optional<Integer> p) {
		Product item = prodDao.findById(id).orElse(new Product());		
		model.addAttribute("item", item);
		
		int pageValue = p.orElse(0);
		if (pageValue < 0) {
			pageValue = 0; // If p is less than 0, set it to 0
		}
		Pageable pageable = PageRequest.of(pageValue, 6);
		Page<Product> page = prodDao.findAll(pageable);
		model.addAttribute("page", page);
		
		List<Category> category = cateDAO.findAll();
		model.addAttribute("category", category);
		
		if (page.isEmpty()) {
			int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(lastPage, 6);
			page = prodDao.findAll(pageable);
			model.addAttribute("page", page);
			pageValue = lastPage;
		}
		return "admin/product";
	}
	
	@RequestMapping("/product/update")
	public String update(@Valid @ModelAttribute("item") Product item, BindingResult result,
			@RequestParam("imageUpload") MultipartFile file,
	        @RequestParam("p") Optional<Integer> p, Model model) {
		 int pageValue = p.orElse(0);
		    if (pageValue < 0) {
		        pageValue = 0; // If p is less than 0, set it to 0
		    }
		    Pageable pageable = PageRequest.of(pageValue, 6);
		    Page<Product> page = prodDao.findAll(pageable);
		    model.addAttribute("page", page);

		    if (page.isEmpty()) {
		        int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
		        pageable = PageRequest.of(lastPage, 6);
		        page = prodDao.findAll(pageable);
		        model.addAttribute("page", page);
		        pageValue = lastPage;
		    }
		    if (result.hasErrors()) {
		        // Return the appropriate view if there are errors
		        List<Category> category = cateDAO.findAll();
		        model.addAttribute("category", category);
		        List<Product> items = prodDao.findAll();
		        model.addAttribute("items", items);
		        return "admin/product";
		    } else {
		        if (!file.isEmpty()) {
		            String imagePath = "images";
		            String originalFilename = file.getOriginalFilename();
		            item.setImage(originalFilename);
		            paramService.save(file, imagePath);
		        }
		        prodDao.save(item);
		        return "redirect:/admin/product";
		    }	
	}

	@RequestMapping("/product/delete/{id}")
	public String delete(@PathVariable("id") Integer id,Model model) {
		 prodDao.deleteById(id);
		 return "redirect:/admin/product";
	}
	@RequestMapping("/product/reset")
	public String reset(Model model) {
		List<Product> items = prodDao.findAll();
		model.addAttribute("items", items);
		return "redirect:/admin/product";
	}
	@RequestMapping("/product/search-and-page")
	public String searchAndPage(HttpSession session,Model model,@RequestParam("keywords") Optional<String> kw,@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse((String) session.getAttribute("keywords"));
		session.setAttribute("keywords", kwords);
		Product item = new Product(); 
		model.addAttribute("item", item);
		Pageable pageable = PageRequest.of(p.orElse(0), 3);
		Page<Product> page = prodDao.findByKeywords("%"+kwords+"%", pageable);
		//Page<Product> page = prodDao.findAllByNameLike("%"+kwords+"%", pageable);
		model.addAttribute("page", page);
		
		return "admin/product";
	}	
}

