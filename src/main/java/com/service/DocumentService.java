package com.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.data.DocumentData;

public interface DocumentService 
{
	public int addDocumentInfo(DocumentData documentData);
	
	public void uploadDoc( MultipartFile fileUploadData,int id,int org);
	
	public List<DocumentData> getDocumentinfoList();
	
	public DocumentData getDocInfo(int id);
	
	public boolean deleteDocument(String ids);
	
	public boolean deleteFile(int id);
}
