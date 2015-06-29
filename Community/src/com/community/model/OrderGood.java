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
 * OrderGood entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "order_good", schema = "dbo", catalog = "community")
public class OrderGood implements java.io.Serializable {

	// Fields

	private Integer id;
	private Good good;
	private Order order;
	private Double salePrice;
	private Double num;
	private Double totalPrice;
	private String commentState;
	private String comment;
	private String manageComment;
	private String des;

	// Constructors

	/** default constructor */
	public OrderGood() {
	}

	/** minimal constructor */
	public OrderGood(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public OrderGood(Integer id, Good good, Order order, Double salePrice,
			Double num, Double totalPrice, String commentState, String comment,
			String manageComment, String des) {
		this.id = id;
		this.good = good;
		this.order = order;
		this.salePrice = salePrice;
		this.num = num;
		this.totalPrice = totalPrice;
		this.commentState = commentState;
		this.comment = comment;
		this.manageComment = manageComment;
		this.des = des;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "good_id")
	public Good getGood() {
		return this.good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "order_id")
	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Column(name = "sale_price", precision = 53, scale = 0)
	public Double getSalePrice() {
		return this.salePrice;
	}

	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}

	@Column(name = "num", precision = 53, scale = 0)
	public Double getNum() {
		return this.num;
	}

	public void setNum(Double num) {
		this.num = num;
	}

	@Column(name = "total_price", precision = 53, scale = 0)
	public Double getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name = "comment_state", length = 10)
	public String getCommentState() {
		return this.commentState;
	}

	public void setCommentState(String commentState) {
		this.commentState = commentState;
	}

	@Column(name = "comment")
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Column(name = "manage_comment")
	public String getManageComment() {
		return this.manageComment;
	}

	public void setManageComment(String manageComment) {
		this.manageComment = manageComment;
	}

	@Column(name = "des")
	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

}