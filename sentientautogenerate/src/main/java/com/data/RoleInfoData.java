package com.data;

import java.util.List;

public class RoleInfoData 
{
	private int id;
	
	private String roleName;
	
	private String roleDesc;
	
	private String dateCreated;
	
	private String dateUpdated;
	
	private String creadedBy;
	
	private List<DropdownData> rFunction;
	
	private List<DropdownData> users;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(String dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public String getCreadedBy() {
		return creadedBy;
	}

	public void setCreadedBy(String creadedBy) {
		this.creadedBy = creadedBy;
	}

	public List<DropdownData> getrFunction() {
		return rFunction;
	}

	public void setrFunction(List<DropdownData> rFunction) {
		this.rFunction = rFunction;
	}

	public List<DropdownData> getUsers() {
		return users;
	}

	public void setUsers(List<DropdownData> users) {
		this.users = users;
	}
	
}
