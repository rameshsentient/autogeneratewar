package com.data;

import java.util.List;

public class MicroData {

	private int id;
	private String name;
	private String desc;
	private String category;
	private List<MicroFunctionData> functions;
	private String dateUpdated;
	private int updatedBy;
	private String categoryName;
	
	public String getCategoryName() {
	  return categoryName;
	 }

	 public void setCategoryName(String categoryName) {
	  this.categoryName = categoryName;
	 }
		 
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public List<MicroFunctionData> getFunctions() {
		return functions;
	}

	public void setFunctions(List<MicroFunctionData> functions) {
		this.functions = functions;
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
