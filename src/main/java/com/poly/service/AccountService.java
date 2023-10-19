package com.poly.service;

import java.util.List;

import com.poly.model.Account;
import com.poly.model.Role;
import com.poly.model.RoleDetail;

public interface AccountService {
	List<Account> findAll();

	Account findByUsername(String username);

	Account save(Account account);

	void deleteByUsername(String username);

	boolean existsById(String username);

	List<Account> findByFullname(String fullname);

	List<Role> findAllRole();

	List<RoleDetail> findAllAuthorities();

	RoleDetail saveRoleDetail(RoleDetail authority);

	void deleteRoleDetail(Long id);

	List<Account> findByUsernameLike(String username);

	Long countCustomer(String role);
}
