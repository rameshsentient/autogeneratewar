package com.data;

import java.util.List;

public class FlexiValSubInfoData 
{	
	private int id;
	
	private int parentId;
	
	private String value;
	
	private String orderBy;
	
	private String dateUpdated;
	
	private int updatedBy;
	
	private List<TransData> languages;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
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

	public List<TransData> getLanguages() {
		return languages;
	}

	public void setLanguages(List<TransData> languages) {
		this.languages = languages;
	}
}
