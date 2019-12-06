package com.util;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

public class HttpUtil {
	
	public static JSONObject callPost(String awsurl, JSONObject obj) {
		JSONObject jsonObject = new JSONObject();
		try {
			String url = awsurl;
			URL object = new URL(url);

			HttpURLConnection con = (HttpURLConnection) object.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			// con.setRequestProperty("Accept", "application/json");
			con.setRequestMethod("POST");
			JSONObject cred = obj;
			OutputStream os = con.getOutputStream();
			os.write(cred.toString().getBytes("UTF-8"));
			os.close();

			// read the response
			InputStream in = new BufferedInputStream(con.getInputStream());
			String result = org.apache.commons.io.IOUtils.toString(in, "UTF-8");
			jsonObject = new JSONObject(result);
			in.close();
			con.disconnect();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return jsonObject;
	}
	
	public static JSONObject callPost(String awsurl, JSONObject obj, String userApiKey) {
		JSONObject jsonObject = new JSONObject();
		try {
			String url = awsurl;
			URL object = new URL(url);

			HttpURLConnection con = (HttpURLConnection) object.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("x-api-key", userApiKey);
			con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			// con.setRequestProperty("Accept", "application/json");
			con.setRequestMethod("POST");
			JSONObject cred = obj;
			OutputStream os = con.getOutputStream();
			os.write(cred.toString().getBytes("UTF-8"));
			os.close();

			// read the response
			InputStream in = new BufferedInputStream(con.getInputStream());
			String result = org.apache.commons.io.IOUtils.toString(in, "UTF-8");
			jsonObject = new JSONObject(result);
			in.close();
			con.disconnect();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return jsonObject;
	}
	
	public static String callPostStr(String awsurl, String obj, String userApiKey) {
		String result = "";
		try {
			String url = awsurl;
			URL object = new URL(url);

			HttpURLConnection con = (HttpURLConnection) object.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("x-api-key", userApiKey);
			con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			// con.setRequestProperty("Accept", "application/json");
			con.setRequestMethod("POST");
			//JSONObject cred = obj;
			OutputStream os = con.getOutputStream();
			os.write(obj.getBytes("UTF-8"));
			os.close();

			// read the response
			InputStream in = new BufferedInputStream(con.getInputStream());
			result = org.apache.commons.io.IOUtils.toString(in, "UTF-8");
			in.close();
			con.disconnect();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	/*public static String callPostStr(String awsurl, JSONObject obj) {
		String result = "";
		try {
			String url = awsurl;
			URL object = new URL(url);

			HttpURLConnection con = (HttpURLConnection) object.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			// con.setRequestProperty("Accept", "application/json");
			con.setRequestMethod("POST");
			JSONObject cred = obj;
			OutputStream os = con.getOutputStream();
			os.write(cred.toString().getBytes("UTF-8"));
			os.close();

			// read the response
			InputStream in = new BufferedInputStream(con.getInputStream());
			result = org.apache.commons.io.IOUtils.toString(in, "UTF-8");
			in.close();
			con.disconnect();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}*/
	
	public static String callPostStr(String awsurl, JSONObject obj, String userApiKey) {
		String result = "";
		try {
			String url = awsurl;
			URL object = new URL(url);

			HttpURLConnection con = (HttpURLConnection) object.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("x-api-key", userApiKey);
			con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			// con.setRequestProperty("Accept", "application/json");
			con.setRequestMethod("POST");
			JSONObject cred = obj;
			OutputStream os = con.getOutputStream();
			os.write(cred.toString().getBytes("UTF-8"));
			os.close();

			// read the response
			InputStream in = new BufferedInputStream(con.getInputStream());
			result = org.apache.commons.io.IOUtils.toString(in, "UTF-8");
			in.close();
			con.disconnect();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}	

	/*public static String callGet(String awsurl) {
		JSONObject jsonObject = new JSONObject();
		String retData = "";
		try {
			String url = awsurl;
			URL object = new URL(url);

			HttpURLConnection con = (HttpURLConnection) object.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			con.setRequestMethod("GET");

			con.connect();

			// read the response
			InputStream in = new BufferedInputStream(con.getInputStream());
			String result = org.apache.commons.io.IOUtils.toString(in, "UTF-8");
			retData = result;
			jsonObject = new JSONObject(result);
			in.close();
			con.disconnect();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return retData;
	}*/
	
	public static String callGet(String awsurl, String userApiKey) {
		
		JSONObject jsonObject = new JSONObject();
		String retData = "";
		try {
			String url = awsurl;
			URL object = new URL(url);

			HttpURLConnection con = (HttpURLConnection) object.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("x-api-key", userApiKey);
			con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			con.setRequestMethod("GET");

			con.connect();

			// read the response
			InputStream in = new BufferedInputStream(con.getInputStream());
			String result = org.apache.commons.io.IOUtils.toString(in, "UTF-8");
			retData = result;
			jsonObject = new JSONObject(result);
			in.close();
			con.disconnect();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return retData;
	}
	
	public static String callGet(String awsurl) {
		
		JSONObject jsonObject = new JSONObject();
		String retData = "";
		try {
			String url = awsurl;
			URL object = new URL(url);

			HttpURLConnection con = (HttpURLConnection) object.openConnection();
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			con.setRequestMethod("GET");
			con.connect();
			// read the response
			InputStream in = new BufferedInputStream(con.getInputStream());
			String result = org.apache.commons.io.IOUtils.toString(in, "UTF-8");
			retData = result;
			jsonObject = new JSONObject(result);
			in.close();
			con.disconnect();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return retData;
	}
}
