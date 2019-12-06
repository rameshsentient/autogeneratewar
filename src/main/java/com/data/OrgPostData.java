package com.data;

import java.util.List;

public class OrgPostData {

	private int orgId;
	private String orgName;
	private String orgUserName;
	private String ticket;
	private String desc;
	private String email;
	private String publicKey;
	private String dateUpdated;
	private int upDatedBy;

	private int[] functionIds;

	private List<PreDefGroup> preDefGroups;

	public List<PreDefGroup> getPreDefGroups() {
		return preDefGroups;
	}

	public void setPreDefGroups(List<PreDefGroup> preDefGroups) {
		this.preDefGroups = preDefGroups;
	}

	public int[] getFunctionIds() {
		return functionIds;
	}

	public String getPublicKey() {
		return publicKey;
	}

	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}

	public void setFunctionIds(int[] functionIds) {
		this.functionIds = functionIds;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getOrgId() {
		return orgId;
	}

	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(String dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public int getUpDatedBy() {
		return upDatedBy;
	}

	public void setUpDatedBy(int upDatedBy) {
		this.upDatedBy = upDatedBy;
	}

	public String getOrgUserName() {
		return orgUserName;
	}

	public void setOrgUserName(String orgUserName) {
		this.orgUserName = orgUserName;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

}
