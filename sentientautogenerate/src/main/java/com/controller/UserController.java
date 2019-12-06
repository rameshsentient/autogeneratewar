package com.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.data.AuthWithPassData;
import com.data.ChangePassData;
import com.data.GroupInfoData;
import com.data.ReturnData;
import com.data.RoleInfoData;
import com.data.TestData;
import com.data.UserInfoData;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.util.APIUtil;
import com.util.HttpUtil;

@Controller
public class UserController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {		
		String sessionID = session.getId();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("action", "LOGOUT");
		jsonObject.put("sessionId", sessionID);
		jsonObject.put("userId", Integer.parseInt(session.getAttribute("id").toString()));
		
		JSONObject jsObj = HttpUtil.callPost(APIUtil.LOGOUT, jsonObject);
		
		System.out.println("Login sessionID : " + sessionID);
		session.setAttribute("id", 0);
		session.invalidate();
		return "login";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	

	@RequestMapping(value = "/ssouser", method = RequestMethod.GET)
	public String webscraping(HttpSession session) {
		return "ssouser";
	}

	@RequestMapping(value = "/ssoAuth", method = RequestMethod.GET)
	public @ResponseBody int ssoAuth(String sessionKey, HttpSession session) {
		String output = HttpUtil.callGet(APIUtil.SSO_USER_AUTH + "?sessionKey=" + sessionKey);
		JSONObject jsonObject = new JSONObject(output);
		String status = jsonObject.get("status").toString();

		int id = 0;

		if (status.equalsIgnoreCase("success")) {

			String resultString = jsonObject.get("results").toString();

			JSONObject jsObj = new JSONObject(resultString);

			id = Integer.parseInt(jsObj.get("id").toString());
			int org = Integer.parseInt(jsObj.get("orgId").toString());
			String userName = jsObj.get("userName").toString();
			String orgName = jsObj.get("orgName").toString();
			String orgType = jsObj.get("orgType").toString();
			String userApiKey = jsObj.get("userApiKey").toString();
				
			session.setAttribute("userApiKey", userApiKey);

			session.setAttribute("api_key", "");
			session.setAttribute("id", id);
			session.setAttribute("loginOrgId", org);
			session.setAttribute("orgLang", "EN");
			session.setAttribute("orgType", orgType);

			session.setAttribute("userName", userName);
			session.setAttribute("orgName", orgName);

		}

		return id;
	}

	@RequestMapping(value = "/loginAuth", method = RequestMethod.POST)
	public @ResponseBody String loginAuth(@RequestBody TestData data, HttpSession session) {
		
		String sessionID = session.getId();
		data.setSessionId(sessionID);
		
		JSONObject cred = new JSONObject(data);

		JSONObject jsObj = HttpUtil.callPost(APIUtil.AUTHURL, cred);
		JSONObject returnObject = new JSONObject();
		
		int id = 0;

		try{
			if (jsObj.isNull("error")) {
				id = Integer.parseInt(jsObj.get("id").toString());
				int org = Integer.parseInt(jsObj.get("org").toString());
				String userName = jsObj.get("userName").toString();
				String orgName = jsObj.get("org_name").toString();
				String orEmail = jsObj.get("email").toString();
				// String api_key=jsObj.get("api_key").toString();
				String orgType = jsObj.get("orgType").toString();
				String ownerId = jsObj.get("owner").toString();
				String clientId = jsObj.get("clientId").toString();
	
				String userApiKey = jsObj.get("userApiKey").toString();
				String publicKey = jsObj.get("publicKey").toString();
				if(publicKey.equalsIgnoreCase("null")) {
					publicKey = "";
				}
	
				session.setAttribute("userApiKey", userApiKey);
	
				session.setAttribute("api_key", "");
				session.setAttribute("id", id);
				session.setAttribute("loginOrgId", org);
				session.setAttribute("orgLang", "EN");
				session.setAttribute("orgType", orgType);
	
				session.setAttribute("userName", userName);
				session.setAttribute("orgName", orgName);
				session.setAttribute("orgEmail", orEmail);
				
				session.setAttribute("ownerId", ownerId);
				session.setAttribute("clientId", clientId);
				
				session.setAttribute("publicKey", publicKey);
				
				System.out.println("===================");
				System.out.println(clientId);
				System.out.println("publicKey : " + publicKey);
				System.out.println("Login sessionID : " + sessionID);
				
				
				returnObject.put("id", new Integer(id));
				//returnString = "{'id' : "+id+"}";
			}
			else if( jsObj.get("error").toString().equalsIgnoreCase("NEED_TO_RESET_PASSWORD")) {
				id = -100;
				returnObject.put("id", new Integer(id));
				//returnString = "{'id' : "+id+"}";
			}
			else if( jsObj.get("error").toString().equalsIgnoreCase("ACCOUNT_LOCKED")) {
				
				int attemptCount = Integer.parseInt(jsObj.get("attemptCount").toString());
				
				int remMins = 0;
				
				if (!jsObj.isNull("mins")) {
					
					remMins =  Integer.parseInt(jsObj.get("mins").toString());
					
				}
				
				attemptCount = attemptCount - (attemptCount+attemptCount);
				
				id = attemptCount;
				returnObject.put("id", new Integer(id));
				returnObject.put("remMins", new Integer(remMins));
				//returnString = "{'id' : "+id+", 'remMins' : "+remMins+"}";
			}else if( jsObj.get("error").toString().equalsIgnoreCase("Invalid login")) {
				returnObject.put("id", new Integer(0));
				
			}
		}catch (Exception e){
			
			System.out.println(e);
		}
		String s = returnObject.toString();
		System.out.println(s);
		return s;
	}
	
	@RequestMapping(value = "/updatepassword", method = RequestMethod.GET)
	public String updatepassword() {
		
		return "updatepassword";
	}
	
	@RequestMapping(value = "/loginAuthWithNewPass", method = RequestMethod.POST)
	public @ResponseBody int loginAuthWithNewPass(@RequestBody AuthWithPassData data, HttpSession session) {
		

		// String userApiKey = session.getAttribute("userApiKey").toString();
		
		String sessionID = session.getId();
		data.setSessionId(sessionID);
		
		JSONObject cred = new JSONObject(data);

		JSONObject jsObj = HttpUtil.callPost(APIUtil.AUTHURL_WITH_NEW_PASS, cred);

		int id = 0;

		try{
			if (jsObj.isNull("error")) {
				id = Integer.parseInt(jsObj.get("id").toString());
				int org = Integer.parseInt(jsObj.get("org").toString());
				String userName = jsObj.get("userName").toString();
				String orgName = jsObj.get("org_name").toString();
				String orEmail = jsObj.get("email").toString();
				// String api_key=jsObj.get("api_key").toString();
				String orgType = jsObj.get("orgType").toString();
				String ownerId = jsObj.get("owner").toString();
				String clientId = jsObj.get("clientId").toString();
	
				String userApiKey = jsObj.get("userApiKey").toString();
				String publicKey = jsObj.get("publicKey").toString();
				if(publicKey.equalsIgnoreCase("null")) {
					publicKey = "";
				}
	
				session.setAttribute("userApiKey", userApiKey);
	
				session.setAttribute("api_key", "");
				session.setAttribute("id", id);
				session.setAttribute("loginOrgId", org);
				session.setAttribute("orgLang", "EN");
				session.setAttribute("orgType", orgType);
	
				session.setAttribute("userName", userName);
				session.setAttribute("orgName", orgName);
				session.setAttribute("orgEmail", orEmail);
				
				session.setAttribute("ownerId", ownerId);
				session.setAttribute("clientId", clientId);
				
				session.setAttribute("publicKey", publicKey);
				
			} else if( jsObj.get("error").toString().contentEquals("PASSWORD_USED")) {
				id = -1;
			}
		}catch (Exception e){
			
			System.out.println(e);
		}
		
		
		return id;
	}

	@RequestMapping(value = "/addGroupToFunction", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String addGroupToFunction(HttpSession session, int fId, int gId) {

		ReturnData returnData = new ReturnData();
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ADD_GROUP_TO_FUNCTION_URL + "?fId=" + fId + "&gId=" + gId,
				userApiKey);
		return retData;
	}

	@RequestMapping(value = "/removeGroupFromFunction", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String removeGroupFromFunction(HttpSession session, int fgId) {

		ReturnData returnData = new ReturnData();
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.REMOVE_GROUP_FROM_FUNCTION_URL + "?fgId=" + fgId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/addRoleToFunction", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String addRoleToFunction(HttpSession session, int fId, int rId) {

		ReturnData returnData = new ReturnData();
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ADD_ROLE_TO_FUNCTION_URL + "?fId=" + fId + "&rId=" + rId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/removeRoleFromFunction", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String removeRoleFromFunction(HttpSession session, int frId) {

		ReturnData returnData = new ReturnData();
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.REMOVE_ROLE_FROM_FUNCTION_URL + "?frId=" + frId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/getGroupDetail", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getGroupInfoData(HttpSession session, int gId) {

		GroupInfoData groupInfoData = new GroupInfoData();
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.GROUP_INFO_URL + "?gId=" + gId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/getRoleDetail", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getRoleInfoData(HttpSession session, int rId) {

		RoleInfoData roleInfoData = new RoleInfoData();
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ROLE_INFO_URL + "?rId=" + rId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/getUserInfo", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getUserInfo(HttpSession session, int uId) {

		UserInfoData userInfoData = new UserInfoData();
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.USER_INFO_URL + "?uId=" + uId, userApiKey);

		/*
		 * if (retData != null) { ObjectMapper mapper = new ObjectMapper();
		 * 
		 * try { userInfoData = mapper.readValue(retData, UserInfoData.class); }
		 * catch (Exception e) { } }
		 */

		return retData;
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String addRole(HttpSession session, @RequestBody ChangePassData data) {

		JSONObject cred = new JSONObject(data);
		String userApiKey = session.getAttribute("userApiKey").toString();

		String jsObj = HttpUtil.callPostStr(APIUtil.CHANGE_PASSWORD_URL, cred, userApiKey);

		return jsObj;
	}

	@RequestMapping(value = "/addUserToRole", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String addUserToRole(HttpSession session, int uId, int rId) {

		ReturnData returnData = new ReturnData();

		int usrId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil
				.callGet(APIUtil.ADD_USER_TO_ROLE_URL + "?uId=" + uId + "&rId=" + rId + "&lId=" + usrId, userApiKey);
		return retData;
	}

	@RequestMapping(value = "/addUserToGroup", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String addUserToGroup(HttpSession session, int uId, int gId) {

		ReturnData returnData = new ReturnData();

		int usrId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil
				.callGet(APIUtil.ADD_USER_TO_GROUP_URL + "?uId=" + uId + "&gId=" + gId + "&lId=" + usrId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/removeUserFromGroup", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String removeUserFromGroup(HttpSession session, int ugId) {

		String userApiKey = session.getAttribute("userApiKey").toString();
		String retData = HttpUtil.callGet(APIUtil.REMOVE_USER_FROM_GROUP_URL + "?ugId=" + ugId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/removeUserFromRole", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody ReturnData removeUserFromRole(HttpSession session, int urId) {

		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.REMOVE_USER_FROM_ROLE_URL + "?urId=" + urId, userApiKey);

		if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);
			} catch (Exception e) {
			}
		}

		return returnData;
	}

	@RequestMapping(value = "/removeUserFromFunction", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String removeUserFromFunction(HttpSession session, int ufId) {

		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.REMOVE_USER_FROM_FUNCTION_URL + "?ufId=" + ufId, userApiKey);

		/*
		 * if (retData != null) { ObjectMapper mapper = new ObjectMapper();
		 * 
		 * try { returnData = mapper.readValue(retData, ReturnData.class); }
		 * catch (Exception e) { } }
		 */

		return retData;
	}

	@RequestMapping(value = "/addUserToFunction", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String addUserToFunction(HttpSession session, int uId, int fId) {

		ReturnData returnData = new ReturnData();

		int usrId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ADD_USER_TO_FUNCTION_URL + "?uId=" + uId + "&fId=" + fId, userApiKey);

		/*
		 * if (retData != null) { ObjectMapper mapper = new ObjectMapper();
		 * 
		 * try { returnData = mapper.readValue(retData, ReturnData.class); }
		 * catch (Exception e) { } }
		 */

		return retData;
	}

	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody ReturnData deleteUser(HttpSession session, int uId) {

		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.DELETE_USER_URL + "?uId=" + uId, userApiKey);

		if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);
			} catch (Exception e) {
			}
		}

		return returnData;
	}
	
	
	@RequestMapping(value = "/deleteFunction", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody ReturnData deleteFunction(HttpSession session, int fId) {

		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.DELETE_FUNCTION_URL + "?fId=" + fId, userApiKey);

		if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);
			} catch (Exception e) {
			}
		}

		return returnData;
	}

	@RequestMapping(value = "/deleteRole", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String deleteRole(HttpSession session, int rId) {

		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.DELETE_ROLE_URL + "?rId=" + rId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/deleteGroup", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody ReturnData deleteGroup(HttpSession session, int gId) {

		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.DELETE_GROUP_URL + "?gId=" + gId, userApiKey);

		if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);
			} catch (Exception e) {
			}
		}

		return returnData;
	}
	
	@RequestMapping(value = "/setpass", method = RequestMethod.GET)
	public String setPass() {
		return "setpass";
	}

}
