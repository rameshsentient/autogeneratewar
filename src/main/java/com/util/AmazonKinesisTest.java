package com.util;

import java.nio.ByteBuffer;

import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.kinesis.AmazonKinesisClient;
import com.amazonaws.services.kinesis.model.PutRecordRequest;
import com.amazonaws.services.kinesis.model.PutRecordResult;

public class AmazonKinesisTest 
{
	public static void main(String[] args) 
	{
		String ACCESS_KEY = "AKIAIQB4EH45JPEIZAGQ";
		
		String SECRET = "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";
		
		String STREAMNAME = "Sentient_dev_CP";
		
		BasicAWSCredentials credentials = new BasicAWSCredentials(ACCESS_KEY, SECRET);
		
		AmazonKinesisClient kinesis = new AmazonKinesisClient(credentials);		

		kinesis.withRegion(Regions.AP_SOUTHEAST_1);
		
		PutRecordRequest putRecordRequest = new PutRecordRequest();
		
		long createTime = System.currentTimeMillis();
		
		putRecordRequest.setStreamName(STREAMNAME);
		
		//String jsonString = "{'articleUrl':'https://s3.amazonaws.com/sentient-dev/pdf/1506411165662Booking1505464392266.pdf','docId':,'4', 'docFormat':'pdf', 'tableName':'documents', 'columnName':'contentprofileurl'}";
		
		String jsonString = "{'articleUrl':'http://money.cnn.com/2017/09/26/technology/facebook-russia-data-blocked/index.html','docId':,'4', 'docFormat':'url', 'tableName':'documents', 'columnName':'contentprofileurl'}";
		
		
		
		putRecordRequest.setData(ByteBuffer.wrap(jsonString.getBytes()));
		
		putRecordRequest.setPartitionKey(String.format("partitionKey-%d", createTime));
		
		PutRecordResult putRecordResult = kinesis.putRecord(putRecordRequest);
		
	
		
		
		System.out.printf("Successfully put record, to Kinesis - "
		         + STREAMNAME + " : Sequence Number - "
		         + putRecordResult.getSequenceNumber());
	}
}
