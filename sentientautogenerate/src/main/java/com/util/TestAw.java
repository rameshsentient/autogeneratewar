package com.util;

import java.util.ArrayList;
import java.util.List;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.S3ObjectSummary;

public class TestAw {
	
	public static void main(String[] args) {
	
		
		String ACCESS_KEY = "AKIAIQB4EH45JPEIZAGQ";
		String SECRET = "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";
		String BUCKET = "sentient-dev";
		
		String folderName = "docx";
		
		AWSCredentials awsCreds = new BasicAWSCredentials(ACCESS_KEY, SECRET);
		
		AmazonS3 s3Client = new AmazonS3Client(awsCreds);
		

/*		List<Bucket> buckets = s3Client.listBuckets();
		
		for (Bucket b : buckets) {
		    System.out.println("* " + b.getName());
		}*/
		
		
		ObjectListing listing = s3Client.listObjects(new ListObjectsRequest().withBucketName(BUCKET));
		
		for (S3ObjectSummary objectSummary : listing.getObjectSummaries()) {
		
		System.out.println(" -> " + objectSummary.getKey() + "  " + "(size = " + objectSummary.getSize()/1024 + " KB)");
		
		}		
		
		System.out.println("-------------------------------------------");
		
		ListObjectsRequest listObjectsRequest = new ListObjectsRequest()
	            .withBucketName(BUCKET).withPrefix("docx").withDelimiter("/");
		
		ObjectListing objects = s3Client.listObjects(listObjectsRequest);
		
		List<String> paths = new ArrayList<String>();
		
		paths = objects.getCommonPrefixes();
		
		for(String p : paths)
		{
			System.out.println(p);
		}
		
		
		/*boolean exists = s3Client.doesObjectExist(BUCKET, folderName);
		
		//CopyObjectRequest copyObjRequest = new CopyObjectRequest(BUCKET, "myObject.txt", BUCKET, "myNewObject.txt");              
		//s3Client.copyObject(copyObjRequest);
		if(!exists)
		{
			ObjectMetadata metadata = new ObjectMetadata();
			metadata.setContentLength(0);
			// create empty content
			InputStream emptyContent = new ByteArrayInputStream(new byte[0]);
			// create a PutObjectRequest passing the folder name suffixed by /
			PutObjectRequest putObjectRequest = new PutObjectRequest(BUCKET, folderName + "/", emptyContent, metadata);
			// send request to S3 to create folder
			
			s3Client.putObject(putObjectRequest);
		}
		
		ListObjectsRequest listObjectsRequest = new ListObjectsRequest()
	            .withBucketName(BUCKET);
		
		ObjectListing objects = s3Client.listObjects(listObjectsRequest);
		
		List<String> paths = new ArrayList<String>();
		
		while (objects == null || objects.isTruncated()) {
			
			objects = s3Client.listNextBatchOfObjects(objects);
			
			paths.addAll(objects.getCommonPrefixes());
			
		}*/
		
		//boolean exists2 = s3Client.doesObjectExist(BUCKET, folderName);

	}

}
