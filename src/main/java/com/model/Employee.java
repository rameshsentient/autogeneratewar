package com.model;

public class Employee  implements Comparable<Employee>{
	private String employeeID;
	private String employeeName;
	private String tagId;

	public String getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(String employeeID) {
		this.employeeID = employeeID;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getTagId() {
		return tagId;
	}

	public void setTagId(String tagId) {
		this.tagId = tagId;
	}

	public Employee(String employeeID, String employeeName) {
		super();
		this.employeeID = employeeID;
		this.employeeName = employeeName;
	}

	public Employee() {
		super();
		
	}
	
	public int compareTo(Employee  o) {
		return this.employeeID.compareTo(o.employeeID);
	}
	

}
