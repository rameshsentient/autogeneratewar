package com.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.data.DropdownData;
import com.data.DropdownList;
import com.data.FlexiPostData;
import com.fasterxml.jackson.databind.ObjectMapper;

public class FlexiUtil {

	public static void getFlexiMapping(HttpSession session, FlexiPostData flexiPostData, String apiURL,
			String screenId) {
		JSONObject jsonPostObject = new JSONObject(flexiPostData);
		
		String userApiKey = session.getAttribute("userApiKey").toString();

		JSONObject jsObj = HttpUtil.callPost(apiURL, jsonPostObject, userApiKey);

		JSONArray jsonArray = jsObj.getJSONArray("result");

		Map<String, Map<String, String>> labelsMap = new HashMap<String, Map<String, String>>();

		Map<String, String> labelsForScr = new HashMap<String, String>();

		for (int index = 0; index < jsonArray.length(); index++) {
			JSONObject jjsonObject = jsonArray.getJSONObject(index);
			String value = jjsonObject.getString("value");
			String code = jjsonObject.getString("code");

			labelsForScr.put(code, value);

		}

		labelsMap.put(screenId, labelsForScr);

		session.setAttribute(screenId, labelsMap);
	}

	public static String getFlexiListValue(HttpSession session, String code) {

		List<DropdownData> data = new ArrayList<>();
		//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		int orgId = 1;
		
		String jsObj ="";
		
		if(session.getAttribute("orgLang") != null)
		{
			String orgLang = session.getAttribute("orgLang").toString();
	
			String obj = "{\"orgId\":" + orgId + ",\"lang\":\"" + orgLang + "\",\"code\":\"" + code + "\"}";
			
			String userApiKey = session.getAttribute("userApiKey").toString();
	
			jsObj = HttpUtil.callPostStr(APIUtil.LIST_VAL_URL, obj, userApiKey);
	
			DropdownList dropData = new DropdownList();
	
			/*if (jsObj != null) {
				ObjectMapper mapper = new ObjectMapper();
				try {
					dropData = mapper.readValue(jsObj, DropdownList.class);
					data = dropData.getData();
				} catch (Exception e) {
				}
			}*/
		}
		return jsObj;
	}

	public static List<DropdownData> getFlexiSubListValue(HttpSession session, int parentId) {

		List<DropdownData> data = new ArrayList<>();
		int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		String orgLang = session.getAttribute("orgLang").toString();
		
		String obj = "{\"orgId\":" + orgId + ",\"lang\":\"" + orgLang + "\",\"parentId\":\"" + parentId + "\"}";

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String jsObj = HttpUtil.callPostStr(APIUtil.SUB_LIST_VAL_URL, obj, userApiKey);

		DropdownList dropData = new DropdownList();

		if (jsObj != null) {
			ObjectMapper mapper = new ObjectMapper();
			try {
				dropData = mapper.readValue(jsObj, DropdownList.class);
				data = dropData.getData();
			} catch (Exception e) {
			}
		}
		return data;
	}

}
