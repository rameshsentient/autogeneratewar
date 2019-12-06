package com.data;

import java.util.List;

public class FunctionInfoData {
	private int id;

	private String funName;

	private String code;

	private String funDesc;

	private String type;

	private String typeId;

	private String funDesc2;

	private String apiendpoint;

	private String iconUrl;

	private String source;

	private String docUrl;

	private String termUrl;

	private String dateCreated;

	private String dateUpdated;

	private String creadedBy;

	private List<DropdownData> groups;

	private List<DropdownData> roles;

	private List<DropdownData> users;

	private List<FunctionPricing> pricing;

	private List<FunctionFeature> feature;

	private List<FunctionImages> images;
	private List<DropdownData> microServices;

	public List<DropdownData> getMicroServices() {
		return microServices;
	}

	public void setMicroServices(List<DropdownData> microServices) {
		this.microServices = microServices;
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

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFunDesc2() {
		return funDesc2;
	}

	public void setFunDesc2(String funDesc2) {
		this.funDesc2 = funDesc2;
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFunName() {
		return funName;
	}

	public void setFunName(String funName) {
		this.funName = funName;
	}

	public String getFunDesc() {
		return funDesc;
	}

	public void setFunDesc(String funDesc) {
		this.funDesc = funDesc;
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

	public List<DropdownData> getUsers() {
		return users;
	}

	public void setUsers(List<DropdownData> users) {
		this.users = users;
	}

	public String getApiendpoint() {
		return apiendpoint;
	}

	public void setApiendpoint(String apiendpoint) {
		this.apiendpoint = apiendpoint;
	}

}
