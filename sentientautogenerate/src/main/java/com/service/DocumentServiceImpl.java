package com.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.dao.DocumentFileDao;
import com.dao.DocumentInfoDao;
import com.data.DocumentData;
import com.data.DocumentFlieData;
import com.model.DocumentFile;
import com.model.DocumentInfo;
import com.util.AWSUtil;
import com.util.DateUtil;

@Service
public class DocumentServiceImpl implements DocumentService{
	
	@Autowired
	private DocumentInfoDao documentInfoDao;
	
	@Autowired
	private DocumentFileDao documentFileDao;

	public DocumentFileDao getDocumentFileDao() {
		return documentFileDao;
	}

	public void setDocumentFileDao(DocumentFileDao documentFileDao) {
		this.documentFileDao = documentFileDao;
	}

	public DocumentInfoDao getDocumentInfoDao() {
		return documentInfoDao;
	}

	public void setDocumentInfoDao(DocumentInfoDao documentInfoDao) {
		this.documentInfoDao = documentInfoDao;
	}

	@Transactional
	@Override
	public int addDocumentInfo(DocumentData documentData) {
		
		DocumentInfo documentInfo = new DocumentInfo();
		
		int id = documentData.getId();
		
		if(id > 0)
		{
			documentInfo = documentInfoDao.getByKey(id);
			documentInfo.setDateUpdated(new Date());
		}
		else
		{
			documentInfo.setDateCreated(new Date());
			documentInfo.setDateUpdated(new Date());
		}
		
		documentInfo.setDocName(documentData.getDocName());
		documentInfo.setDescription(documentData.getDocDesc());
		documentInfo.setDocAccess(documentData.getDocAcces());
		documentInfo.setDocFormat(documentData.getDocFormat());
		documentInfo.setUploadType(documentData.getUploadType());
		
		/*if(documentInfo.getDocumentFiles() == null)
		{
			documentInfo.setDocumentFiles(new ArrayList<DocumentFile>());
		}
		
		if(documentData.getFiles() != null)
		{
			List<MultipartFile> files = documentData.getFiles();
			
			for(MultipartFile file : files)
			{
				String keyname = file.getName();
				String filePath = AWSUtil.uploadFile(keyname, file);
				
				DocumentFile documentFile = new DocumentFile();
				
				documentFile.setFilePath(filePath);
				
				documentFile.setDateCreated(new Date());
				documentFile.setDateUpdated(new Date());
				documentFile.setDocumentInfo(documentInfo);
				
				documentInfo.getDocumentFiles().add(documentFile);
			}
		}*/
		
		documentInfoDao.saveOrUpdate(documentInfo);
		
		return documentInfo.getId();
	}
	
	@Transactional
	@Override	
	@Async
	public void uploadDoc( MultipartFile fileUploadData,int id,int org)
	{
		DocumentInfo documentInfo = documentInfoDao.getByKey(id);
		String keyname = fileUploadData.getOriginalFilename();
		
		String filePath = AWSUtil.uploadFile(keyname, documentInfo.getDocFormat(), fileUploadData,0,org);
		
		DocumentFile documentFile = new DocumentFile();
		
		documentFile.setDocumentInfo(documentInfo);
		documentFile.setFileName(keyname);
		documentFile.setFilePath(filePath);
		documentFile.setDateCreated(new Date());
		documentFile.setDateUpdated(new Date());
		
		documentFileDao.saveOrUpdate(documentFile);
		
	}

	@Transactional
	@Override
	public List<DocumentData> getDocumentinfoList() {
		
		Criteria criteria = documentInfoDao.createEntityCriteria();
		criteria.addOrder(Order.desc("dateUpdated"));
		
		List<DocumentInfo> documentInfoList = documentInfoDao.findByCriteria(criteria);
		
		List<DocumentData> documentDataList = new ArrayList<DocumentData>();
		
		for(DocumentInfo documentInfo : documentInfoList)
		{
			DocumentData documentData = new DocumentData();
			
			documentData.setId(documentInfo.getId());
			documentData.setUploadType(documentInfo.getUploadType());
			documentData.setDocName(documentInfo.getDocName());
			documentData.setDocDesc(documentInfo.getDescription());			
			documentData.setDocFormat(documentInfo.getDocFormat());
			documentData.setDateUpdated(DateUtil.dateToStrDateTime(documentInfo.getDateCreated()));
			documentData.setDateCreated(DateUtil.dateToStrDateTime(documentInfo.getDateUpdated()));
			documentData.setStatus("Active");
			documentData.setDocAcces(documentInfo.getDocAccess());
			
			List<DocumentFile> documentFileList =  documentInfo.getDocumentFiles();
			
			List<DocumentFlieData> documentFlieDataList = new ArrayList<DocumentFlieData>();
			
			if(documentFileList != null)
			{
				for(DocumentFile documentFile : documentFileList)
				{
					
					if(documentFile.getFilePath() != null)
					{
						DocumentFlieData documentFlieData = new DocumentFlieData();
						documentFlieData.setFilePath(documentFile.getFilePath());
						documentFlieData.setName(documentFile.getFileName());
						documentFlieData.setId(documentFile.getId());						
						documentFlieDataList.add(documentFlieData);
					}
				}
			}
			documentData.setFlieDataList(documentFlieDataList);			
			documentDataList.add(documentData);			
		}		
		
		return documentDataList;
	}
	
	@Transactional
	@Override
	public DocumentData getDocInfo(int id)
	{
		DocumentInfo documentInfo = documentInfoDao.getByKey(id);
		
		DocumentData documentData = new DocumentData();
		
		documentData.setId(documentInfo.getId());
		documentData.setUploadType(documentInfo.getUploadType());
		documentData.setDocName(documentInfo.getDocName());
		documentData.setDocDesc(documentInfo.getDescription());			
		documentData.setDocFormat(documentInfo.getDocFormat());
		documentData.setDateUpdated(DateUtil.dateToStrDateTime(documentInfo.getDateCreated()));
		documentData.setDateCreated(DateUtil.dateToStrDateTime(documentInfo.getDateUpdated()));
		documentData.setStatus("Active");
		documentData.setDocAcces(documentInfo.getDocAccess());
		
		List<DocumentFile> documentFileList =  documentInfo.getDocumentFiles();
		
		List<DocumentFlieData> documentFlieDataList = new ArrayList<DocumentFlieData>();
		
		if(documentFileList != null)
		{
			for(DocumentFile documentFile : documentFileList)
			{
				
				if(documentFile.getFilePath() != null)
				{
					DocumentFlieData documentFlieData = new DocumentFlieData();
					documentFlieData.setFilePath(documentFile.getFilePath());
					documentFlieData.setId(documentFile.getId());	
					documentFlieData.setName(documentFile.getFileName());
					documentFlieDataList.add(documentFlieData);
				}
			}
		}
		documentData.setFlieDataList(documentFlieDataList);
		
		return documentData;
		
	}
	
	@Transactional
	@Override
	public boolean deleteDocument(String ids)
	{
		try 
		{
			String[] idArray = ids.split(",");
			
			for(String sId : idArray)
			{			
				DocumentInfo documentInfo = documentInfoDao.getByKey(Integer.parseInt(sId));
				
				if(documentInfo.getDocumentFiles() != null)
				{
					for(DocumentFile documentFile : documentInfo.getDocumentFiles())
					{
						deleteFile(documentFile.getId());
					}
				}
				
				documentInfoDao.delete(documentInfo);
			}
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}
		return true;
	}
	
	@Transactional
	@Override
	public boolean deleteFile(int id)
	{
		try 
		{
			DocumentFile documentFile = documentFileDao.getByKey(id);
			
			documentFileDao.delete(documentFile);
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}
		
		return true;
	}

}
