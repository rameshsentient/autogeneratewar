package com.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the document_files database table.
 * 
 */
@Entity
@Table(name="document_files")
public class DocumentFile implements Serializable {
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
	@Column(name="FILE_PATH")
	private String filePath;

	//bi-directional many-to-one association to DocumentInfo
	@ManyToOne
	@JoinColumn(name="DOC")
	private DocumentInfo documentInfo;
	
	@Column(name="FILE_NAME")
	private String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public DocumentFile() {
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

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public DocumentInfo getDocumentInfo() {
		return this.documentInfo;
	}

	public void setDocumentInfo(DocumentInfo documentInfo) {
		this.documentInfo = documentInfo;
	}

}