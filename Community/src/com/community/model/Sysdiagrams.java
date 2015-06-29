package com.community.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.persistence.Version;

/**
 * Sysdiagrams entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sysdiagrams", schema = "dbo", catalog = "community", uniqueConstraints = @UniqueConstraint(columnNames = {
		"principal_id", "name" }))
public class Sysdiagrams implements java.io.Serializable {

	// Fields

	private Integer diagramId;
	private Integer version;
	private String name;
	private Integer principalId;
	private String definition;

	// Constructors

	/** default constructor */
	public Sysdiagrams() {
	}

	/** minimal constructor */
	public Sysdiagrams(Integer diagramId, String name, Integer principalId) {
		this.diagramId = diagramId;
		this.name = name;
		this.principalId = principalId;
	}

	/** full constructor */
	public Sysdiagrams(Integer diagramId, String name, Integer principalId,
			String definition) {
		this.diagramId = diagramId;
		this.name = name;
		this.principalId = principalId;
		this.definition = definition;
	}

	// Property accessors
	@Id
	@Column(name = "diagram_id", unique = true, nullable = false)
	public Integer getDiagramId() {
		return this.diagramId;
	}

	public void setDiagramId(Integer diagramId) {
		this.diagramId = diagramId;
	}

	@Version
	@Column(name = "version")
	public Integer getVersion() {
		return this.version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "principal_id", nullable = false)
	public Integer getPrincipalId() {
		return this.principalId;
	}

	public void setPrincipalId(Integer principalId) {
		this.principalId = principalId;
	}

	@Column(name = "definition")
	public String getDefinition() {
		return this.definition;
	}

	public void setDefinition(String definition) {
		this.definition = definition;
	}

}