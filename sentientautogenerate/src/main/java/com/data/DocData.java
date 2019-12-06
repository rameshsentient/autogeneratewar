package com.data;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DocData {

	private int id;
	
	private int orgId;
	
	private String docName;

	private String docDesc;

	private String docFormat;

	private String uploadType;

	private String docAcces;

	private String fileName;

	private String filePath;

	private String dateCreated;

	private String dateUpdated;

	private String status;

	private String delMark;

	private List<TagData> tags;

	private MultipartFile docFile;

	private String wDiscDocID;

	private List<DocCollectionData> collectionIds;

	private String isFileChanged;
	

	public int getOrgId() {
		return orgId;
	}

	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}

	public String getIsFileChanged() {
		return isFileChanged;
	}

	public void setIsFileChanged(String isFileChanged) {
		this.isFileChanged = isFileChanged;
	}

	public List<DocCollectionData> getCollectionIds() {
		return collectionIds;
	}

	public void setCollectionIds(List<DocCollectionData> collectionIds) {
		this.collectionIds = collectionIds;
	}

	public String getwDiscDocID() {
		return wDiscDocID;
	}

	public void setwDiscDocID(String wDiscDocID) {
		this.wDiscDocID = wDiscDocID;
	}

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

	public String getDocFormat() {
		return docFormat;
	}

	public void setDocFormat(String docFormat) {
		this.docFormat = docFormat;
	}

	public String getUploadType() {
		return uploadType;
	}

	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}

	public String getDocAcces() {
		return docAcces;
	}

	public void setDocAcces(String docAcces) {
		this.docAcces = docAcces;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDelMark() {
		return delMark;
	}

	public void setDelMark(String delMark) {
		this.delMark = delMark;
	}

	public List<TagData> getTags() {
		return tags;
	}

	public void setTags(List<TagData> tags) {
		this.tags = tags;
	}

	public MultipartFile getDocFile() {
		return docFile;
	}

	public void setDocFile(MultipartFile docFile) {
		this.docFile = docFile;
	}
}
