package com.community.model;

import java.sql.Timestamp;
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
 * Shopman entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "shopman", schema = "dbo", catalog = "community")
public class Shopman implements java.io.Serializable {

	// Fields

	private String shopmanId;
	private Shop shop;
	private String name;
	private String tel;
	private String passwd;
	private Timestamp registTime;
	private Set<Customer> customers = new HashSet<Customer>(0);

	// Constructors

	/** default constructor */
	public Shopman() {
	}

	/** minimal constructor */
	public Shopman(String shopmanId) {
		this.shopmanId = shopmanId;
	}

	/** full constructor */
	public Shopman(String shopmanId, Shop shop, String name, String tel,
			String passwd, Timestamp registTime, Set<Customer> customers) {
		this.shopmanId = shopmanId;
		this.shop = shop;
		this.name = name;
		this.tel = tel;
		this.passwd = passwd;
		this.registTime = registTime;
		this.customers = customers;
	}

	// Property accessors
	@Id
	@Column(name = "shopman_id", unique = true, nullable = false, length = 50)
	public String getShopmanId() {
		return this.shopmanId;
	}

	public void setShopmanId(String shopmanId) {
		this.shopmanId = shopmanId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "shop_id")
	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "tel", length = 50)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "passwd", length = 50)
	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	@Column(name = "regist_time", length = 23)
	public Timestamp getRegistTime() {
		return this.registTime;
	}

	public void setRegistTime(Timestamp registTime) {
		this.registTime = registTime;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "shopman")
	public Set<Customer> getCustomers() {
		return this.customers;
	}

	public void setCustomers(Set<Customer> customers) {
		this.customers = customers;
	}

}