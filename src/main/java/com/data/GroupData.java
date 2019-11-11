package com.data;

import java.util.List;

public class GroupData {

	private int id;
	private int orgId;
	private String orgGroupName;
	private String description;
	private String dateUpdated;
	private int updatedBy;
	private int[] gFunctions;

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

	public String getOrgGroupName() {
		return orgGroupName;
	}

	public void setOrgGroupName(String orgGroupName) {
		this.orgGroupName = orgGroupName;
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

	public int[] getgFunctions() {
		return gFunctions;
	}

	public void setgFunctions(int[] gFunctions) {
		this.gFunctions = gFunctions;
	}

}
