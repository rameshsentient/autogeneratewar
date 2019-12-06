package com.util;

public class APIUtil {

	/*******************************
	 * LOCAL API PATH
	 ***********************************/

//	public static String FLASK_FLEXI_API_ROOT_URL = "http://localhost:5030/";
//	public static String FLASK_ORG_API_ROOT_URL = "http://localhost:5050/";
//	public static String CATALOG_URL = "http://localhost:5020/";
//	public static String ZENDESK_URL = "http://localhost:5050/";

//	public static String BLACKCHAIN_URL = "https://api.sentient.io/blockchain/dev/";
//	public static String RSA_KEY_URL = "https://api.sentient.io/keypair/prod/";
//	public static String ROOT_AWS_URL = "https://api.sentient.io/microservices/dev/";
//	public static String DASS_URL = "https://api.sentient.io/DaaS/prod/";

	/*********************************
	 * GKE API PATH
	 ************************************/

	public static String FLASK_FLEXI_API_ROOT_URL = "http://34.87.29.131:5030/";
	public static String FLASK_ORG_API_ROOT_URL = "http://34.87.29.131:5050/";
	public static String CATALOG_URL = "http://34.87.29.131:5020/";
	public static String ZENDESK_URL = "http://34.87.29.131:5050/";
	
	//public static String FLASK_FLEXI_API_ROOT_URL =System.getenv("FLASK_FLEXI_API_ROOT_URL");
	//public static String FLASK_ORG_API_ROOT_URL =System.getenv("FLASK_ORG_API_ROOT_URL");
	//public static String CATALOG_URL = System.getenv("FLASK_CATALOG_URL");
	//public static String ZENDESK_URL =System.getenv("FLASK_ORG_API_ROOT_URL");

	public static String BLACKCHAIN_URL = "https://api.sentient.io/blockchain/dev/";
	public static String RSA_KEY_URL = "https://api.sentient.io/keypair/dev/";
	public static String ROOT_AWS_URL = "https://api.sentient.io/microservices/dev/";
	public static String DASS_URL = "https://api.sentient.io/DaaS/dev/";

	/***********************
	 * PROD API PATH
	 *******************************************/
	// public static String FLASK_FLEXI_API_ROOT_URL = "https://api.sentient.io/microservices/prod/";
	// public static String FLASK_ORG_API_ROOT_URL = "https://api.sentient.io/microservices/prod/";
	// public static String BLACKCHAIN_URL = "https://api.sentient.io/blockchain/prod/";
	// public static String CATALOG_URL = "https://api.sentient.io/catalog/prod/";
	// public static String DASS_URL = "https://api.sentient.io/DaaS/prod/";
	// public static String ZENDESK_URL = "https://api.sentient.io/zendesk/prod/";
	// public static String RSA_KEY_URL = "https://api.sentient.io/keypair/prod/";
	// public static String ROOT_AWS_URL = "https://api.sentient.io/microservices/prod/";
	

	/**************************************
	 * KC APIs
	 ***********************************************/

	public static String DOCLISTURL = ROOT_AWS_URL + "kc/getdoclist";

	public static String DOC_UPDATE_URL = ROOT_AWS_URL + "kc/updatedocinfo";

	public static String DOC_INFO_URL = ROOT_AWS_URL + "kc/getdocinfo";

	public static String DOC_UPDATE_FILE_URL = ROOT_AWS_URL + "kc/updatedocfileinfo";

	public static String DOC_DEL_URL = ROOT_AWS_URL + "kc/deletedoc";

	public static String FUNCTION_LIST_URL = ROOT_AWS_URL + "kc/getorgfunctionlist";

	public static String SEARCH_DOC_URL = ROOT_AWS_URL + "kc/knowledgesearch";

	public static String PAGE_PROFILE_URL = ROOT_AWS_URL + "/kc/uploadurldoc";

	public static String DOC_DELETE_ES_INDEX_URL = ROOT_AWS_URL + "kc/deleteesindexdata";

	public static String DOC_ADD_UPDATE_URL = ROOT_AWS_URL + "kc/updatedoc";

	public static String DOC_KC_SEARCH_URL = ROOT_AWS_URL + "kc/documentsearch";

	/*******************************************
	 * FLEXI APIs
	 *****************************************/

	public static String FLEXI_LBL_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getlblbyscr";

	public static String FLEXI_ERROR_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/geterlblbyscr";

	public static String LIST_VAL_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getlist";

	public static String SUB_LIST_VAL_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getsublist";

	public static String SUB_LIST_VALPAIR_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getflexicodevalpair";

	public static String UPDATE_ORG_FLXI_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/updatelbl";

	public static String UPDATE_ORG_ERROR_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/updateerror";

	public static String LIST_FLXI_LBL_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getlbllist";

	public static String LIST_FLXI_ERROR_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/geterrorlist";

	public static String ORG_FLXI_LBL_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getlblinfo";

	public static String ORG_FLXI_ERROR_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/geterrorinfo";

	public static String ORG_FLXI_CODE_LIST_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getflexicodelist";

	public static String ORG_FLXI_CODE_INFO_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getcodeinfo";

	public static String ORG_FLXI_CODE_UPDATE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/updateflexicode";

	public static String ORG_FLXI_CODE_VAL_LIST_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getvallist";

	public static String ORG_FLXI_CODE_VAL_INFO_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getvalinfo";

	public static String ORG_FLXI_CODE_VAL_UPDATE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/updatecodeval";

	public static String ORG_FLXI_CODE_VAL_SUB_LIST_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getvalsublist";

	public static String ORG_FLXI_CODE_VAL_SUB_INFO_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getvalinfo";

	public static String ORG_FLXI_CODE_VAL_SUB_UPDATE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/updatecodevalsub";

	public static String ORG_FLXI_LBL_DELETE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/deletelbl";

	public static String ORG_FLXI_LBL_TRANS_DELETE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/deletelbltrans";

	public static String ORG_FLXI_ERROR_DELETE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/deleteerror";

	public static String ORG_FLXI_ERROR_TRANS_DELETE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/deleteerrortrans";

	public static String ORG_FLXI_CODE_DELETE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/deletecode";

	public static String ORG_FLXI_CODE_VAL_DELETE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/deletecodeval";

	public static String ORG_FLXI_CODE_VAL_TRANS_DELETE_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/deletecodevaltrans";

	public static String LANG_LIST_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getlanguagelist";

	public static String ORG_UPDATE_LANG_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/updatelanguages";

	public static String ORG_LANG_INFO_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/getorglanginfo";

	public static String DELETE_ORG_LANG_URL = FLASK_FLEXI_API_ROOT_URL + "flexi/deleteorglang";

	/************************************************
	 * ORGANIZATION APIs
	 *************************************************/

	// public static String AUTHURL = FLASK_ORG_API_ROOT_URL + "org/loginauth";

	public static String ORG_ADD_URL = FLASK_ORG_API_ROOT_URL + "org/updateorginfo";

	public static String ORG_LIST_URL = FLASK_ORG_API_ROOT_URL + "org/getorglist";

	public static String ORG_INFO_URL = FLASK_ORG_API_ROOT_URL + "org/getorginfo";

	public static String ADD_USER_URL = FLASK_ORG_API_ROOT_URL + "org/updateuserinfo";

	public static String USER_LIST_URL = FLASK_ORG_API_ROOT_URL + "org/getuserlist";

	public static String DELETEDUSER_LIST_URL = FLASK_ORG_API_ROOT_URL + "org/getdeleteduserlist";

	public static String ADD_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/updateorgfunction";

	public static String ADD_ROLE_URL = FLASK_ORG_API_ROOT_URL + "org/updateorgrole";

	public static String ROLE_LIST_URL = FLASK_ORG_API_ROOT_URL + "org/getorgrolelist";

	public static String ADD_GROUP_URL = FLASK_ORG_API_ROOT_URL + "org/updateorggroup";

	public static String GROUP_LIST_URL = FLASK_ORG_API_ROOT_URL + "org/getorggrouplist";

	public static String FUNCTION_INFO_URL = FLASK_ORG_API_ROOT_URL + "org/getorgfuncinfo";

	public static String ADD_GROUP_TO_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/addfunctiontogroup";

	public static String REMOVE_GROUP_FROM_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/removefunctionfromgroup";

	public static String ADD_ROLE_TO_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/addfunctiontorole";

	public static String REMOVE_ROLE_FROM_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/removefunctionfromrole";

	public static String ROLE_INFO_URL = FLASK_ORG_API_ROOT_URL + "org/getroleinfo";

	public static String GROUP_INFO_URL = FLASK_ORG_API_ROOT_URL + "org/getgroupinfo";

	public static String USER_INFO_URL = FLASK_ORG_API_ROOT_URL + "org/getuserinfo";

	// public static String CHANGE_PASSWORD_URL = FLASK_ORG_API_ROOT_URL
	// +"org/changepassword";

	public static String ADD_USER_TO_GROUP_URL = FLASK_ORG_API_ROOT_URL + "org/addusertogroup";

	public static String ADD_USER_TO_ROLE_URL = FLASK_ORG_API_ROOT_URL + "org/addusertorole";

	public static String REMOVE_USER_FROM_GROUP_URL = FLASK_ORG_API_ROOT_URL + "org/removeuserfromgroup";

	public static String REMOVE_USER_FROM_ROLE_URL = FLASK_ORG_API_ROOT_URL + "org/removeuserfromrole";

	public static String REMOVE_USER_FROM_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/removeuserfromfunction";

	public static String ADD_USER_TO_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/addusertofunction";

	public static String DELETE_USER_URL = FLASK_ORG_API_ROOT_URL + "org/deleteuser";

	public static String ACTIVATE_USER_URL = FLASK_ORG_API_ROOT_URL + "org/activateusers";

	public static String DELETE_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/deletefunction";

	public static String DELETE_ROLE_URL = FLASK_ORG_API_ROOT_URL + "org/deleterole";

	public static String DELETE_GROUP_URL = FLASK_ORG_API_ROOT_URL + "org/deletegroup";

	public static String DELETE_ORG_URL = FLASK_ORG_API_ROOT_URL + "org/deleteorg";

	public static String ORG_LANG_LIST_URL = FLASK_ORG_API_ROOT_URL + "org/getorglang";

	public static String LIST_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/getfunctionlist";

	public static String LIST_MICROSERVICE_URL = FLASK_ORG_API_ROOT_URL + "org/getmicroservicelist";

	public static String INFO_MICROSERVICE_URL = FLASK_ORG_API_ROOT_URL + "org/getmicroserviceinfo";

	public static String DLT_MICROSERVICE_URL = FLASK_ORG_API_ROOT_URL + "org/deletemicroservice";

	public static String UPDATE_MICROSERVICE_URL = FLASK_ORG_API_ROOT_URL + "org/updatemicroservice";

	public static String UPDATE_FUNCTION_ICON_URL = FLASK_ORG_API_ROOT_URL + "org/updatefunctionicon";

	public static String UPDATE_FUNCTION_IMAGES_URL = FLASK_ORG_API_ROOT_URL + "org/updatefunctionimage";

	public static String DLT_MICRO_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/deletefuncinmicroserv";

	public static String UPDATE_MICRO_FUNCTION_URL = FLASK_ORG_API_ROOT_URL + "org/addfunctiontomicroservice";

	public static String DELETE_FUNCTION_FEATUR_URL = FLASK_ORG_API_ROOT_URL + "org/deletefunctionfeature";

	public static String DELETE_FUNCTION_PRICE_URL = FLASK_ORG_API_ROOT_URL + "org/deletefunctionpricing";

	public static String DELETE_FUNCTION_IMAGE_URL = FLASK_ORG_API_ROOT_URL + "org/deletefunctionimage";

	public static String ORG_TAGS_URL = FLASK_ORG_API_ROOT_URL + "org/getorgtags";

	public static String ORG_TAG_PARENT_UPDATE_URL = FLASK_ORG_API_ROOT_URL + "org/updatetagsgroup";

	public static String ORG_TAG_CHILD_UPDATE_URL = FLASK_ORG_API_ROOT_URL + "org/tagsupdate";

	public static String ORG_TAG_PARENT_DELETE_URL = FLASK_ORG_API_ROOT_URL + "org/deleteorgparenttags";

	public static String ORG_TAG_CHILD_DELETE_URL = FLASK_ORG_API_ROOT_URL + "org/deleteorgchildtag";

	public static String ORG_TAG_DELETE_URL = FLASK_ORG_API_ROOT_URL + "org/deleteorgtag";

	public static String ORG_TAG_LIST_URL = FLASK_ORG_API_ROOT_URL + "org/getorgtagslist";

	public static String ORG_TAGGROUP_LIST_URL = FLASK_ORG_API_ROOT_URL + "org/getorgtagsgroup";

	public static String MICRO_CATLOG_URL = FLASK_ORG_API_ROOT_URL + "org/getmicroservicecatlog";

	public static String MICRO_SER_LIST_URL = FLASK_ORG_API_ROOT_URL + "org/getmicroservicelist";

	public static String MICRO_SER_INFO_URL = FLASK_ORG_API_ROOT_URL + "org/getmicroserviceinfo";

	public static String ORG_FUN_INFO_URL = FLASK_ORG_API_ROOT_URL + "org/getorgfuncinfo";

	public static String ORG_INFO = FLASK_ORG_API_ROOT_URL + "org/getorginfo";

	public static String ORG_ASSIGN_FUNCTION = FLASK_ORG_API_ROOT_URL + "org/assignfunction";

	public static String ORG_GET_ASSIGN_FUNCTION = FLASK_ORG_API_ROOT_URL + "org/getorgassignfunctions";

	public static String ORG_REMOVE_FUNCTION = FLASK_ORG_API_ROOT_URL + "org/removefunctionfromorg";

	public static String ORG_CHECK_USER_ACCESS = FLASK_ORG_API_ROOT_URL + "org/checkuseraccess";

	public static String ACCESS_INFO = FLASK_ORG_API_ROOT_URL + "org/getuseraccessinfo";

	public static String ACCESS_INFO_ORG_DA = FLASK_ORG_API_ROOT_URL + "org/getdaaccessinfo";

	public static String SSO_USER_AUTH = FLASK_ORG_API_ROOT_URL + "org/ssouserauth";

	public static String ORG_SUBSCRIPTION = FLASK_ORG_API_ROOT_URL + "org/subscription";

	public static String ORG_REGISTRATION = FLASK_ORG_API_ROOT_URL + "org/registration";

	public static String ORG_DELETED_LIST = FLASK_ORG_API_ROOT_URL + "org/getdeletedorglist";

	public static String ACTIVATE_DELETED_ORG = FLASK_ORG_API_ROOT_URL + "org/activateorg";

	public static String API_METTERING_DASHBOARD = FLASK_ORG_API_ROOT_URL + "org/apicalloverview";

	public static String API_ENDPOINT_STATUS = FLASK_ORG_API_ROOT_URL + "org/apiendpointcallstatus";

	public static String API_ENDPOINT_ORG_ACCOUNT_LIST = FLASK_ORG_API_ROOT_URL + "org/accountlist";

	public static String API_ENDPOINT_ORG_ALL_ACCOUNT_LIST = FLASK_ORG_API_ROOT_URL + "org/allaccountlist";

	public static String API_LOGIN_HISTORY = FLASK_ORG_API_ROOT_URL + "org/loginhistory";

	public static String API_DOWNLOAD_LOGIN_CSV = FLASK_ORG_API_ROOT_URL + "org/downloadlogincsv";

	public static String LOGOUT = FLASK_ORG_API_ROOT_URL + "org/logout";

	public static String RESET_PASSWORD_EMAIL = FLASK_ORG_API_ROOT_URL + "org/resetpasswordemail";

	public static String AUTHURL = FLASK_ORG_API_ROOT_URL + "org/loginauthnew";

	public static String AUTHURL_WITH_NEW_PASS = FLASK_ORG_API_ROOT_URL + "org/loginauthwithnewpass";

	public static String CHANGE_PASSWORD_URL = FLASK_ORG_API_ROOT_URL + "org/changepasswordnew";

	public static String SET_PASSWORD = FLASK_ORG_API_ROOT_URL + "org/setpassword";

	public static String LIST_PREDEFINED_GROUP = FLASK_ORG_API_ROOT_URL + "org/listpredefinedgroup";

	public static String API_DA_ACCOUNTLIST = FLASK_ORG_API_ROOT_URL + "org/accountlist";

	/*************************************************
	 * DATA ALLAINCE APIs
	 **************************************/

	public static String API_ENDPOINT_LEDGER = ROOT_AWS_URL + "da/ledger";

	public static String API_ENDPOINT_ADD_LEDGER = ROOT_AWS_URL + "da/addledger";

	public static String API_ADD_DA_SETTING = ROOT_AWS_URL + "da/setting";

	public static String API_GET_DA_SETTING = ROOT_AWS_URL + "da/getsetting";

	public static String API_FILE_UPLOAD = ROOT_AWS_URL + "da/uploadsamplefile";

	public static String API_NON_OPENDATASET = ROOT_AWS_URL + "da/nonopendataset";

	public static String API_DA_GETSETTING = ROOT_AWS_URL + "da/getsetting";

	public static String API_DA_GETEMAILID = ROOT_AWS_URL + "da/getemailaddres";

	public static String CHECK_ENOUGH_BALANCE = ROOT_AWS_URL + "da/spendingaccountinfo";

	public static String SUPPORT_EMAIL = ROOT_AWS_URL + "da/supportteammail";

	/**************************************************
	 * DATA ALLAINCE APIs
	 *****************************************/

	public static String API_DWN_LEDGER = ROOT_AWS_URL + "billing/ledgerdownload";

	public static String API_DWN_INVOICE = ROOT_AWS_URL + "billing/filedownload";

	public static String API_INVOICE_LIST = ROOT_AWS_URL + "billing/invoice";

	public static String BILLING_DASHBOARD = ROOT_AWS_URL + "billing/dashboard";

	/*********************************
	 * CATALOG APIs
	 *********************************************************/

	public static String API_CATALOG_SOLUTIONS_LIST = CATALOG_URL + "solutionslist";

	public static String API_CATALOG_MICRO_LIST = CATALOG_URL + "microserviceslist";

	public static String API_CATALOG_MICRO_DETAIL = CATALOG_URL + "getmsdetails";

	public static String API_CATALOG_SOLUTIONS_DETAIL = CATALOG_URL + "getsolutiondetails";

	/*****************************************
	 * BLACKCHAIN APIs
	 **********************************************/

	public static String API_ADD_SCHEMA = BLACKCHAIN_URL + "adddataschema";

	public static String API_LIST_SCHEMA = BLACKCHAIN_URL + "filterdataschema";

	public static String API_DELETE_SCHEMA = BLACKCHAIN_URL + "deletedataschema";

	public static String API_MARKET_PLACE = BLACKCHAIN_URL + "marketdata";

	public static String API_ADD_CONTRACT = BLACKCHAIN_URL + "addcontract";

	public static String API_UPDATE_CONTRACT = BLACKCHAIN_URL + "updatecontract";

	public static String API_CONTRACT_LIST = BLACKCHAIN_URL + "filtercontract";

	public static String API_CONTRACT_HISTORY = BLACKCHAIN_URL + "getcontracthistory";

	public static String API_DA_AVAILABLECONTRACTS = BLACKCHAIN_URL + "availablecontracts";

	/********************************************
	 * KEYPAIR APIs
	 ************************************************/

	public static String RSA_DECODE = RSA_KEY_URL + "rsa/decode";

	public static String RSA_ENCODE = RSA_KEY_URL + "rsa/encode";

	public static String RSA_GET_KEYS = RSA_KEY_URL + "rsa/getkeys";

	/**************************************************
	 * DaaS APIs
	 ************************************************/

	public static String UPDATE_CREDIT_EXPIRY = DASS_URL + "updatecreditexpiry";

	public static String LIST_CREDIT_EXPIRY = DASS_URL + "listcreditexpiry";

	/*******************************************************
	 * ZENDESK APIs
	 *******************************************/

	public static String API_ZENDESK_TICKET = ZENDESK_URL + "createticket";

	/*********************************************
	 * MICROSERVICES APIs
	 ***********************************************/

	public static String DOC_CONVERSION = ROOT_AWS_URL + "docconversion";

	public static String URL_INDEXING_URL = ROOT_AWS_URL + "pageprofiler";

	public static String WEB_SCRAPING = ROOT_AWS_URL + "webscraping";

	public static String ASR_DEMO = ROOT_AWS_URL + "asrconversion";

	public static String TTS = ROOT_AWS_URL + "tts";

}
