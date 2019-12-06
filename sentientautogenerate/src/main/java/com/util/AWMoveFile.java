package com.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AWMoveFile 
{

	public static void main(String[] args) 
	{
		String ACCESS_KEY = "AKIAIQB4EH45JPEIZAGQ";
		String SECRET = "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";
		String BUCKET = "sentient-dev";
		
		AWSCredentials awsCreds = new BasicAWSCredentials(ACCESS_KEY, SECRET);
		
		AmazonS3 s3Client = new AmazonS3Client(awsCreds);
		
		boolean isExist = s3Client.doesObjectExist(BUCKET, "deleted/docx/");
		
		if(!isExist)
		{
			// create meta-data for your folder and set content-length to 0
			ObjectMetadata metadata = new ObjectMetadata();
			metadata.setContentLength(0);
			// create empty content
			InputStream emptyContent = new ByteArrayInputStream(new byte[0]);
			// create a PutObjectRequest passing the folder name suffixed by /
			PutObjectRequest putObjectRequest = new PutObjectRequest(BUCKET,
						"deleted/docx/", emptyContent, metadata);
			// send request to S3 to create folder
			s3Client.putObject(putObjectRequest);
		}
		
		if(s3Client.doesObjectExist(BUCKET, "deleted/docx/"))
		{		
			CopyObjectRequest copyObjRequest = new CopyObjectRequest(BUCKET, "docx/testDoc.docx", BUCKET, "deleted/docx/testDoc.docx");              
			s3Client.copyObject(copyObjRequest);
		}
		
		
	}
}
