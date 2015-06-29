package com.community.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "customer", schema = "dbo", catalog = "community")
public class Customer implements java.io.Serializable {

	// Fields

	private String userId;
	private Shop shop;
	private Shopman shopman;
	private String name;
	private String passwd;
	private String tel;
	private Set<Cart> carts = new HashSet<Cart>(0);
	private Set<Order> orders = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String userId) {
		this.userId = userId;
	}

	/** full constructor */
	public Customer(String userId, Shop shop, Shopman shopman, String name,
			String passwd, String tel, Set<Cart> carts, Set<Order> orders) {
		this.userId = userId;
		this.shop = shop;
		this.shopman = shopman;
		this.name = name;
		this.passwd = passwd;
		this.tel = tel;
		this.carts = carts;
		this.orders = orders;
	}

	// Property accessors
	@Id
	@Column(name = "user_id", unique = true, nullable = false, length = 50)
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "shop_id")
	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "shopman_id")
	public Shopman getShopman() {
		return this.shopman;
	}

	public void setShopman(Shopman shopman) {
		this.shopman = shopman;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "passwd", length = 50)
	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	@Column(name = "tel", length = 50)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}