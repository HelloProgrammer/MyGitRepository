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
 * Good entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "good", schema = "dbo", catalog = "community")
public class Good implements java.io.Serializable,Comparable<Good> {

	// Fields

	private String goodId;
	private Kind kind;
	private String name;
	private Double buyPrice;
	private Double price;
	private Double stock;
	private Double saleNum;
	private String factoryName;
	private String picture;
	private Double discount;
	private String barcode;
	private String ishot;
	private String des;
	private String saleState;
	private Set<Cart> carts = new HashSet<Cart>(0);
	private Set<OrderGood> orderGoods = new HashSet<OrderGood>(0);

	// Constructors

	/** default constructor */
	public Good() {
	}

	/** minimal constructor */
	public Good(String goodId) {
		this.goodId = goodId;
	}

	/** full constructor */
	public Good(String goodId, Kind kind, String name, Double buyPrice,
			Double price, Double stock, Double saleNum, String factoryName,
			String picture, Double discount, String barcode, String ishot,
			String des, String saleState, Set<Cart> carts,
			Set<OrderGood> orderGoods) {
		this.goodId = goodId;
		this.kind = kind;
		this.name = name;
		this.buyPrice = buyPrice;
		this.price = price;
		this.stock = stock;
		this.saleNum = saleNum;
		this.factoryName = factoryName;
		this.picture = picture;
		this.discount = discount;
		this.barcode = barcode;
		this.ishot = ishot;
		this.des = des;
		this.saleState = saleState;
		this.carts = carts;
		this.orderGoods = orderGoods;
	}

	// Property accessors
	@Id
	@Column(name = "good_id", unique = true, nullable = false, length = 50)
	public String getGoodId() {
		return this.goodId;
	}

	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "kind_id")
	public Kind getKind() {
		return this.kind;
	}

	public void setKind(Kind kind) {
		this.kind = kind;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "buy_price", precision = 53, scale = 0)
	public Double getBuyPrice() {
		return this.buyPrice;
	}

	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}

	@Column(name = "price", precision = 53, scale = 0)
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "stock", precision = 53, scale = 0)
	public Double getStock() {
		return this.stock;
	}

	public void setStock(Double stock) {
		this.stock = stock;
	}

	@Column(name = "sale_num", precision = 53, scale = 0)
	public Double getSaleNum() {
		return this.saleNum;
	}

	public void setSaleNum(Double saleNum) {
		this.saleNum = saleNum;
	}

	@Column(name = "factory_name", length = 50)
	public String getFactoryName() {
		return this.factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	@Column(name = "picture")
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Column(name = "discount", precision = 53, scale = 0)
	public Double getDiscount() {
		return this.discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	@Column(name = "barcode", length = 50)
	public String getBarcode() {
		return this.barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	@Column(name = "ishot", length = 50)
	public String getIshot() {
		return this.ishot;
	}

	public void setIshot(String ishot) {
		this.ishot = ishot;
	}

	@Column(name = "des")
	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	@Column(name = "sale_state", length = 50)
	public String getSaleState() {
		return this.saleState;
	}

	public void setSaleState(String saleState) {
		this.saleState = saleState;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "good")
	public Set<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "good")
	public Set<OrderGood> getOrderGoods() {
		return this.orderGoods;
	}

	public void setOrderGoods(Set<OrderGood> orderGoods) {
		this.orderGoods = orderGoods;
	}

	@Override
	public int compareTo(Good o) {
	    return (int)(Float.parseFloat(this.getIshot())-Float.parseFloat(o.getIshot()));
	}

}