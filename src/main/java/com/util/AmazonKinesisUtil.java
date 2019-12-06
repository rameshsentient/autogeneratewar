package com.util;

import java.nio.ByteBuffer;

import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.kinesis.AmazonKinesisClient;
import com.amazonaws.services.kinesis.model.PutRecordRequest;
import com.amazonaws.services.kinesis.model.PutRecordResult;

public class AmazonKinesisUtil 
{
	private static final String ACCESS_KEY = "AKIAIQB4EH45JPEIZAGQ";
	private static final String SECRET = "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";	
	//private static final String STREAMNAME = "Sentient_dev_CP";
	private static final String STREAMNAME = "Sentient_KCDel";
	

	
	public static PutRecordResult putRecord(String jsonData)
	{
		BasicAWSCredentials credentials = new BasicAWSCredentials(ACCESS_KEY, SECRET);
		
		AmazonKinesisClient kinesis = new AmazonKinesisClient(credentials);		

		kinesis.withRegion(Regions.AP_SOUTHEAST_1);	
		
		PutRecordRequest putRecordRequest = new PutRecordRequest();
		
		long createTime = System.currentTimeMillis();
		
		putRecordRequest.setStreamName(STREAMNAME);
		
		putRecordRequest.setData(ByteBuffer.wrap(jsonData.getBytes()));
		
		putRecordRequest.setPartitionKey(String.format("partitionKey-%d", createTime));
		
		PutRecordResult putRecordResult = null;
		
		try 
		{
			putRecordResult = kinesis.putRecord(putRecordRequest);
			
		} catch (Exception e) 
		{
			// TODO: handle exception
		}
		
		return putRecordResult;
		
	}
	
	
	
}
