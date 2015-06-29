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
 * Order entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "[order]", schema = "dbo", catalog = "community")
public class Order implements java.io.Serializable {

	// Fields

	private String orderId;
	private Customer customer;
	private Warehouse warehouse;
	private OrderState orderState;
	private Timestamp date;
	private String logisticsStateId;
	private String receiveName;
	private String receiveAddress;
	private String receiveTel;
	private String receiveZipcode;
	private Double totalPrice;
	private String payMethod;
	private String logisticsNum;
	private Set<OrderGood> orderGoods = new HashSet<OrderGood>(0);

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(String orderId) {
		this.orderId = orderId;
	}

	/** full constructor */
	public Order(String orderId, Customer customer, Warehouse warehouse,
			OrderState orderState, Timestamp date, String logisticsStateId,
			String receiveName, String receiveAddress, String receiveTel,
			String receiveZipcode, Double totalPrice, String payMethod,
			String logisticsNum, Set<OrderGood> orderGoods) {
		this.orderId = orderId;
		this.customer = customer;
		this.warehouse = warehouse;
		this.orderState = orderState;
		this.date = date;
		this.logisticsStateId = logisticsStateId;
		this.receiveName = receiveName;
		this.receiveAddress = receiveAddress;
		this.receiveTel = receiveTel;
		this.receiveZipcode = receiveZipcode;
		this.totalPrice = totalPrice;
		this.payMethod = payMethod;
		this.logisticsNum = logisticsNum;
		this.orderGoods = orderGoods;
	}

	// Property accessors
	@Id
	@Column(name = "order_id", unique = true, nullable = false, length = 50)
	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
	@JoinColumn(name = "warehouse_id")
	public Warehouse getWarehouse() {
		return this.warehouse;
	}

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_state_id")
	public OrderState getOrderState() {
		return this.orderState;
	}

	public void setOrderState(OrderState orderState) {
		this.orderState = orderState;
	}

	@Column(name = "date", length = 23)
	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	@Column(name = "logistics_state_id", length = 10)
	public String getLogisticsStateId() {
		return this.logisticsStateId;
	}

	public void setLogisticsStateId(String logisticsStateId) {
		this.logisticsStateId = logisticsStateId;
	}

	@Column(name = "receive_name", length = 50)
	public String getReceiveName() {
		return this.receiveName;
	}

	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}

	@Column(name = "receive_address", length = 50)
	public String getReceiveAddress() {
		return this.receiveAddress;
	}

	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}

	@Column(name = "receive_tel", length = 50)
	public String getReceiveTel() {
		return this.receiveTel;
	}

	public void setReceiveTel(String receiveTel) {
		this.receiveTel = receiveTel;
	}

	@Column(name = "receive_zipcode", length = 50)
	public String getReceiveZipcode() {
		return this.receiveZipcode;
	}

	public void setReceiveZipcode(String receiveZipcode) {
		this.receiveZipcode = receiveZipcode;
	}

	@Column(name = "total_price", precision = 53, scale = 0)
	public Double getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name = "pay_method", length = 50)
	public String getPayMethod() {
		return this.payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	@Column(name = "logistics_num", length = 50)
	public String getLogisticsNum() {
		return this.logisticsNum;
	}

	public void setLogisticsNum(String logisticsNum) {
		this.logisticsNum = logisticsNum;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "order")
	public Set<OrderGood> getOrderGoods() {
		return this.orderGoods;
	}

	public void setOrderGoods(Set<OrderGood> orderGoods) {
		this.orderGoods = orderGoods;
	}

}