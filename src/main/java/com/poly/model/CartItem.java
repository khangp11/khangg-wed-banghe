package com.poly.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "CartItem")
public class CartItem {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
   Integer id;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    Account account;
    
    @ManyToOne
    @JoinColumn(name = "product_id")
     Product product;
    
     int quantity;

}
