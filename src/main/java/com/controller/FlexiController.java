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

import com.data.DropdownData;
import com.data.FlexiCodeInfoData;
import com.data.FlexiCodeListData;
import com.data.FlexiErrorData;
import com.data.FlexiLblData;
import com.data.FlexiPostData;
import com.data.FlexiValInfoData;
import com.data.FlexiValListData;
import com.data.FlexiValSubInfoData;
import com.data.FlexiValSubListData;
import com.data.OrgFlxiErrorListData;
import com.data.OrgFlxiLblListData;
import com.data.ReturnData;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.util.APIUtil;
import com.util.DateUtil;
import com.util.FlexiUtil;
import com.util.HttpUtil;

@Controller
public class FlexiController {

	@RequestMapping(value = "/updateFlxiLbl", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String updateFlxiLbl(HttpSession session, @RequestBody FlexiLblData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		int orgId = 0;
		
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}
		
		if (session.getAttribute("loginOrgId") != null) {
			 orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		}

		if (data.getDescription() == null) {
			data.setDescription("");
		}

		data.setOrgId(orgId);
		data.setDateUpdated(currentDateTime);
		data.setUpdatedBy(usrId);

		JSONObject cred = new JSONObject(data);

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String jsObj = HttpUtil.callPostStr(APIUtil.UPDATE_ORG_FLXI_URL, cred, userApiKey);

		/*ReturnData returndata = new ReturnData();

		if (jsObj != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returndata = mapper.readValue(jsObj, ReturnData.class);
			} catch (Exception e) {
			}
		}*/

		return jsObj;
	}

	@RequestMapping(value = "/updateFlxiError", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String updateFlxiError(HttpSession session, @RequestBody FlexiErrorData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}
		
		if (session.getAttribute("loginOrgId") != null) {
			 orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		}

		data.setDateUpdated(currentDateTime);
		data.setUpdatedBy(usrId);
		data.setOrgId(orgId);

		if (data.getDescription() == null) {
			data.setDescription("");
		}

		JSONObject cred = new JSONObject(data);

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String jsObj = HttpUtil.callPostStr(APIUtil.UPDATE_ORG_ERROR_URL, cred, userApiKey);

		/*ReturnData returndata = new ReturnData();

		if (jsObj != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returndata = mapper.readValue(jsObj, ReturnData.class);
			} catch (Exception e) {
			}
		}*/

		return jsObj;
	}

	@RequestMapping(value = "/getOrgFlexiLbls", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiLbls(HttpSession session, int orgId) {
		List<FlexiLblData> orgFlexiLblList = new ArrayList<FlexiLblData>();

		if (session.getAttribute("loginOrgId") != null) {
			 orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		}

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.LIST_FLXI_LBL_URL + "?orgId=" + orgId, userApiKey);

		/*OrgFlxiLblListData orgFlxiLblListData = new OrgFlxiLblListData();

		if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				orgFlxiLblListData = mapper.readValue(retData, OrgFlxiLblListData.class);

				orgFlexiLblList = orgFlxiLblListData.getData();

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/getOrgFlexiErrors", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiErrors(HttpSession session, int orgId) {
		List<FlexiErrorData> orgFlexiErrorList = new ArrayList<FlexiErrorData>();
		if (session.getAttribute("loginOrgId") != null) {
			 orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		}
		
		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.LIST_FLXI_ERROR_URL + "?orgId=" + orgId, userApiKey);

		OrgFlxiErrorListData orgFlxiErrorListData = new OrgFlxiErrorListData();

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				orgFlxiErrorListData = mapper.readValue(retData, OrgFlxiErrorListData.class);

				orgFlexiErrorList = orgFlxiErrorListData.getData();

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/getOrgFlexiLblInfo", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiLblInfo(HttpSession session, int id) {
		FlexiLblData flexiLblData = new FlexiLblData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_LBL_URL + "?id=" + id, userApiKey);
		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				flexiLblData = mapper.readValue(retData, FlexiLblData.class);
			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/getOrgFlexiErrorInfo", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiErrorInfo(HttpSession session, int id) {
		FlexiErrorData flexiErrorData = new FlexiErrorData();
		
		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_ERROR_URL + "?id=" + id, userApiKey);
		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				flexiErrorData = mapper.readValue(retData, FlexiErrorData.class);
			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/flexylabel", method = RequestMethod.GET)
	public String flexyLabel(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");
			
			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("FLEXI_LBL");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("FLEXI_LBL");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "FLEXI_LBL");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "E_FLEXI_LBL");
		}

		return "flexylabel";
	}

	@RequestMapping(value = "/flexyerror", method = RequestMethod.GET)
	public String flexyError(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");
			
			FlexiPostData flexiOrg = new FlexiPostData();
			flexiOrg.setLang(orgLang);
			flexiOrg.setOrgId(orgId);
			flexiOrg.setScrId("FLEXI_ERR");

			FlexiPostData errOrg = new FlexiPostData();
			errOrg.setLang(orgLang);
			errOrg.setOrgId(orgId);
			errOrg.setScrId("FLEXI_ERR");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
			FlexiUtil.getFlexiMapping(session, flexiOrg, APIUtil.FLEXI_LBL_URL, "FLEXI_ERR");
			FlexiUtil.getFlexiMapping(session, errOrg, APIUtil.FLEXI_ERROR_URL, "E_FLEXI_ERR");
		}

		return "flexyerror";
	}

	@RequestMapping(value = "/flexycodelist", method = RequestMethod.GET)
	public String flexyCodeList(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
		}

		return "flexycodelist";
	}

	@RequestMapping(value = "/flexyvaluelist", method = RequestMethod.GET)
	public String flexyValueList(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
		}

		return "flexyvaluelist";
	}

	@RequestMapping(value = "/flexysublist", method = RequestMethod.GET)
	public String flexySubList(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
		}

		return "flexysublist";
	}

	@RequestMapping(value = "/getOrgFlexiCodeList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiCodeList(HttpSession session, int orgId) {
		List<FlexiCodeInfoData> orgFlexiCodeInfoDataList = new ArrayList<FlexiCodeInfoData>();
		if (session.getAttribute("loginOrgId") != null) {
			 orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		}
		
		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_CODE_LIST_URL + "?orgId=" + orgId, userApiKey);

		FlexiCodeListData flexiCodeListData = new FlexiCodeListData();

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				flexiCodeListData = mapper.readValue(retData, FlexiCodeListData.class);

				orgFlexiCodeInfoDataList = flexiCodeListData.getData();

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/getOrgFlexiCodeInfo", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiCodeInfo(HttpSession session, int id) {
		FlexiCodeInfoData flexiCodeInfoData = new FlexiCodeInfoData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_CODE_INFO_URL  + "?id=" + id, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				flexiCodeInfoData = mapper.readValue(retData, FlexiCodeInfoData.class);
			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/updateOrgFlexiCode", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String updateOrgFlexiCode(HttpSession session, @RequestBody FlexiCodeInfoData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		int orgId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
			orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		}
		data.setOrgId(orgId);
		data.setDateUpdated(currentDateTime);
		data.setUpdatedBy(usrId);

		if (data.getDesc() == null) {
			data.setDesc("");
		}

		JSONObject cred = new JSONObject(data);
		
		String userApiKey = session.getAttribute("userApiKey").toString();

		String jsObj = HttpUtil.callPostStr(APIUtil.ORG_FLXI_CODE_UPDATE_URL, cred, userApiKey);

		/*ReturnData returndata = new ReturnData();

		if (jsObj != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returndata = mapper.readValue(jsObj, ReturnData.class);
			} catch (Exception e) {
			}
		}*/

		return jsObj;
	}

	@RequestMapping(value = "/getOrgFlexiCodeValList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiCodeValList(HttpSession session, int lstId) {
		List<FlexiValInfoData> flexiValInfoDataList = new ArrayList<FlexiValInfoData>();
		
		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_CODE_VAL_LIST_URL + "?lstId=" + lstId, userApiKey);

		FlexiValListData flexiValListData = new FlexiValListData();

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				flexiValListData = mapper.readValue(retData, FlexiValListData.class);

				flexiValInfoDataList = flexiValListData.getData();

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/getOrgFlexiCodeValInfo", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiCodeValInfo(HttpSession session, int id) {
		FlexiValInfoData flexiValInfoData = new FlexiValInfoData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_CODE_VAL_INFO_URL + "?id=" + id, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				flexiValInfoData = mapper.readValue(retData, FlexiValInfoData.class);
			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/updateOrgFlexiCodeVal", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String updateOrgFlexiCodeVal(HttpSession session, @RequestBody FlexiValInfoData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}

		data.setDateUpdated(currentDateTime);
		data.setUpdatedBy(usrId);

		JSONObject cred = new JSONObject(data);

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String jsObj = HttpUtil.callPostStr(APIUtil.ORG_FLXI_CODE_VAL_UPDATE_URL, cred, userApiKey);

		/*ReturnData returndata = new ReturnData();

		if (jsObj != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returndata = mapper.readValue(jsObj, ReturnData.class);
			} catch (Exception e) {
			}
		}*/

		return jsObj;
	}

	@RequestMapping(value = "/getOrgFlexiCodeValSubList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiCodeValSubList(HttpSession session, int parentId) {
		List<FlexiValSubInfoData> flexiValSubInfoDataList = new ArrayList<FlexiValSubInfoData>();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_CODE_VAL_SUB_LIST_URL + "?parentId=" + parentId, userApiKey);

		FlexiValSubListData flexiValSubListData = new FlexiValSubListData();

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				flexiValSubListData = mapper.readValue(retData, FlexiValSubListData.class);

				flexiValSubInfoDataList = flexiValSubListData.getData();

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/getOrgFlexiCodeValSubInfo", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getOrgFlexiCodeValSubInfo(HttpSession session, int id) {
		FlexiValInfoData flexiValInfoData = new FlexiValInfoData();
		
		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_CODE_VAL_SUB_INFO_URL + "?id=" + id, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				flexiValInfoData = mapper.readValue(retData, FlexiValInfoData.class);
			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/updateOrgFlexiCodeValSub", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String updateOrgFlexiCodeValSub(HttpSession session,
			@RequestBody FlexiValSubInfoData data) {

		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int usrId = 0;
		if (session.getAttribute("loginOrgId") != null) {
			usrId = (int) session.getAttribute("id");
		}

		data.setDateUpdated(currentDateTime);
		data.setUpdatedBy(usrId);

		JSONObject cred = new JSONObject(data);

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String jsObj = HttpUtil.callPostStr(APIUtil.ORG_FLXI_CODE_VAL_SUB_UPDATE_URL, cred, userApiKey);

		/*ReturnData returndata = new ReturnData();

		if (jsObj != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returndata = mapper.readValue(jsObj, ReturnData.class);
			} catch (Exception e) {
			}
		}*/

		return jsObj;
	}

	@RequestMapping(value = "/deleteFlexiLbls", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String deleteFlexiLbls(HttpSession session, String ids) {
		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_LBL_DELETE_URL + "?ids=" + ids, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/deleteFlexiLblTrans", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String deleteFlexiLblTrans(HttpSession session, String id) {
		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_LBL_TRANS_DELETE_URL + "?id=" + id, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/deleteFlexiErrors", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String deleteFlexiErrors(HttpSession session, String ids) {
		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_ERROR_DELETE_URL + "?ids=" + ids, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/deleteFlexiErrorTrans", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String deleteFlexiErrorTrans(HttpSession session, String id) {
		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_ERROR_TRANS_DELETE_URL + "?id=" + id, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/deleteFlexiCodeList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String deleteFlexiCodeList(HttpSession session, String id) {
		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_CODE_DELETE_URL + "?id=" + id, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/deleteFlexiCodeVal", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String deleteFlexiCodeVal(HttpSession session, String ids) {
		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_CODE_VAL_DELETE_URL + "?ids=" + ids, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/deleteFlexiCodeValTrans", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String deleteFlexiCodeValTrans(HttpSession session, String id) {
		ReturnData returnData = new ReturnData();

		String userApiKey = session.getAttribute("userApiKey").toString();
		
		String retData = HttpUtil.callGet(APIUtil.ORG_FLXI_CODE_VAL_TRANS_DELETE_URL + "?id=" + id, userApiKey);

		/*if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				returnData = mapper.readValue(retData, ReturnData.class);

			} catch (Exception e) {
			}
		}*/

		return retData;
	}

	@RequestMapping(value = "/flexylanguage", method = RequestMethod.GET)
	public String flexyLanguage(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
		}

		return "flexylanguage";
	}
	
	
	@RequestMapping(value = "/getFlexiList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody String getFunctionList(HttpSession session, String code) {
		
		String datas = FlexiUtil.getFlexiListValue(session, code);

		return datas;
	}
	
	

}
