package com.data;

import java.util.List;

public class GroupInfoData 
{
	private int id;
	
	private String groupName;
	
	private String groupDesc;
	
	private String dateCreated;
	
	private String dateUpdated;
	
	private String creadedBy;
	
	private List<DropdownData> gFunction;
	
	private List<DropdownData> users;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupDesc() {
		return groupDesc;
	}

	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
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

	public List<DropdownData> getgFunction() {
		return gFunction;
	}

	public void setgFunction(List<DropdownData> gFunction) {
		this.gFunction = gFunction;
	}

	public List<DropdownData> getUsers() {
		return users;
	}

	public void setUsers(List<DropdownData> users) {
		this.users = users;
	}	
	
}
