package com.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.ObjectTagging;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.SetObjectTaggingRequest;
import com.amazonaws.services.s3.model.Tag;
import com.data.TagData;



public class AWSUtil 
{
	public static final String ACCESS_KEY = "AKIAIQB4EH45JPEIZAGQ";
	public static final String SECRET = "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";
	/*public static final String ACCESS_KEY = "AKIAJW73UQY3XNYFZGBA";
	public static final String SECRET = "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";*/
	//public static final String BUCKET = "mediasoftimages";
	// dev : sentient-dev
	// pro : sentient-prod
	public static final String BUCKET = "sentient-prod";
		
	public static String uploadFile(String keyname, String fileType, MultipartFile file,int id, int org)
	{
		String url = null;
		String docType = null;
		String orgBucket="organizations/org_"+org;
		docType=fileType;
		if(fileType==null || fileType.isEmpty()){
			String [] fileNames=keyname.split("\\.");
			fileType=fileNames[fileNames.length-1];
			docType=fileType;
		}
		
		keyname = keyname.replaceAll("[^a-zA-Z0-9.]", "");
		
		AWSCredentials awsCreds = new BasicAWSCredentials(ACCESS_KEY, SECRET);
		
		AmazonS3 s3Client = new AmazonS3Client(awsCreds);
		
		PutObjectRequest req;
		
		if(org>0){
			
			if(!s3Client.doesObjectExist(BUCKET, orgBucket))
			{
				createFolder(BUCKET, orgBucket, s3Client );
				fileType=orgBucket+"/"+fileType;
			}
		}
		
		if(!s3Client.doesObjectExist(BUCKET, fileType))
		{
			createFolder(BUCKET, fileType, s3Client );
		}
		
		keyname = fileType+"/"+keyname;
		
		try {
			
			ObjectMetadata met = new ObjectMetadata();
			met.setContentType(file.getContentType());
			
			InputStream inputStream = file.getInputStream();
			
			req = new PutObjectRequest(BUCKET,keyname, inputStream, met).withCannedAcl(CannedAccessControlList.PublicRead);
		
				if(id>0){
				 	List<Tag> tags = new ArrayList<Tag>();
				 	tags.add(new Tag("orgid", org+""));
				 	tags.add(new Tag("doc_id", id+""));
				 	tags.add(new Tag("content_format", docType));
				 	req.setTagging(new ObjectTagging(tags));
				}

			 	 /*if(tagsList!=null){
			 		 for(TagData tag:tagsList){
			 			 if("N".equalsIgnoreCase(tag.getDelMark())){
			 				tags.add(new Tag(tag.getTag(), tag.getValue()));
			 			 }
			 		 }
			 		req.setTagging(new ObjectTagging(tags));
			 	 }*/
			
			s3Client.putObject(req);
			url = "https://"+BUCKET+".s3.amazonaws.com/"+keyname;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return url;
	}
	
	
	//UPDATE FILE TAGS IN AWS
	public static void updateTags(String filePath,List<TagData> tagsList, int orgId)
	{
		AWSCredentials awsCreds = new BasicAWSCredentials(ACCESS_KEY, SECRET);
		AmazonS3 s3Client = new AmazonS3Client(awsCreds);
		try {
			 	 List<Tag> tags = new ArrayList<Tag>();
			 	 if(tagsList!=null){
			 		 for(TagData tag:tagsList){
			 			 if("N".equalsIgnoreCase(tag.getDelMark())){
			 				tags.add(new Tag(tag.getTag(), tag.getValue()));
			 			 }
			 		 }
			 	 }
			 	tags.add(new Tag("orgid", orgId+""));
			s3Client.setObjectTagging(new SetObjectTaggingRequest(BUCKET,filePath,new ObjectTagging(tags)));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	public static void createFolder(String bucketName, String folderName, AmazonS3 client) 
	{
		// create meta-data for your folder and set content-length to 0
		ObjectMetadata metadata = new ObjectMetadata();
		metadata.setContentLength(0);
		// create empty content
		InputStream emptyContent = new ByteArrayInputStream(new byte[0]);
		// create a PutObjectRequest passing the folder name suffixed by /
		PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName,
					folderName + "/", emptyContent, metadata).withCannedAcl(CannedAccessControlList.PublicRead);
		// send request to S3 to create folder
		client.putObject(putObjectRequest);
	}
	
	public static void moveFile(String folder, String fileName,String fileBucket,String filePath)
	{
		
		String[] patArray = filePath.split("/" + folder + "/");
		String[] deletedUrl=patArray[0].split("/organizations/");
		String newUrl="";
		if (patArray.length > 0) {
			 newUrl=fileBucket+"/"+ deletedUrl[1]+"/"+folder+"/";
		}
		
		
		AWSCredentials awsCreds = new BasicAWSCredentials(ACCESS_KEY, SECRET);
		
		AmazonS3 s3Client = new AmazonS3Client(awsCreds);
		
		boolean isExist = s3Client.doesObjectExist(BUCKET, newUrl);
		
		if(!isExist)
		{
			createFolder(BUCKET, newUrl, s3Client);
		}
		
		//if(s3Client.doesObjectExist(BUCKET, "deleted/"+folder+"/"))
		//{
			String from = "organizations/"+deletedUrl[1]+"/"+folder+"/"+fileName;
			String to = newUrl+fileName;
			CopyObjectRequest copyObjRequest = new CopyObjectRequest(BUCKET, from, BUCKET, to);              
			s3Client.copyObject(copyObjRequest);
			
			s3Client.deleteObject(BUCKET, from);
		//}
	}
}
