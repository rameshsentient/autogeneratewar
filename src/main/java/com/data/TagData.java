package com.data;

public class TagData {
	private int id;
	private String tag;
	private String value;
	private String delMark;
	
	private int orgTagId;
	
	private String fromType;

	public int getOrgTagId() {
		return orgTagId;
	}

	public void setOrgTagId(int orgTagId) {
		this.orgTagId = orgTagId;
	}

	public String getFromType() {
		return fromType;
	}

	public void setFromType(String fromType) {
		this.fromType = fromType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDelMark() {
		return delMark;
	}

	public void setDelMark(String delMark) {
		this.delMark = delMark;
	}

}
