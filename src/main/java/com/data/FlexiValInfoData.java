package com.data;

import java.util.List;

public class FlexiValInfoData 
{
	private int id;
	
	private int lstId;
	
	private String value;
	
	private String orderBy;
	
	private String dateUpdated;
	
	private String subList;
	
	private int updatedBy;
	
	private List<TransData> languages;
	
	

	public String getSubList() {
		return subList;
	}

	public void setSubList(String subList) {
		this.subList = subList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLstId() {
		return lstId;
	}

	public void setLstId(int lstId) {
		this.lstId = lstId;
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
