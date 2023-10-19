package com.poly.model;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
	@Id
	@NotBlank(message = "Không để trống tài khoản")
	String username;
	String password;
	@NotBlank (message = "Không để trống tên")
	String fullname;
	@NotBlank(message = "Không để trống email")
	@Email(message = "Sai định dạng email")
	String email;
	String photo;
	@NotNull(message = "Không được để trống ")
	Boolean activated;
	@JsonIgnore
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
//	@Column(name = "roledetails")
	List<RoleDetail> roleDetails;
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}