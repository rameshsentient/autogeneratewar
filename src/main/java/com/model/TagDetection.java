package com.model;

public class TagDetection implements Comparable<TagDetection> {
	private String tagId;
	private String dateTime;
	private String readerId;
	private String empId;

	public String getTagId() {
		return tagId;
	}

	public void setTagId(String tagId) {
		this.tagId = tagId;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getReaderId() {
		return readerId;
	}

	public void setReaderId(String readerId) {
		this.readerId = readerId;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public TagDetection(String tagId, String dateTime, String readerId, String empId) {
		super();
		this.tagId = tagId;
		this.dateTime = dateTime;
		this.readerId = readerId;
		this.empId = empId;
	}

	public int compareTo(TagDetection o) {
		return this.dateTime.compareTo(o.dateTime);
	}

}
