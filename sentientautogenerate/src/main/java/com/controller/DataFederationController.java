package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.data.FlexiPostData;
import com.util.APIUtil;
import com.util.FlexiUtil;

@Controller
public class DataFederationController 
{
	
	@RequestMapping(value = "/dataset", method = RequestMethod.GET)
	public String dataSchema(HttpSession session) {
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
		flexiLbl.setScrId("DATASCHEMA");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "DATASCHEMA");
		
		return "dataschema";
		
	}
	
	@RequestMapping(value = "/marketplace", method = RequestMethod.GET)
	public String marketPlace(HttpSession session) {
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
		flexiLbl.setScrId("MARKETPLACE");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "MARKETPLACE");
		
		return "marketplace";
		
	}

	@RequestMapping(value = "/contract", method = RequestMethod.GET)
	public String contract(HttpSession session) {
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
		flexiLbl.setScrId("CONTRACT_LIST");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "CONTRACT_LIST");
		
		return "contract";
		
	}
	
	@RequestMapping(value = "/mycontract", method = RequestMethod.GET)
	public String myContract(HttpSession session) {
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
		flexiLbl.setScrId("CONTRACT_LIST");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "CONTRACT_LIST");
		
		return "mycontract";
		
	}
	
	@RequestMapping(value = "/contractdetail", method = RequestMethod.GET)
	public String contractDetail(HttpSession session) {
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
		flexiLbl.setScrId("CONTRACTDETAILS");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "CONTRACTDETAILS");
		

		
		return "contractdetail";
		
	}
	
	
	@RequestMapping(value = "/keys", method = RequestMethod.GET)
	public String rsaKey(HttpSession session) {
		
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
		flexiLbl.setScrId("RSA_GENERATE_KEYS");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "RSA_GENERATE_KEYS");
		
		return "keys";
		
	}
	
	@RequestMapping(value = "/encode", method = RequestMethod.GET)
	public String encode(HttpSession session) {
		
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
		flexiLbl.setScrId("RSA_ENCODE");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "RSA_ENCODE");
		
		return "encode";
		
	}
	
	@RequestMapping(value = "/decode", method = RequestMethod.GET)
	public String decode(HttpSession session) {
		
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
		flexiLbl.setScrId("RSA_DECODE");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "RSA_DECODE");
				
		return "decode";
		
	}

}
