package com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.data.FlexiPostData;
import com.data.FunDetailsData;
import com.data.FunListData;
import com.data.FunctionData;
import com.data.FunctionInfoData;
import com.data.GroupData;
import com.data.GroupDetails;
import com.data.OrgChildTagData;
import com.data.OrgDatas;
import com.data.OrgListData;
import com.data.OrgParentTagData;
import com.data.OrgPostData;
import com.data.OrgTagList;
import com.data.OrgTagListData;
import com.data.OrgUserData;
import com.data.ReturnData;
import com.data.RoleData;
import com.data.RoleDetails;
import com.data.UserPostData;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.util.APIUtil;
import com.util.AWSUtil;
import com.util.DateUtil;
import com.util.FlexiUtil;
import com.util.HttpUtil;

@Controller
public class OrganizationController {

	@RequestMapping(value = "/getFlexyList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getFlexyList(HttpSession session, String code) {
		String listData = FlexiUtil.getFlexiListValue(session, code);

		return listData;
	}

	@RequestMapping(value = "/assignfunction", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String assignFunction(HttpSession session, int orgId, int functionId) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		if (session.getAttribute("id") != null) {
			usrId = (int) session.getAttribute("id");
		}

		JSONObject jsonObj = new JSONObject();

		jsonObj.put("orgId", orgId);
		jsonObj.put("functionId", functionId);
		jsonObj.put("dateUpdated", currentDateTime);
		jsonObj.put("upDatedBy", usrId);

		String userApiKey = session.getAttribute("userApiKey").toString();

		String jsObjStr = HttpUtil.callPostStr(APIUtil.ORG_ASSIGN_FUNCTION, jsonObj, userApiKey);

		// System.out.println("jsObj ::: " + jsObjStr);

		JSONObject jsobj = new JSONObject(jsObjStr);

		return jsObjStr;
	}

	@RequestMapping(value = "/getorgassignfunctions", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgAssignFunctions(HttpSession session, int orgId) {

		String userApiKey = session.getAttribute("userApiKey").toString();

		String jsObjStr = HttpUtil.callGet(APIUtil.ORG_GET_ASSIGN_FUNCTION + "?orgId=" + orgId, userApiKey);

		// System.out.println("jsObj ::: " + jsObjStr);

		return jsObjStr;
	}

	@RequestMapping(value = "/removefunctionfromorg", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String removeFunctionFromORG(HttpSession session, int id) {

		String userApiKey = session.getAttribute("userApiKey").toString();

		String jsObjStr = HttpUtil.callGet(APIUtil.ORG_REMOVE_FUNCTION + "?id=" + id, userApiKey);

		// System.out.println("jsObj ::: " + jsObjStr);

		return jsObjStr;
	}

	@RequestMapping(value = "/addorg", method = RequestMethod.GET)
	public String addorg(HttpSession session) {

		if (session.getAttribute("loginOrgId") != null) {
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("ORG");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("ORG_ERR");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "ORG");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "ORG_ERR");
		}
		return "addorg";
	}

	@RequestMapping(value = "/addOrg", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String addOrg(HttpSession session, @RequestBody OrgPostData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}
		data.setDateUpdated(currentDateTime);
		data.setUpDatedBy(usrId);

		JSONObject cred = new JSONObject(data);

		String userApiKey = session.getAttribute("userApiKey").toString();

		String jsObj = HttpUtil.callPostStr(APIUtil.ORG_ADD_URL, cred, userApiKey);

		/*
		 * ReturnData returndata = new ReturnData();
		 * 
		 * if (jsObj != null) { ObjectMapper mapper = new ObjectMapper();
		 * 
		 * try { returndata = mapper.readValue(jsObj, ReturnData.class); } catch
		 * (Exception e) { } }
		 */

		return jsObj;
	}

	@RequestMapping(value = "/getOrgList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgList(HttpSession session) {

		String userApiKey = session.getAttribute("userApiKey").toString();

		List<OrgDatas> orgDataList = new ArrayList<OrgDatas>();

		String retData = HttpUtil.callGet(APIUtil.ORG_LIST_URL, userApiKey);

		OrgListData orgLisData = new OrgListData();

		return retData;
	}
	
	@RequestMapping(value = "/getOrgDeletedList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgDeletedList(HttpSession session) {

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ORG_DELETED_LIST, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/orgdetails", method = RequestMethod.GET)
	public String orgdetails(HttpSession session) {

		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			// Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("ORG_DE");

			FlexiPostData flexiOrgUsr = new FlexiPostData();
			flexiOrgUsr.setLang(orgLang);
			flexiOrgUsr.setOrgId(orgId);
			flexiOrgUsr.setScrId("ORG_USR");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("ORG_ERR");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "ORG_DE");
			FlexiUtil.getFlexiMapping(session, flexiOrgUsr, APIUtil.FLEXI_LBL_URL, "ORG_USR");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "ORG_ERR");
		}
		return "orgdetails";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String addUser(HttpSession session, @RequestBody UserPostData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		if (session.getAttribute("id") != null) {
			usrId = (int) session.getAttribute("id");
		}
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}
		// data.setOrgId(orgId);
		data.setDateUpdated(currentDateTime);
		data.setDateCreated(currentDateTime);
		data.setUpdatedBy(usrId);

		if (data.getRootUser() == null) {
			data.setRootUser("no");
		}

		JSONObject cred = new JSONObject(data);
		String userApiKey = session.getAttribute("userApiKey").toString();

		String jsObj = HttpUtil.callPostStr(APIUtil.ADD_USER_URL, cred, userApiKey);

		return jsObj;
	}

	@RequestMapping(value = "/getUserList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getUserList(HttpSession session, int orgId) {
		List<OrgUserData> orgDataList = new ArrayList<OrgUserData>();
		/*
		 * int orgId = 0; if (session.getAttribute("loginOrgId") != null) {
		 * orgId = (int) session.getAttribute("loginOrgId"); }
		 */

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.USER_LIST_URL + "?orgId=" + orgId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/orgFunctionList", method = RequestMethod.GET)
	public String orgFunctionList(HttpSession session) {

		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			// Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("ORG_FUN");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("ORG_ERR");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "ORG_FUN");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "ORG_ERR");
		}

		return "orgfunction";
	}

	@RequestMapping(value = "/addFunction", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody ReturnData addFunction(HttpSession session, @RequestBody FunctionData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		if (data.getDescrpition2() == null) {
			data.setDescrpition2("");
		}
		if (data.getApiendpoint() == null) {
			data.setApiendpoint("");
		}

		if (data.getDocUrl() == null) {
			data.setDocUrl("");
		}

		if (data.getSource() == null) {
			data.setSource("");
		}

		if (data.getTermUrl() == null) {
			data.setTermUrl("");
		}
		// data.setOrgId(orgId);
		data.setDateUpdated(currentDateTime);
		data.setUpdatedBy(usrId);

		JSONObject cred = new JSONObject(data);

		String userApiKey = session.getAttribute("userApiKey").toString();

		String jsObj = HttpUtil.callPostStr(APIUtil.ADD_FUNCTION_URL, cred, userApiKey);

		ReturnData returndata = new ReturnData();

		if (jsObj != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returndata = mapper.readValue(jsObj, ReturnData.class);
			} catch (Exception e) {
			}
		}

		return returndata;
	}

	@RequestMapping(value = "/getfuncDetail", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody FunctionInfoData getFunctionInfoData(HttpSession session, int fId) {

		FunctionInfoData functionInfoData = new FunctionInfoData();
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.FUNCTION_INFO_URL + "?fId=" + fId, userApiKey);

		if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				functionInfoData = mapper.readValue(retData, FunctionInfoData.class);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return functionInfoData;
	}

	@RequestMapping(value = "/getFunctionList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody List<FunDetailsData> getFunctionList(HttpSession session, int orgId) {
		List<FunDetailsData> funDataList = new ArrayList<FunDetailsData>();

		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}

		// String retData = HttpUtil.callGet(APIUtil.FUNCTION_LIST_URL +
		// "?orgId=" + orgId);

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.LIST_FUNCTION_URL, userApiKey);

		FunListData funLisData = new FunListData();

		if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				funLisData = mapper.readValue(retData, FunListData.class);

				funDataList = funLisData.getData();

			} catch (Exception e) {
			}
		}

		return funDataList;
	}

	@RequestMapping(value = "/orgFunctionDetails", method = RequestMethod.GET)
	public String orgFunctionDetails(HttpSession session) {
		return "orgFunctionDetails";
	}

	@RequestMapping(value = "/orgrole", method = RequestMethod.GET)
	public String orgRole(HttpSession session) {

		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			// Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("ORG_ROL");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("ORG_ERR");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "ORG_ROL");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "ORG_ERR");
		}

		return "orgrole";
	}

	@RequestMapping(value = "/addRole", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String addRole(HttpSession session, @RequestBody RoleData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}
		// data.setOrgId(orgId);
		// data.setId(0);
		data.setDateUpdated(currentDateTime);
		data.setUpdatedBy(usrId);

		if (data.getId() > 0) {
			// data.setrFunctions(new ArrayList<RoleFunctionData>());
			data.setrFunctions(new int[] {});
		}
		String jsonString = "";

		ObjectMapper cred = new ObjectMapper();
		ReturnData returndata = new ReturnData();
		String jsObj = "";
		try {
			jsonString = cred.writeValueAsString(data);

			String userApiKey = session.getAttribute("userApiKey").toString();

			jsObj = HttpUtil.callPostStr(APIUtil.ADD_ROLE_URL, jsonString, userApiKey);

			/*
			 * if (jsObj != null) { ObjectMapper mapper = new ObjectMapper();
			 * 
			 * try { returndata = mapper.readValue(jsObj, ReturnData.class); }
			 * catch (Exception e) { } }
			 */
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return jsObj;
	}

	@RequestMapping(value = "/getRoleList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getRoleList(HttpSession session, int orgId) {
		List<RoleDetails> funDataList = new ArrayList<RoleDetails>();
		/*
		 * int orgId = 0; if (session.getAttribute("loginOrgId") != null) {
		 * orgId = (int) session.getAttribute("loginOrgId"); }
		 */

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ROLE_LIST_URL + "?orgId=" + orgId, userApiKey);

	
		return retData;
	}

	@RequestMapping(value = "/orggroup", method = RequestMethod.GET)
	public String orggroup(HttpSession session) {

		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			// Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("ORG_GRP");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("ORG_ERR");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "ORG_GRP");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "ORG_ERR");
		}

		return "orggroup";
	}

	@RequestMapping(value = "/addGroup", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String addGroup(HttpSession session, @RequestBody GroupData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			orgId = (int) session.getAttribute("loginOrgId");
		}
		// data.setOrgId(orgId);
		data.setDateUpdated(currentDateTime);
		data.setUpdatedBy(usrId);
		String jsonString = "";

		ObjectMapper cred = new ObjectMapper();
		ReturnData returndata = new ReturnData();
		String jsObj = "";
		try {
			jsonString = cred.writeValueAsString(data);

			String userApiKey = session.getAttribute("userApiKey").toString();

			jsObj = HttpUtil.callPostStr(APIUtil.ADD_GROUP_URL, jsonString, userApiKey);

			
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return jsObj;
	}

	@RequestMapping(value = "/getGroupList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getGroupList(HttpSession session, int orgId) {
		List<GroupDetails> groupDataList = new ArrayList<GroupDetails>();
		

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.GROUP_LIST_URL + "?orgId=" + orgId, userApiKey);

		
		return retData;
	}

	@RequestMapping(value = "/deleteOrg", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String deleteOrg(HttpSession session, int orgId) {

		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.DELETE_ORG_URL + "?orgId=" + orgId, userApiKey);

		
		return retData;
	}


	@RequestMapping(value = "/getOrgInfo", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgInfo(HttpSession session, int orgId) {
		OrgDatas orgDatas = new OrgDatas();

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ORG_INFO_URL + "?orgId=" + orgId, userApiKey);

		return retData;
	}

	@RequestMapping(value = "/uploadIconImg", method = RequestMethod.POST, headers = "Accept=application/json")
	public String uploadFunctionImg(HttpSession session, @RequestBody MultipartFile file, int id) {
		String filePath = "";
		if (file != null) {
			long dateString = new Date().getTime();

			String keyname = file.getOriginalFilename();

			String userApiKey = session.getAttribute("userApiKey").toString();

			filePath = AWSUtil.uploadFile(dateString + "-" + keyname, "functionimages", file, 0, 0);

			String retData = HttpUtil.callGet(APIUtil.UPDATE_FUNCTION_ICON_URL + "?iconUrl=" + filePath + "&fId=" + id,
					userApiKey);
		}

		return "";
	}

	/* DASHBOARD CATALOG */

	@RequestMapping(value = "/catalog", method = RequestMethod.GET, headers = "Accept=application/json")
	public String catalog(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();
			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");
			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			
			FlexiPostData flexiCatalog = new FlexiPostData();
			flexiCatalog.setLang(orgLang);
			flexiCatalog.setOrgId(orgId);
			flexiCatalog.setScrId("CATALOG");
			FlexiUtil.getFlexiMapping(session, flexiCatalog, APIUtil.FLEXI_LBL_URL, "CATALOG");
		}

		return "catalog";
	}
	
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(HttpSession session) {
		//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		int orgId = 1;
		
		String orgLang = session.getAttribute("orgLang").toString();
		FlexiPostData flexiMenu = new FlexiPostData();
		flexiMenu.setLang(orgLang);
		flexiMenu.setOrgId(orgId);
		flexiMenu.setScrId("MENU");
		FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
		
		FlexiPostData flexiLbl = new FlexiPostData();
		flexiLbl.setLang(orgLang);
		flexiLbl.setOrgId(orgId);
		flexiLbl.setScrId("API_DASH");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "API_DASH");
		
		return "dashboard";
		
	}
	
	
	@RequestMapping(value = "/apidashboard", method = RequestMethod.GET)
	public String apidashboard(HttpSession session) {
		//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		int orgId = 1;
		
		String orgLang = session.getAttribute("orgLang").toString();
		FlexiPostData flexiMenu = new FlexiPostData();
		flexiMenu.setLang(orgLang);
		flexiMenu.setOrgId(orgId);
		flexiMenu.setScrId("MENU");
		FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
		
		FlexiPostData flexiLbl = new FlexiPostData();
		flexiLbl.setLang(orgLang);
		flexiLbl.setOrgId(orgId);
		flexiLbl.setScrId("API_DASH");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "API_DASH");
		
		return "apidashboard";
		
	}
	

	@RequestMapping(value = "/knowledgeSearch", method = RequestMethod.GET, headers = "Accept=application/json")
	public String knowledgeSearch(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			// Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();
			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("DOC_SEARCH");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "DOC_SEARCH");
		}

		return "knowledgesearch";
	}

	@RequestMapping(value = "/urlindexing", method = RequestMethod.GET, headers = "Accept=application/json")
	public String searchList(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			// Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();
			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");
			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");

			FlexiPostData flexiLbl = new FlexiPostData();
			flexiLbl.setLang(orgLang);
			flexiLbl.setOrgId(orgId);
			flexiLbl.setScrId("PAGE_PROFILE");
			FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "PAGE_PROFILE");

			FlexiPostData flexiErr = new FlexiPostData();
			flexiErr.setLang(orgLang);
			flexiErr.setOrgId(orgId);
			flexiErr.setScrId("PAGE_PROFILE_ERR");
			FlexiUtil.getFlexiMapping(session, flexiErr, APIUtil.FLEXI_ERROR_URL, "PAGE_PROFILE_ERR");
		}

		return "urlindexing";
	}

	@RequestMapping(value = "/getorgtags", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgTags(HttpSession session, int orgId) {

		List<OrgTagListData> orgTagListData = new ArrayList<OrgTagListData>();
		OrgTagList orgTagList = new OrgTagList();

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ORG_TAGS_URL + "?orgId=" + orgId, userApiKey);
		return retData;
	}

	@RequestMapping(value = "/updateorgparenttag", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody int updateorgparenttag(HttpSession session, @RequestBody OrgParentTagData tagData) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());

		int userId = Integer.parseInt(session.getAttribute("id").toString());

		// tagData.setOrgId(orgId);
		tagData.setDateCreated(currentDateTime);
		tagData.setDateUpdated(currentDateTime);
		tagData.setUpdatedBy(userId);

		JSONObject cred = new JSONObject(tagData);

		String userApiKey = session.getAttribute("userApiKey").toString();

		JSONObject jsObj = HttpUtil.callPost(APIUtil.ORG_TAG_PARENT_UPDATE_URL, cred, userApiKey);

		int id = 0;

		if (!jsObj.isNull("id")) {
			id = Integer.parseInt(jsObj.get("id").toString());
		}

		return id;
	}

	@RequestMapping(value = "/updateorgchildtag", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody int updateOrgChildTag(HttpSession session, @RequestBody OrgChildTagData tagData) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());

		int userId = Integer.parseInt(session.getAttribute("id").toString());

		tagData.setDateCreated(currentDateTime);
		tagData.setDateUpdated(currentDateTime);
		tagData.setUpdatedBy(userId);

		JSONObject cred = new JSONObject(tagData);

		String userApiKey = session.getAttribute("userApiKey").toString();

		JSONObject jsObj = HttpUtil.callPost(APIUtil.ORG_TAG_CHILD_UPDATE_URL, cred, userApiKey);

		int id = 0;

		if (!jsObj.isNull("id")) {
			id = Integer.parseInt(jsObj.get("id").toString());
		}

		return id;
	}

	@RequestMapping(value = "/deleteorgtag", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody ReturnData deleteOrgTag(HttpSession session, int id) {

		ReturnData returnData = new ReturnData();

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());

		int userId = Integer.parseInt(session.getAttribute("id").toString());

		OrgParentTagData tagData = new OrgParentTagData();

		tagData.setId(id);
		tagData.setDateCreated(currentDateTime);
		tagData.setDateUpdated(currentDateTime);
		tagData.setUpdatedBy(userId);

		JSONObject cred = new JSONObject(tagData);

		String userApiKey = session.getAttribute("userApiKey").toString();

		JSONObject jsObj = HttpUtil.callPost(APIUtil.ORG_TAG_DELETE_URL, cred, userApiKey);

		String message = "";

		if (!jsObj.isNull("message")) {
			message = jsObj.get("message").toString();
		}

		returnData.setId(id);
		returnData.setMessage(message);

		return returnData;
	}

	@RequestMapping(value = "/deleteorgchildtag", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody ReturnData deleteOrgChildTag(HttpSession session, int id) {

		ReturnData returnData = new ReturnData();

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());

		int userId = Integer.parseInt(session.getAttribute("id").toString());

		OrgChildTagData tagData = new OrgChildTagData();

		tagData.setId(id);
		tagData.setDateCreated(currentDateTime);
		tagData.setDateUpdated(currentDateTime);
		tagData.setUpdatedBy(userId);

		JSONObject cred = new JSONObject(tagData);

		String userApiKey = session.getAttribute("userApiKey").toString();

		JSONObject jsObj = HttpUtil.callPost(APIUtil.ORG_TAG_CHILD_DELETE_URL, cred, userApiKey);

		String message = "";

		if (!jsObj.isNull("message")) {
			message = jsObj.get("message").toString();
		}

		returnData.setId(id);
		returnData.setMessage(message);

		return returnData;
	}

	@RequestMapping(value = "/orgtagsgroup", method = RequestMethod.GET)
	public String orgTags(HttpSession session) {

		if (session.getAttribute("loginOrgId") != null) {
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("ORG_GRP");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("ORG_ERR");

			FlexiPostData orgTags = new FlexiPostData();
			orgTags.setLang(orgLang);
			orgTags.setOrgId(orgId);
			orgTags.setScrId("ORG_TAGS");

			FlexiPostData orgTagsErr = new FlexiPostData();
			orgTagsErr.setLang(orgLang);
			orgTagsErr.setOrgId(orgId);
			orgTagsErr.setScrId("ORG_TAGS");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "ORG_GRP");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "ORG_ERR");
			FlexiUtil.getFlexiMapping(session, orgTags, APIUtil.FLEXI_LBL_URL, "ORG_TAGS");

			FlexiUtil.getFlexiMapping(session, orgTagsErr, APIUtil.FLEXI_ERROR_URL, "ORG_TAGS_ERR");

		}

		return "orgtagsgroup";
	}

	@RequestMapping(value = "/orgtags", method = RequestMethod.GET)
	public String neworgtags(HttpSession session) {

		if (session.getAttribute("loginOrgId") != null) {
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("ORG_GRP");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("ORG_ERR");

			FlexiPostData orgTags = new FlexiPostData();
			orgTags.setLang(orgLang);
			orgTags.setOrgId(orgId);
			orgTags.setScrId("ORG_TAGS");

			FlexiPostData orgTagsErr = new FlexiPostData();
			orgTagsErr.setLang(orgLang);
			orgTagsErr.setOrgId(orgId);
			orgTagsErr.setScrId("ORG_TAGS");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "ORG_GRP");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "ORG_ERR");
			FlexiUtil.getFlexiMapping(session, orgTags, APIUtil.FLEXI_LBL_URL, "ORG_TAGS");

			FlexiUtil.getFlexiMapping(session, orgTagsErr, APIUtil.FLEXI_ERROR_URL, "ORG_TAGS_ERR");

		}

		return "orgtags";
	}
	
	@RequestMapping(value = "/fndetail", method = RequestMethod.GET, headers = "Accept=application/json")
	public String functionDetails(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();
			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");
			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			
			FlexiPostData flexiCatalog = new FlexiPostData();
			flexiCatalog.setLang(orgLang);
			flexiCatalog.setOrgId(orgId);
			flexiCatalog.setScrId("FNDETAIL");
			FlexiUtil.getFlexiMapping(session, flexiCatalog, APIUtil.FLEXI_LBL_URL, "FNDETAIL");
		}
		
		return "fndetail";
	}
	
	
	@RequestMapping(value = "/getDeletedUserList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getDeletedUserList(HttpSession session, int orgId) {
		
		String userApiKey = session.getAttribute("userApiKey").toString();
		String retData = HttpUtil.callGet(APIUtil.DELETEDUSER_LIST_URL + "?orgId=" + orgId, userApiKey);

		return retData;
	}
	
	@RequestMapping(value = "/useractivity", method = RequestMethod.GET, headers = "Accept=application/json")
	public String userActivity(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();
			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");
			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			
			FlexiPostData flexiLbl = new FlexiPostData();
			flexiLbl.setLang(orgLang);
			flexiLbl.setOrgId(orgId);
			flexiLbl.setScrId("USERACTIVITY");
			FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "USERACTIVITY");
		}
		
		return "useractivity";
	}
	
	@RequestMapping(value = "/dasetting", method = RequestMethod.GET, headers = "Accept=application/json")
	public String daSetting(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();
			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");
			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			
			FlexiPostData flexiLbl = new FlexiPostData();
			flexiLbl.setLang(orgLang);
			flexiLbl.setOrgId(orgId);
			flexiLbl.setScrId("DA_SETTING");
			FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "DA_SETTING");
		}
		
		return "dasetting";
	}
	
	@RequestMapping(value = "/solndetail", method = RequestMethod.GET, headers = "Accept=application/json")
	public String solndetail(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();
			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");
			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			
		}
		return "solutiondetail";
	}
	
	@RequestMapping(value = "/solnfundetail", method = RequestMethod.GET, headers = "Accept=application/json")
	public String solutionfunctiondetail(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();
			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");
			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			
			FlexiPostData flexiCatalog = new FlexiPostData();
			flexiCatalog.setLang(orgLang);
			flexiCatalog.setOrgId(orgId);
			flexiCatalog.setScrId("FNDETAIL");
			FlexiUtil.getFlexiMapping(session, flexiCatalog, APIUtil.FLEXI_LBL_URL, "FNDETAIL");
		}
		return "solutionfunctiondetail";
	}
	
	
	@RequestMapping(value = "/myaccount", method = RequestMethod.GET)
	public String myaccount(HttpSession session) {

		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			// Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("ORG_DE");

			FlexiPostData flexiOrgUsr = new FlexiPostData();
			flexiOrgUsr.setLang(orgLang);
			flexiOrgUsr.setOrgId(orgId);
			flexiOrgUsr.setScrId("ORG_USR");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("ORG_ERR");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "ORG_DE");
			FlexiUtil.getFlexiMapping(session, flexiOrgUsr, APIUtil.FLEXI_LBL_URL, "ORG_USR");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "ORG_ERR");
		}
		return "myaccount";
	}
	

}
