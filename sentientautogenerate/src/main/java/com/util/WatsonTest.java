package com.util;

import java.io.File;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ibm.watson.developer_cloud.document_conversion.v1.DocumentConversion;
import com.ibm.watson.developer_cloud.document_conversion.v1.model.Answers;

public class WatsonTest 
{
	public static void main(String[] args) 
	{
		DocumentConversion service = new DocumentConversion("2017-09-27");
		
		String userName = "b3e45942-0f68-44aa-aa3d-3697e27d8d1e";
		String password = "ajILP874UmzF";
		
		service.setUsernameAndPassword(userName,password);
		
		service.setEndPoint("https://gateway.watsonplatform.net/document-conversion/api");
		

		
		File doc = new File("D:\\temp\\test-HTML-doc.html");
		
		String configAsString = "{"
				  + "\"word\":{"
				  + "\"heading\":{"
				  + "\"fonts\":["
				  + "{\"level\":1,\"min_size\":24},"
				  + "{\"level\":2,\"min_size\":16,\"max_size\":24}"
				  + "]}}}";
		
		configAsString = "{}";
		
		JsonParser jsonParser = new JsonParser();
		
		JsonObject customConfig = jsonParser.parse(configAsString).getAsJsonObject();
		
		
		Answers response = service.convertDocumentToAnswer(doc, null, customConfig).execute();

		System.out.println(response);

	}
}
