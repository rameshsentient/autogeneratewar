package com.data;

import java.util.List;

public class FunctionData {

	private int id;
	private String name;
	private String type;
	//private String typeId;
	private String code;
	private String descrpition1;
	private String descrpition2;
	private String apiendpoint;
	private String iconUrl;
	private String source;
	private String docUrl;
	private String termUrl;
	private String dateUpdated;
	private int updatedBy;

	private List<FunctionPricing> pricing;
	private List<FunctionFeature> feature;
	private List<FunctionImages> images;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
/*
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}*/

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescrpition1() {
		return descrpition1;
	}

	public void setDescrpition1(String descrpition1) {
		this.descrpition1 = descrpition1;
	}

	public String getDescrpition2() {
		return descrpition2;
	}

	public void setDescrpition2(String descrpition2) {
		this.descrpition2 = descrpition2;
	}

	
	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDocUrl() {
		return docUrl;
	}

	public void setDocUrl(String docUrl) {
		this.docUrl = docUrl;
	}

	public String getTermUrl() {
		return termUrl;
	}

	public void setTermUrl(String termUrl) {
		this.termUrl = termUrl;
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

	public List<FunctionPricing> getPricing() {
		return pricing;
	}

	public void setPricing(List<FunctionPricing> pricing) {
		this.pricing = pricing;
	}

	public List<FunctionFeature> getFeature() {
		return feature;
	}

	public void setFeature(List<FunctionFeature> feature) {
		this.feature = feature;
	}

	public List<FunctionImages> getImages() {
		return images;
	}

	public void setImages(List<FunctionImages> images) {
		this.images = images;
	}

	public String getApiendpoint() {
		return apiendpoint;
	}

	public void setApiendpoint(String apiendpoint) {
		this.apiendpoint = apiendpoint;
	}
	
	

}
