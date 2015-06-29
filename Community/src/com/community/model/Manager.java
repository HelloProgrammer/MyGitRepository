package com.community.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Manager entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "manager", schema = "dbo", catalog = "community")
public class Manager implements java.io.Serializable {

	// Fields

	private String managerId;
	private String passwd;
	private String name;
	private String authority;
	private String tel;

	// Constructors

	/** default constructor */
	public Manager() {
	}

	/** minimal constructor */
	public Manager(String managerId) {
		this.managerId = managerId;
	}

	/** full constructor */
	public Manager(String managerId, String passwd, String name,
			String authority, String tel) {
		this.managerId = managerId;
		this.passwd = passwd;
		this.name = name;
		this.authority = authority;
		this.tel = tel;
	}

	// Property accessors
	@Id
	@Column(name = "manager_id", unique = true, nullable = false, length = 20)
	public String getManagerId() {
		return this.managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	@Column(name = "passwd", length = 20)
	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	@Column(name = "name", length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "authority", length = 5)
	public String getAuthority() {
		return this.authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Column(name = "tel", length = 20)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}