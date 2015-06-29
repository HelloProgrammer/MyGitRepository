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
 * Cart entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "cart", schema = "dbo", catalog = "community")
public class Cart implements java.io.Serializable {

	// Fields

	private Integer id;
	private Customer customer;
	private Good good;
	private String des;
	private String com;
	private Double num;

	// Constructors

	/** default constructor */
	public Cart() {
	}

	/** minimal constructor */
	public Cart(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Cart(Integer id, Customer customer, Good good, String des, String com, Double num) {
		this.id = id;
		this.customer = customer;
		this.good = good;
		this.des = des;
		this.com = com;
		this.num = num;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "good_id")
	public Good getGood() {
		return this.good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	@Column(name = "des", length = 50)
	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	@Column(name = "com", length = 50)
	public String getCom() {
		return this.com;
	}

	public void setCom(String com) {
		this.com = com;
	}
	@Column(name = "num", precision = 53, scale = 0)
	public Double getNum() {
		return num;
	}

	public void setNum(Double num) {
		this.num = num;
	}

}