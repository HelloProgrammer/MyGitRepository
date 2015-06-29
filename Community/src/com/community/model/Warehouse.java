package com.community.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Warehouse entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "warehouse", schema = "dbo", catalog = "community")
public class Warehouse implements java.io.Serializable {

	// Fields

	private String warehouseId;
	private String name;
	private String address;
	private String managerName;
	private String tel;
	private String passwd;
	private Timestamp registTime;
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Shop> shops = new HashSet<Shop>(0);

	// Constructors

	/** default constructor */
	public Warehouse() {
	}

	/** minimal constructor */
	public Warehouse(String warehouseId) {
		this.warehouseId = warehouseId;
	}

	/** full constructor */
	public Warehouse(String warehouseId, String name, String address,
			String managerName, String tel, String passwd,
			Timestamp registTime, Set<Order> orders, Set<Shop> shops) {
		this.warehouseId = warehouseId;
		this.name = name;
		this.address = address;
		this.managerName = managerName;
		this.tel = tel;
		this.passwd = passwd;
		this.registTime = registTime;
		this.orders = orders;
		this.shops = shops;
	}

	// Property accessors
	@Id
	@Column(name = "warehouse_id", unique = true, nullable = false, length = 50)
	public String getWarehouseId() {
		return this.warehouseId;
	}

	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
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

	@Column(name = "manager_name", length = 50)
	public String getManagerName() {
		return this.managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "warehouse")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "warehouse")
	public Set<Shop> getShops() {
		return this.shops;
	}

	public void setShops(Set<Shop> shops) {
		this.shops = shops;
	}

}