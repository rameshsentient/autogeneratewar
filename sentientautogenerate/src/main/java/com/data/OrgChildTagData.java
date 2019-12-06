package com.data;

public class OrgChildTagData 
{

	private int id;
	
	private int orgTagId;
	
	private String tagKey;
	
	private String tagValue;
	
	private String dateCreated;
	
	private String dateUpdated;
	
	private int updatedBy;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrgTagId() {
		return orgTagId;
	}

	public void setOrgTagId(int orgTagId) {
		this.orgTagId = orgTagId;
	}

	public String getTagKey() {
		return tagKey;
	}

	public void setTagKey(String tagKey) {
		this.tagKey = tagKey;
	}

	public String getTagValue() {
		return tagValue;
	}

	public void setTagValue(String tagValue) {
		this.tagValue = tagValue;
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

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}
	
}
