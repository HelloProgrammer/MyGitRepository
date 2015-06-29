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
 * Kind entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "kind", schema = "dbo", catalog = "community")
public class Kind implements java.io.Serializable {

	// Fields

	private String kindId;
	private Pkind pkind;
	private String kindName;
	private Set<Good> goods = new HashSet<Good>(0);

	// Constructors

	/** default constructor */
	public Kind() {
	}

	/** minimal constructor */
	public Kind(String kindId) {
		this.kindId = kindId;
	}

	/** full constructor */
	public Kind(String kindId, Pkind pkind, String kindName, Set<Good> goods) {
		this.kindId = kindId;
		this.pkind = pkind;
		this.kindName = kindName;
		this.goods = goods;
	}

	// Property accessors
	@Id
	@Column(name = "kind_id", unique = true, nullable = false, length = 50)
	public String getKindId() {
		return this.kindId;
	}

	public void setKindId(String kindId) {
		this.kindId = kindId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "pkind_id")
	public Pkind getPkind() {
		return this.pkind;
	}

	public void setPkind(Pkind pkind) {
		this.pkind = pkind;
	}

	@Column(name = "kind_name", length = 50)
	public String getKindName() {
		return this.kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "kind")
	public Set<Good> getGoods() {
		return this.goods;
	}

	public void setGoods(Set<Good> goods) {
		this.goods = goods;
	}

}