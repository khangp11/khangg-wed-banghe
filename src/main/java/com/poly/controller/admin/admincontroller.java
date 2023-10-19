package com.poly.controller.admin;

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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.AccountDAO;
import com.poly.dao.RoleDAO;
import com.poly.dao.RoleDetailDAO;
import com.poly.model.Account;
import com.poly.model.Role;
import com.poly.model.RoleDetail;
import com.poly.service.imgservice;

import jakarta.validation.Valid;

@Controller
public class admincontroller {
	@Autowired
	AccountDAO user;
	@Autowired
	RoleDetailDAO dao;
	@Autowired
	RoleDAO daoroll;
	@Autowired
	imgservice paramService;

	@RequestMapping("/admin")
	public String admin() {
		return "admin/index";
	}

	@GetMapping("/admin/user")
	public String user(Model model, @ModelAttribute("item") Account account, @RequestParam("p") Optional<Integer> p) {
		int pageValue = p.orElse(0);
		if (pageValue < 0) {
			pageValue = 0; // If p is less than 0, set it to 0
		}
		Pageable pageable = PageRequest.of(pageValue, 6);

		Account item = new Account();
		model.addAttribute("item", item);
		Page<Account> page = user.findAll(pageable);
		model.addAttribute("page", page);

		if (page.isEmpty()) {
			int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(lastPage, 6);
			page = user.findAll(pageable);
			model.addAttribute("page", page);
			pageValue = lastPage;
		}
		return "admin/user";
	}

	@RequestMapping("/admin/useredit/{username}")
	public String edit(Model model, @PathVariable("username") String username, @RequestParam("p") Optional<Integer> p) {
		Account item = user.findById(username).orElse(new Account()); // may not exist.
		model.addAttribute("item", item);

		int pageValue = p.orElse(0);
		if (pageValue < 0) {
			pageValue = 0; // If p is less than 0, set it to 0
		}
		Pageable pageable = PageRequest.of(pageValue, 6);
		Page<Account> page = user.findAll(pageable);
		model.addAttribute("page", page);

		if (page.isEmpty()) {
			int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(lastPage, 6);
			page = user.findAll(pageable);
			model.addAttribute("page", page);
			pageValue = lastPage;
		}
		return "admin/user";
	}

	@ModelAttribute("activated")
	public Map<Boolean, String> getGenders() {
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Yes");
		map.put(false, "No");
		return map;
	}

	@PostMapping("/admin/userCreate") // Changed to PostMapping as it seems to be a form submission
	public String create(@Valid @ModelAttribute("item") Account item, BindingResult result,
			@RequestParam("avatar") MultipartFile avatar,
			@RequestParam("p") Optional<Integer> p, Model model) {
		int pageValue = p.orElse(0);
		if (pageValue < 0) {
			pageValue = 0; // If p is less than 0, set it to 0
		}
		Pageable pageable = PageRequest.of(pageValue, 6);

		
		Page<Account> page = user.findAll(pageable);
		model.addAttribute("page", page);

		if (page.isEmpty()) {
			int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(lastPage, 6);
			page = user.findAll(pageable);
			model.addAttribute("page", page);
			pageValue = lastPage;
		}
		if (result.hasErrors()) {
			return "admin/user"; // Return the appropriate view if there are errors
		} else {
			if (!avatar.isEmpty()) {
				String imagePath = "images";
				String originalFilename = avatar.getOriginalFilename();
				item.setPhoto(originalFilename);
				paramService.save(avatar, imagePath);
			}
			user.save(item); // Assuming "user" is the name of your repository for saving accounts
			return "redirect:/admin/user";
		}
	}
	
	@PostMapping("/admin/userupdate") // Changed to PostMapping as it seems to be a form submission
	public String update(@Valid @ModelAttribute("item") Account item, BindingResult result,
			@RequestParam("avatar") MultipartFile avatar, @RequestParam("username") String username,
			@RequestParam("p") Optional<Integer> p, Model model) {
		int pageValue = p.orElse(0);
		if (pageValue < 0) {
			pageValue = 0; // If p is less than 0, set it to 0
		}
		Pageable pageable = PageRequest.of(pageValue, 6);

		
		Page<Account> page = user.findAll(pageable);
		model.addAttribute("page", page);

		if (page.isEmpty()) {
			int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(lastPage, 6);
			page = user.findAll(pageable);
			model.addAttribute("page", page);
			pageValue = lastPage;
		}
		if (result.hasErrors()) {
			return "admin/user"; // Return the appropriate view if there are errors
		} else {
			if (!avatar.isEmpty()) {
				String imagePath = "images";
				String originalFilename = avatar.getOriginalFilename();
				item.setPhoto(originalFilename);
				paramService.save(avatar, imagePath);
			}
			user.save(item); // Assuming "user" is the name of your repository for saving accounts
			return "redirect:/admin/useredit/" + item.getUsername();
		}
	}

	@RequestMapping("/admin/userdelete/{username}")
	public String delete(@PathVariable("username") String username) {
		Account account = new Account();
		account.setUsername(username);

		dao.findByUsernameLike(username);
		List<RoleDetail> roleDetails = dao.findByUsernameLike("%" + username + "%");
		dao.deleteAll(roleDetails);
		user.deleteById(username);
		return "redirect:/admin/user";
	}

	@RequestMapping("/admin/resest")
	public String resest() {

		return "redirect:/admin/user";
	}

	@GetMapping("/admin/role")
	public String role(Model model, @ModelAttribute("item") Account account, @RequestParam("p") Optional<Integer> p) {
		int pageValue = p.orElse(0);
		if (pageValue < 0) {
			pageValue = 0; // If p is less than 0, set it to 0
		}
		Pageable pageable = PageRequest.of(pageValue, 6);

		RoleDetail item = new RoleDetail();
		model.addAttribute("item", item);
		Page<RoleDetail> page = dao.findAll(pageable);
		model.addAttribute("page", page);
		List<Role> roles = daoroll.findAll();
		model.addAttribute("roles", roles);

		if (page.isEmpty()) {
			int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(lastPage, 6);
			page = dao.findAll(pageable);
			model.addAttribute("page", page);
			pageValue = lastPage;
		}
		return "admin/role";
	}

	@RequestMapping("/admin/roleEdit/{id}")
	public String editrole(Model model, @PathVariable("id") Long id) {
		RoleDetail item = dao.findById(id).orElse(new RoleDetail()); // may not exist.
		model.addAttribute("item", item);

		List<Role> roles = daoroll.findAll();
		model.addAttribute("roles", roles);

		List<RoleDetail> roleDetails = dao.findAll();
		model.addAttribute("roleDetails", roleDetails);
		return "admin/role";
	}

	@RequestMapping("/admin/roleresest")
	public String roleresest() {

		return "redirect:/admin/role";
	}

	@RequestMapping("/admin/roleupdate")
	public String roleupdate(RoleDetail item) {
		dao.save(item);
		return "redirect:/admin/roleEdit/" + item.getId();
	}
}
