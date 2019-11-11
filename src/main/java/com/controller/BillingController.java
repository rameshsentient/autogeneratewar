package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.data.FlexiPostData;
import com.util.APIUtil;
import com.util.FlexiUtil;

@Controller
public class BillingController {
	
	@RequestMapping(value = "/billingdashboard", method = RequestMethod.GET)
	public String billingDashboard(HttpSession session) {
		
		//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		int orgId = 1;
		
		String orgLang = session.getAttribute("orgLang").toString();
		FlexiPostData flexiMenu = new FlexiPostData();
		flexiMenu.setLang(orgLang);
		flexiMenu.setOrgId(orgId);
		flexiMenu.setScrId("MENU");
		FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
		
		return "billingdashboard";
		
		
	}
	
	@RequestMapping(value = "/invoice", method = RequestMethod.GET)
	public String invoice(HttpSession session) {
		
		//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		int orgId = 1;
		
		String orgLang = session.getAttribute("orgLang").toString();
		FlexiPostData flexiMenu = new FlexiPostData();
		flexiMenu.setLang(orgLang);
		flexiMenu.setOrgId(orgId);
		flexiMenu.setScrId("MENU");
		FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");
		
		return "invoice";
	
	}
	
	@RequestMapping(value = "/transactions", method = RequestMethod.GET)
	public String ledger(HttpSession session) {
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
		flexiLbl.setScrId("TRANSACTIONS");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "TRANSACTIONS");
		
		return "ledger";
		
	}
	
	@RequestMapping(value = "/creditmanagement", method = RequestMethod.GET)
	public String creditexpiry(HttpSession session) {
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
		flexiLbl.setScrId("CREDITEXPIRY");
		FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "CREDITEXPIRY");
		
		return "creditexpiry";
		
	}
	
	

}
