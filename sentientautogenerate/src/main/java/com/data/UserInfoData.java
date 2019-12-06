package com.data;

import java.util.List;

public class UserInfoData 
{
	private int id;
	
	private String userName;
	
	private String lastActive;
	
	private String userApiKey;
	
	private List<DropdownData> roles;
	
	private List<DropdownData> groups;
	
	private List<DropdownData> directFunction;
	
	private List<DropdownData> groupFunction;
	
	private List<DropdownData> roleFunction;
	

	public String getUserApiKey() {
		return userApiKey;
	}

	public void setUserApiKey(String userApiKey) {
		this.userApiKey = userApiKey;
	}

	public List<DropdownData> getDirectFunction() {
		return directFunction;
	}

	public void setDirectFunction(List<DropdownData> directFunction) {
		this.directFunction = directFunction;
	}

	public List<DropdownData> getGroupFunction() {
		return groupFunction;
	}

	public void setGroupFunction(List<DropdownData> groupFunction) {
		this.groupFunction = groupFunction;
	}

	public List<DropdownData> getRoleFunction() {
		return roleFunction;
	}

	public void setRoleFunction(List<DropdownData> roleFunction) {
		this.roleFunction = roleFunction;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLastActive() {
		return lastActive;
	}

	public void setLastActive(String lastActive) {
		this.lastActive = lastActive;
	}

	public List<DropdownData> getRoles() {
		return roles;
	}

	public void setRoles(List<DropdownData> roles) {
		this.roles = roles;
	}

	public List<DropdownData> getGroups() {
		return groups;
	}

	public void setGroups(List<DropdownData> groups) {
		this.groups = groups;
	}
}
