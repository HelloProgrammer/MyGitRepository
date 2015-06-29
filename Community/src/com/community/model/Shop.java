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
 * Shop entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "shop", schema = "dbo", catalog = "community")
public class Shop implements java.io.Serializable {

	// Fields

	private String shopId;
	private Warehouse warehouse;
	private String name;
	private String address;
	private String tel;
	private String passwd;
	private Timestamp registTime;
	private Set<Customer> customers = new HashSet<Customer>(0);
	private Set<Shopman> shopmans = new HashSet<Shopman>(0);

	// Constructors

	/** default constructor */
	public Shop() {
	}

	/** minimal constructor */
	public Shop(String shopId) {
		this.shopId = shopId;
	}

	/** full constructor */
	public Shop(String shopId, Warehouse warehouse, String name,
			String address, String tel, String passwd, Timestamp registTime,
			Set<Customer> customers, Set<Shopman> shopmans) {
		this.shopId = shopId;
		this.warehouse = warehouse;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.passwd = passwd;
		this.registTime = registTime;
		this.customers = customers;
		this.shopmans = shopmans;
	}

	// Property accessors
	@Id
	@Column(name = "shop_id", unique = true, nullable = false, length = 50)
	public String getShopId() {
		return this.shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "warehouse_id")
	public Warehouse getWarehouse() {
		return this.warehouse;
	}

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "address", length = 50)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "shop")
	public Set<Customer> getCustomers() {
		return this.customers;
	}

	public void setCustomers(Set<Customer> customers) {
		this.customers = customers;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "shop")
	public Set<Shopman> getShopmans() {
		return this.shopmans;
	}

	public void setShopmans(Set<Shopman> shopmans) {
		this.shopmans = shopmans;
	}

}