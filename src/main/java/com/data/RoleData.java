package com.data;

import java.util.List;

public class RoleData {

	private int id;
	private int orgId;
	private String orgRoleName;
	private String description;
	private String dateUpdated;
	private int updatedBy;
	private int[] rFunctions;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrgId() {
		return orgId;
	}

	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}

	public String getOrgRoleName() {
		return orgRoleName;
	}

	public void setOrgRoleName(String orgRoleName) {
		this.orgRoleName = orgRoleName;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(String dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}

	public int[] getrFunctions() {
		return rFunctions;
	}

	public void setrFunctions(int[] rFunctions) {
		this.rFunctions = rFunctions;
	}

}
