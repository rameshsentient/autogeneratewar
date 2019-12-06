package com.data;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DocumentData {
	
	private int id;
	
	private String docName;
	
	private String docDesc;
	
	private String uploadType;
	
	private String dateCreated;
	
	private String dateUpdated;
	
	private String docFormat;
	
	private String docAcces;
	
	private String status;
	
	private String sentSourceURl;
	
	private List<DocumentFlieData> docFiles;
	
	private List<MultipartFile> files;	
	
	
	public String getSentSourceURl() {
		return sentSourceURl;
	}

	public void setSentSourceURl(String sentSourceURl) {
		this.sentSourceURl = sentSourceURl;
	}

	public List<DocumentFlieData> getDocFiles() {
		return docFiles;
	}

	public void setDocFiles(List<DocumentFlieData> docFiles) {
		this.docFiles = docFiles;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public String getDocFormat() {
		return docFormat;
	}

	public void setDocFormat(String docFormat) {
		this.docFormat = docFormat;
	}

	public String getDocAcces() {
		return docAcces;
	}

	public void setDocAcces(String docAcces) {
		this.docAcces = docAcces;
	}

	private List<DocumentFlieData> flieDataList;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getDocDesc() {
		return docDesc;
	}

	public void setDocDesc(String docDesc) {
		this.docDesc = docDesc;
	}

	public String getUploadType() {
		return uploadType;
	}

	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
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

	public List<DocumentFlieData> getFlieDataList() {
		return flieDataList;
	}

	public void setFlieDataList(List<DocumentFlieData> flieDataList) {
		this.flieDataList = flieDataList;
	}

}
