package com.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataSource {
	public static Map<String, Employee> EMPLOYEE_MAP;
	public static List<TagDetection> TAG_DETECTION_LIST = new ArrayList<TagDetection>();
	
	public static void init() {
		
	
		EMPLOYEE_MAP = new HashMap<String, Employee>();
		Employee e1 = new Employee("EMP01", "John SMITH");
		EMPLOYEE_MAP.put("EMP01", e1);
		Employee e2 = new Employee("EMP02", "Charlie");
		EMPLOYEE_MAP.put("EMP02", e2);
		Employee e3 = new Employee("EMP03", "Benjamin");
		EMPLOYEE_MAP.put("EMP03", e3);
		Employee e4 = new Employee("EMP04", "Dallas Xavier");
		EMPLOYEE_MAP.put("EMP04", e4);
		Employee e5 = new Employee("EMP05", "Draco");
		EMPLOYEE_MAP.put("EMP05", e5);
		Employee e6 = new Employee("EMP06", "Dylan Christopher");
		EMPLOYEE_MAP.put("EMP06", e6);
		Employee e7 = new Employee("EMP07", "Future Wilburn");
		EMPLOYEE_MAP.put("EMP07", e7);
		Employee e8 = new Employee("EMP08", "Genesis Ali");
		EMPLOYEE_MAP.put("EMP08", e8);
		Employee e9 = new Employee("EMP09", "Hunter Lee");
		EMPLOYEE_MAP.put("EMP09", e9);
		Employee e10 = new Employee("EMP10", "Oliver Charles");
		EMPLOYEE_MAP.put("EMP10", e10);		
	}
	
	public static List<Employee> getEmployeeList(){
		if(EMPLOYEE_MAP==null){
			init();
		}
		
		List<Employee> empList = new ArrayList<Employee>();
		for(String key : EMPLOYEE_MAP.keySet()){
			empList.add(EMPLOYEE_MAP.get(key));
		}
		Collections.sort(empList);
		return empList;
	}
	
	public static void updateEmployee(String empId, String tagId){
		Employee emp = EMPLOYEE_MAP.get(empId);
		emp.setTagId(tagId);
	}
	
	public static void addTagDetection(String tagId, String dateTime, String readerId){
		String empName = "-";	
		
		for(Employee emp : getEmployeeList()){
			if(emp.getTagId()!=null){
			if(emp.getTagId().equalsIgnoreCase(tagId)){
				empName = emp.getEmployeeName() + "[" + emp.getEmployeeID() + "]";
			}
		}	
		}
		TAG_DETECTION_LIST.add(new TagDetection(tagId, dateTime, readerId, empName));
		Collections.sort(TAG_DETECTION_LIST);
		Collections.reverse(TAG_DETECTION_LIST);
	}
	
	public static List<TagDetection> getTagDetections(){
		return TAG_DETECTION_LIST;
	}
}
