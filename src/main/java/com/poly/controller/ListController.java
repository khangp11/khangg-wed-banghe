package com.poly.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.model.Category;
import com.poly.model.Product;


@Controller
public class ListController {
	@Autowired
	ProductDAO dao;
	@Autowired
	CategoryDAO daoc;
	
	
	@GetMapping("/list")
	public String list(Model model, @RequestParam("p") Optional<Integer> p, @RequestParam("cid") Optional<String> cid) {
		if (p.isPresent() && p.get() < 0) {
	        // If p is less than 0, redirect to "/list"
	        return "redirect:/list";
	    }
		if(cid.isPresent()) {
			Pageable pageable = PageRequest.of(p.orElse(0), 6);
			Page<Product> lstProduct = dao.findByCategory1(cid, pageable);			
			model.addAttribute("page", lstProduct);
			List<Category> categories = daoc.findAll();
			model.addAttribute("categories", categories);
		}else {
			Pageable pageable = PageRequest.of(p.orElse(0), 6);
			Page<Product> page = dao.findAll(pageable);
			model.addAttribute("page",page);
			
			List<Category> categories = daoc.findAll();
			model.addAttribute("categories", categories);
		}
		
		
		return "list";
	}
	
	@RequestMapping("/listfind")
	public String price(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {
		if (!min.isPresent() || !max.isPresent()) {
	        // If either min or max is not present, redirect to "/list"
	        return "redirect:/list";
	    }
		
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = dao.findByPriceBetween(min.get(), max.get(), pageable);;
		model.addAttribute("page",page);
		List<Category> categories = daoc.findAll();
		model.addAttribute("categories", categories);
		return "/list";
	}
	
	@RequestMapping("/detail/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Product item = dao.findById(id).orElse(new Product());
				
		model.addAttribute("item", item);
		
		return "detail";
	}
	

	@GetMapping("/listsortbyprice")
    public String listSortByPrice(Model model, @RequestParam("p") Optional<Integer> p) {
        if (p.isPresent() && p.get() < 0) {
            // If p is less than 0, redirect to "/listsortbyprice"
            return "redirect:/listsortbyprice";
        }

        Pageable pageable = PageRequest.of(p.orElse(0), 6, Sort.by(Direction.ASC, "price"));
        Page<Product> page = dao.findAll(pageable);
        model.addAttribute("page", page);

        List<Category> categories = daoc.findAll();
        model.addAttribute("categories", categories);

        return "list";
    }
	
	@GetMapping("/listsortbypriceh")
    public String listSortByPriceh(Model model, @RequestParam("p") Optional<Integer> p) {
        if (p.isPresent() && p.get() < 0) {
            // If p is less than 0, redirect to "/listsortbyprice"
            return "redirect:/listsortbyprice";
        }

        Pageable pageable = PageRequest.of(p.orElse(0), 6, Sort.by(Direction.DESC, "price"));
        Page<Product> page = dao.findAll(pageable);
        model.addAttribute("page", page);

        List<Category> categories = daoc.findAll();
        model.addAttribute("categories", categories);

        return "list";
    }
	
	
}
