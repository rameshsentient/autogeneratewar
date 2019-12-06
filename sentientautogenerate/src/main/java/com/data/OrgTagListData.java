package com.data;

import java.util.List;

public class OrgTagListData 
{
	private int id;
	
	private String tagKey;
	
	private String tagValue;
	
	private String newTagKey;
	
	private String newTagValue;
	
	private boolean excp;
	
	private String checkedStatus;
	
	
	private List<OrgTagListData> childTags;

	public String getCheckedStatus() {
		return checkedStatus;
	}

	public void setCheckedStatus(String checkedStatus) {
		this.checkedStatus = checkedStatus;
	}

	public String getNewTagKey() {
		return newTagKey;
	}

	public void setNewTagKey(String newTagKey) {
		this.newTagKey = newTagKey;
	}

	public String getNewTagValue() {
		return newTagValue;
	}

	public void setNewTagValue(String newTagValue) {
		this.newTagValue = newTagValue;
	}

	public boolean isExcp() {
		return excp;
	}

	public void setExcp(boolean excp) {
		this.excp = excp;
	}

	public List<OrgTagListData> getChildTags() {
		return childTags;
	}

	public void setChildTags(List<OrgTagListData> childTags) {
		this.childTags = childTags;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
}
