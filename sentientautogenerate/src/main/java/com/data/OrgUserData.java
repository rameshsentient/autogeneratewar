package com.data;

import java.util.List;

public class OrgUserData {

	private int id;
	private List<DropdownData> groups;
	private List<DropdownData> roles;
	private String lastActivity;
	private String userName;
	private String creadedBy;
	private String dateCreaded;
	private String rootUser;
	private String userApiKey;
	
	public String getUserApiKey() {
		return userApiKey;
	}

	public void setUserApiKey(String userApiKey) {
		this.userApiKey = userApiKey;
	}

	public String getRootUser() {
		return rootUser;
	}

	public void setRootUser(String rootUser) {
		this.rootUser = rootUser;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<DropdownData> getGroups() {
		return groups;
	}

	public void setGroups(List<DropdownData> groups) {
		this.groups = groups;
	}

	public List<DropdownData> getRoles() {
		return roles;
	}

	public void setRoles(List<DropdownData> roles) {
		this.roles = roles;
	}

	public String getLastActivity() {
		return lastActivity;
	}

	public void setLastActivity(String lastActivity) {
		this.lastActivity = lastActivity;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCreadedBy() {
		return creadedBy;
	}

	public void setCreadedBy(String creadedBy) {
		this.creadedBy = creadedBy;
	}

	public String getDateCreaded() {
		return dateCreaded;
	}

	public void setDateCreaded(String dateCreaded) {
		this.dateCreaded = dateCreaded;
	}

}
