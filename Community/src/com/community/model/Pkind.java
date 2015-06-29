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
 * Pkind entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "pkind", schema = "dbo", catalog = "community")
public class Pkind implements java.io.Serializable {

	// Fields

	private String pkindId;
	private String pkindName;
	private Set<Kind> kinds = new HashSet<Kind>(0);

	// Constructors

	/** default constructor */
	public Pkind() {
	}

	/** minimal constructor */
	public Pkind(String pkindId) {
		this.pkindId = pkindId;
	}

	/** full constructor */
	public Pkind(String pkindId, String pkindName, Set<Kind> kinds) {
		this.pkindId = pkindId;
		this.pkindName = pkindName;
		this.kinds = kinds;
	}

	// Property accessors
	@Id
	@Column(name = "pkind_id", unique = true, nullable = false, length = 50)
	public String getPkindId() {
		return this.pkindId;
	}

	public void setPkindId(String pkindId) {
		this.pkindId = pkindId;
	}

	@Column(name = "pkind_name", length = 50)
	public String getPkindName() {
		return this.pkindName;
	}

	public void setPkindName(String pkindName) {
		this.pkindName = pkindName;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "pkind")
	public Set<Kind> getKinds() {
		return this.kinds;
	}

	public void setKinds(Set<Kind> kinds) {
		this.kinds = kinds;
	}

}