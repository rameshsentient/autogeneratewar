package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.data.FlexiPostData;
import com.util.APIUtil;
import com.util.FlexiUtil;

@Controller
public class DemoController {
	
	@RequestMapping(value = "/webscraping", method = RequestMethod.GET)
	public String webscraping(HttpSession session) {
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
			flexiLbl.setScrId("DOC_CONVERSATION");
			FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "DOC_CONVERSATION");
		}
		return "webscraping";
	}
	
	@RequestMapping(value = "/asr", method = RequestMethod.GET)
	public String asr(HttpSession session) {
		//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		int orgId = 1;
		
		String orgLang = session.getAttribute("orgLang").toString();
		FlexiPostData flexiMenu = new FlexiPostData();
		flexiMenu.setLang(orgLang);
		flexiMenu.setOrgId(orgId);
		flexiMenu.setScrId("MENU");
		FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");		
		
		return "asr";
		
	}
	
	@RequestMapping(value = "/tepcodemo", method = RequestMethod.GET)
	public String tepcodemo(HttpSession session) {
	
		return "tepcodemo";
		
	}
	
	@RequestMapping(value = "/geospatial", method = RequestMethod.GET)
	public String geospatialdemo(HttpSession session) {
		
		return "geospatial";
		
	}
	
	@RequestMapping(value = "/checkSession", method = RequestMethod.GET)
	public @ResponseBody String checkSession(HttpSession session) {
		
		String sessionStatus = "N";
		if(session.getAttribute("id") != null){
			if(Integer.parseInt(session.getAttribute("id").toString()) > 0){
				sessionStatus="Y";
			}
			
		}
	
		return sessionStatus;
		
	}
	
	@RequestMapping(value = "/tts", method = RequestMethod.GET)
	public String tts(HttpSession session) {
		//int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		int orgId = 1;
		
		String orgLang = session.getAttribute("orgLang").toString();
		FlexiPostData flexiMenu = new FlexiPostData();
		flexiMenu.setLang(orgLang);
		flexiMenu.setOrgId(orgId);
		flexiMenu.setScrId("MENU");
		FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");		
		
		return "tts";
		
	}
	
	
	
	@RequestMapping(value = "/brotherpromo", method = RequestMethod.GET)
	public String brotherpromo(HttpSession session) {
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
			flexiLbl.setScrId("DOC_CONVERSATION");
			FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "DOC_CONVERSATION");
		}
		return "brotherpromo";
	}
	
	@RequestMapping(value = "/promolist", method = RequestMethod.GET)
	public String brotherpromolist(HttpSession session) {
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
			flexiLbl.setScrId("DOC_CONVERSATION");
			FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "DOC_CONVERSATION");
		}
		return "brotherpromolist";
	}
	
	@RequestMapping(value = "/directorysearch", method = RequestMethod.GET, headers = "Accept=application/json")
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

		return "directorysearch";
	}

}
