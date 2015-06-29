package com.community.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * UserAddress entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_address", schema = "dbo", catalog = "community")
public class UserAddress implements java.io.Serializable {

	// Fields

	private Integer id;
	private Customer customer;
	private String address;

	// Constructors

	/** default constructor */
	public UserAddress() {
	}

	/** minimal constructor */
	public UserAddress(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public UserAddress(Integer id, Customer customer, String address) {
		this.id = id;
		this.customer = customer;
		this.address = address;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Column(name = "address", length = 50)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}