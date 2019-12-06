package com.data;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadData {
	
	private MultipartFile file;
	
	private int docId;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getDocId() {
		return docId;
	}

	public void setDocId(int docId) {
		this.docId = docId;
	}

}
