package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.model.RoleDetail;

@Repository
public interface RoleDetailDAO extends JpaRepository<RoleDetail, Long>{
	@Query("SELECT r FROM RoleDetail r WHERE r.account.username LIKE %:username%")
	List<RoleDetail> findByUsernameLike(@Param("username") String username);
}
