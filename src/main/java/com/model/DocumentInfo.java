package com.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the document_info database table.
 * 
 */
@Entity
@Table(name="document_info")
public class DocumentInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DATE_CREATED")
	private Date dateCreated;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DATE_UPDATED")
	private Date dateUpdated;

	@Lob
	private String description;

	@Column(name="DOC_NAME")
	private String docName;

	@Column(name="DOC_TYPE")
	private String docType;

	@Column(name="UPLOAD_TYPE")
	private String uploadType;
	
	@Column(name="DOC_FORMAT")
	private String docFormat;
	
	@Column(name="DOC_ACCESS")
	private String docAccess;	

	public String getDocFormat() {
		return docFormat;
	}

	public void setDocFormat(String docFormat) {
		this.docFormat = docFormat;
	}

	public String getDocAccess() {
		return docAccess;
	}

	public void setDocAccess(String docAccess) {
		this.docAccess = docAccess;
	}

	//bi-directional many-to-one association to DocumentFile
	@OneToMany(mappedBy="documentInfo", cascade = CascadeType.ALL)
	private List<DocumentFile> documentFiles;

	public DocumentInfo() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDateCreated() {
		return this.dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Date getDateUpdated() {
		return this.dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDocName() {
		return this.docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getDocType() {
		return this.docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}

	public String getUploadType() {
		return this.uploadType;
	}

	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}

	public List<DocumentFile> getDocumentFiles() {
		return this.documentFiles;
	}

	public void setDocumentFiles(List<DocumentFile> documentFiles) {
		this.documentFiles = documentFiles;
	}

	public DocumentFile addDocumentFile(DocumentFile documentFile) {
		getDocumentFiles().add(documentFile);
		documentFile.setDocumentInfo(this);

		return documentFile;
	}

	public DocumentFile removeDocumentFile(DocumentFile documentFile) {
		getDocumentFiles().remove(documentFile);
		documentFile.setDocumentInfo(null);

		return documentFile;
	}

}