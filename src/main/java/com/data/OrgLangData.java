package com.data;

import java.util.List;

public class OrgLangData 
{
	private int orgId;
	
	private List<OrgLang> languages;
	
	private String dateUpdated;
	
	private int updatedBy;
	

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

	public int getOrgId() {
		return orgId;
	}

	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}

	public List<OrgLang> getLanguages() {
		return languages;
	}

	public void setLanguages(List<OrgLang> languages) {
		this.languages = languages;
	}
	
	
}
