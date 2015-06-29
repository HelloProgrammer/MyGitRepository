package com.community.model;

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
 * OrderState entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "order_state", schema = "dbo", catalog = "community")
public class OrderState implements java.io.Serializable {

	// Fields

	private String orderStateId;
	private String orderStateName;
	private Set<Order> orders = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public OrderState() {
	}

	/** minimal constructor */
	public OrderState(String orderStateId) {
		this.orderStateId = orderStateId;
	}

	/** full constructor */
	public OrderState(String orderStateId, String orderStateName,
			Set<Order> orders) {
		this.orderStateId = orderStateId;
		this.orderStateName = orderStateName;
		this.orders = orders;
	}

	// Property accessors
	@Id
	@Column(name = "order_state_id", unique = true, nullable = false, length = 10)
	public String getOrderStateId() {
		return this.orderStateId;
	}

	public void setOrderStateId(String orderStateId) {
		this.orderStateId = orderStateId;
	}

	@Column(name = "order_state_name", length = 50)
	public String getOrderStateName() {
		return this.orderStateName;
	}

	public void setOrderStateName(String orderStateName) {
		this.orderStateName = orderStateName;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "orderState")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}