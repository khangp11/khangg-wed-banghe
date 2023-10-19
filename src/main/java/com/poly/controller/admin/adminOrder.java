package com.poly.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailsDAO;
import com.poly.model.Order;
import com.poly.model.OrderDetail;
import com.poly.model.Role;
import com.poly.model.RoleDetail;

import jakarta.validation.Valid;

@Controller
public class adminOrder {
	@Autowired
	OrderDetailsDAO orDao;
	@Autowired
	OrderDAO dao;

	@GetMapping("/admin/ordermuahang")
	public String filterByDate(Model model, @RequestParam("p") Optional<Integer> p) {
		int pageValue = p.orElse(0);
		if (pageValue < 0) {
			pageValue = 0; // If p is less than 0, set it to 0
		}
		Pageable pageable = PageRequest.of(pageValue, 6);
		Page<OrderDetail> page = orDao.findAll(pageable);
		model.addAttribute("page", page);
		OrderDetail item = new OrderDetail();
		model.addAttribute("item", item);
		if (page.isEmpty()) {
			int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(lastPage, 6);
			page = orDao.findAll(pageable);
			model.addAttribute("page", page);
			pageValue = lastPage;
		}
		return "admin/order";

	}

	@PostMapping("/filter")
	public String filterByDate(Model model, @RequestParam("ngayBatDau") String ngaybatdau,
			@RequestParam("ngayKetThuc") String ngayketthuc, @RequestParam("p") Optional<Integer> p)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Adjusted date format
		Date startDate = sdf.parse(ngaybatdau);
		Date endDate = sdf.parse(ngayketthuc);
		OrderDetail item = new OrderDetail();
		model.addAttribute("item", item);
		int pageValue = p.orElse(0);
		if (pageValue < 0) {
			pageValue = 0; // If p is less than 0, set it to 0
		}
		Pageable pageable = PageRequest.of(pageValue, 6);
		Page<OrderDetail> page = orDao.findByDateBetween(startDate, endDate, pageable);
		model.addAttribute("page", page);

		if (page.isEmpty()) {
			int lastPage = orDao.findAll(PageRequest.of(0, 6)).getTotalPages() - 1; // Changed the logic here
			if (lastPage < 0) {
				lastPage = 0;
			}
			pageable = PageRequest.of(lastPage, 6);
			page = orDao.findByDateBetween(startDate, endDate, pageable); // Adjusted to filter by date again
			model.addAttribute("page", page);
			pageValue = lastPage;
		}

		return "admin/order";
	}

	@RequestMapping("/admin/orderedit/{id}")
	public String edit(Model model, @PathVariable("id") Long id, @RequestParam("p") Optional<Integer> p) {
		OrderDetail item = orDao.findById(id).orElse(new OrderDetail()); // may not exist.
		model.addAttribute("item", item);
		int pageValue = p.orElse(0);
		if (pageValue < 0) {
			pageValue = 0; // If p is less than 0, set it to 0
		}
		Pageable pageable = PageRequest.of(pageValue, 6);
		Page<OrderDetail> page = orDao.findAll(pageable);
		model.addAttribute("page", page);

		if (page.isEmpty()) {
			int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(lastPage, 6);
			page = orDao.findAll(pageable);
			model.addAttribute("page", page);
			pageValue = lastPage;
		}
		return "admin/order";
	}

	@PostMapping("/admin/orderupdate")
	public String updateOrder(@Valid @ModelAttribute("item") OrderDetail orderDetail,
			@RequestParam("trangThai") String trangThai, @RequestParam("p") Optional<Integer> p, Model model) {
		if (orderDetail.getId() != null) {
			Long id = orderDetail.getId();
			if (orDao.existsById(id)) {
				int pageValue = p.orElse(0);
				if (pageValue < 0) {
					pageValue = 0; // If p is less than 0, set it to 0
				}
				Pageable pageable = PageRequest.of(pageValue, 6);

				orderDetail.setTrangThai(trangThai); // Set the trangThai for the order detail
				orDao.save(orderDetail);

				Page<OrderDetail> page = orDao.findAll(pageable);
				if (page.isEmpty()) {
					int lastPage = page.getTotalPages() > 0 ? page.getTotalPages() - 1 : 0;
					pageable = PageRequest.of(lastPage, 6);
					page = orDao.findAll(pageable);
					pageValue = lastPage;
				}

				model.addAttribute("item", new OrderDetail());
				model.addAttribute("page", page);
				return "redirect:/admin/ordermuahang";
			} else {
				return "redirect:/admin/ordermuahang";
			}
		} else {
			return "redirect:/admin/ordermuahang";
		}
	}

	@RequestMapping("/admin/orderchitiet/{id}")
	public String xemchitiet(Model model, @PathVariable("id") Long id) {
		Optional<OrderDetail> optionalOrderDetail = orDao.findById(id);
		List<Order> items = new ArrayList<>();
		if (optionalOrderDetail.isPresent()) {
			OrderDetail orderDetail = optionalOrderDetail.get();
			items = dao.findByOrderDetail_Id(orderDetail.getId());
		}
		model.addAttribute("items", items);
		return "admin/oderchitiet"; // Removed the leading slash
	}
}
