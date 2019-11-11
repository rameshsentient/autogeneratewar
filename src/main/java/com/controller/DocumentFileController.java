package com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.data.DocData;
import com.data.DocListData;
import com.data.FlexiPostData;
import com.data.TagData;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.DocumentService;
import com.util.APIUtil;
import com.util.AWSUtil;
import com.util.DateUtil;
import com.util.FlexiUtil;
import com.util.HttpUtil;

@Controller
public class DocumentFileController {
	@Autowired
	private DocumentService documentService;

	public DocumentService getDocumentService() {
		return documentService;
	}

	public void setDocumentService(DocumentService documentService) {
		this.documentService = documentService;
	}

	@RequestMapping(value = "/docList", method = RequestMethod.GET)
	public String docList(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			// Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiPostData = new FlexiPostData();
			flexiPostData.setLang(orgLang);
			flexiPostData.setOrgId(orgId);
			flexiPostData.setScrId("DOC_LST");

			FlexiPostData flexiDocAddErrorPostData = new FlexiPostData();
			flexiDocAddErrorPostData.setLang(orgLang);
			flexiDocAddErrorPostData.setOrgId(orgId);
			flexiDocAddErrorPostData.setScrId("DOC_LST");

			FlexiPostData flexiDocAddPostData = new FlexiPostData();
			flexiDocAddPostData.setLang(orgLang);
			flexiDocAddPostData.setOrgId(orgId);
			flexiDocAddPostData.setScrId("ADD_DOC");

			FlexiPostData flexiDocAddErrData = new FlexiPostData();
			flexiDocAddErrData.setLang(orgLang);
			flexiDocAddErrData.setOrgId(orgId);
			flexiDocAddErrData.setScrId("ADD_DOC");

			FlexiPostData flexiMenu = new FlexiPostData();
			flexiMenu.setLang(orgLang);
			flexiMenu.setOrgId(orgId);
			flexiMenu.setScrId("MENU");

			FlexiUtil.getFlexiMapping(session, flexiMenu, APIUtil.FLEXI_LBL_URL, "MENU");

			FlexiUtil.getFlexiMapping(session, flexiPostData, APIUtil.FLEXI_LBL_URL, "DOC_LST");

			FlexiUtil.getFlexiMapping(session, flexiDocAddErrorPostData, APIUtil.FLEXI_ERROR_URL, "E_DOC_LST");

			FlexiUtil.getFlexiMapping(session, flexiDocAddPostData, APIUtil.FLEXI_LBL_URL, "ADD_DOC");

			FlexiUtil.getFlexiMapping(session, flexiDocAddErrData, APIUtil.FLEXI_ERROR_URL, "E_ADD_DOC");

		}

		return "index";
	}

	@RequestMapping(value = "/docEdit", method = RequestMethod.GET)
	public String docEdit(HttpSession session) {
		if (session.getAttribute("loginOrgId") != null) {
			// int orgId =
			// Integer.parseInt(session.getAttribute("loginOrgId").toString());
			int orgId = 1;
			String orgLang = session.getAttribute("orgLang").toString();

			FlexiPostData flexiPostData = new FlexiPostData();
			flexiPostData.setLang(orgLang);
			flexiPostData.setOrgId(orgId);
			flexiPostData.setScrId("EDIT_DOC");

			FlexiPostData flexiDocAddErrorPostData = new FlexiPostData();
			flexiDocAddErrorPostData.setLang(orgLang);
			flexiDocAddErrorPostData.setOrgId(orgId);
			flexiDocAddErrorPostData.setScrId("EDIT_DOC");

			FlexiUtil.getFlexiMapping(session, flexiPostData, APIUtil.FLEXI_LBL_URL, "EDIT_DOC");

			FlexiUtil.getFlexiMapping(session, flexiDocAddErrorPostData, APIUtil.FLEXI_ERROR_URL, "E_EDIT_DOC");

		}

		return "edit";
	}

	@RequestMapping(value = "/getDocInfoList", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody List<DocData> getDocumentinfoList(HttpSession session) {
		List<DocData> documentDataList = new ArrayList<DocData>();
		int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.DOCLISTURL + "?orgid=" + orgId, userApiKey);

		DocListData docLisData = new DocListData();

		if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				docLisData = mapper.readValue(retData, DocListData.class);

				documentDataList = docLisData.getData();

			} catch (Exception e) {
			}
		}

		return documentDataList;
	}

	@RequestMapping(value = "/updateDoc", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody int add(HttpSession session, @RequestBody DocData documentData) {

		String userApiKey = session.getAttribute("userApiKey").toString();

		boolean isURLChanged = false;
		String currentDateTime = DateUtil.dateToStrSqlDateTime(new Date());
		int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());
		documentData.setOrgId(orgId);
		if (documentData.getId() > 0) {
			documentData.setDateUpdated(currentDateTime);

			// FOR TAGS UPDATE METHOD && DELETE CHANGED FILE
			if (!"url".equalsIgnoreCase(documentData.getDocFormat())) {
				if ("Y".equalsIgnoreCase(documentData.getIsFileChanged())) {
					deleteDocInfo(session, documentData.getId() + "", true);
				} else {
					String[] filepath = documentData.getFilePath().split(".com/");
					AWSUtil.updateTags(filepath[1], documentData.getTags(), documentData.getOrgId());
				}
			} else {

				String oldURL = getDocInfo(session, documentData.getId()).getFilePath();

				isURLChanged = oldURL.equalsIgnoreCase(documentData.getFilePath());
			}
		} else {
			documentData.setDateCreated(currentDateTime);
			documentData.setDateUpdated(currentDateTime);
			if (!documentData.getDocFormat().equalsIgnoreCase("url")) {
				documentData.setFileName("");
				documentData.setFilePath("");
			}
		}

		if (documentData.getDocDesc() == null) {
			documentData.setDocDesc("");
		}

		if (documentData.getTags() == null) {
			documentData.setTags(new ArrayList<TagData>());
		}

		JSONObject cred = new JSONObject(documentData);
		JSONObject jsObj = HttpUtil.callPost(APIUtil.DOC_UPDATE_URL, cred, userApiKey);

		int id = 0;

		if (!jsObj.isNull("docId")) {
			id = Integer.parseInt(jsObj.get("docId").toString());
		}

		if (!isURLChanged && documentData.getDocFormat().equalsIgnoreCase("url") && documentData.getId() > 0) {

			String jsonData = "{'docId':'" + documentData.getId() + "'}";
			JSONObject cred2 = new JSONObject(jsonData);

			String Obj = HttpUtil.callPostStr(APIUtil.DOC_DELETE_ES_INDEX_URL, cred2, userApiKey);

		}

		if (documentData.getId() == 0 || !isURLChanged) {
			if (documentData.getDocFormat().equalsIgnoreCase("url")) {
				urlIndexing(session, "'" + documentData.getFilePath() + "'", jsObj.get("docId").toString());
			}
		}

		return id;// documentService.addDocumentInfo(documentData);
	}

	@RequestMapping(value = "/uploadDoc", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody boolean uploadDoc(HttpSession session, @RequestBody MultipartFile file, int id,
			String fileType) {

		String userApiKey = session.getAttribute("userApiKey").toString();

		int org = (int) session.getAttribute("loginOrgId");
		if (id > 0) {

			DocData docData = getDocInfo(session, id);
			// String currentDateTime = DateUtil.dateToStrSqlDateTime(new
			// Date());

			long dateString = new Date().getTime();

			String keyname = file.getOriginalFilename();

			docData.setFileName(keyname);
			String filePath = AWSUtil.uploadFile(dateString + "-" + keyname, fileType, file, docData.getId(), org);

			docData.setFilePath(filePath);

			String jsonString = "{'articleUrl':'" + filePath + "','docId':," + id + ", 'docFormat':'"
					+ docData.getDocFormat() + "', 'tableName':'documents', 'columnName':'CONTENT_PROFILE_URL'}";

			String sequenceNumber = "";

			// Kinesis put code

			/*
			 * PutRecordResult putRecordResult =
			 * AmazonKinesisUtil.putRecord(jsonString);
			 * 
			 * 
			 * 
			 * if(putRecordResult != null) { sequenceNumber =
			 * putRecordResult.getSequenceNumber();
			 * 
			 * if(sequenceNumber != null && !sequenceNumber.isEmpty()) {
			 * 
			 * } else { sequenceNumber = ""; } }
			 */
			String jsonData = "{'fileName':'" + keyname + "', 'filePath':'" + filePath + "', 'docId':" + id
					+ ", 'contentprofileurl': '" + sequenceNumber + "'}";
			JSONObject cred = new JSONObject(jsonData);
			JSONObject jsObj = HttpUtil.callPost(APIUtil.DOC_UPDATE_FILE_URL, cred, userApiKey);

		}

		return true;
	}

	@RequestMapping(value = "/getDocInfo", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody DocData getDocInfo(HttpSession session, int id) {

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.DOC_INFO_URL + "?docId=" + id, userApiKey);

		DocData documentData = new DocData();

		if (retData != null) {
			ObjectMapper mapper = new ObjectMapper();

			try {
				documentData = mapper.readValue(retData, DocData.class);

			} catch (Exception e) {

			}
		}

		return documentData;
	}

	@RequestMapping(value = "/deleteDocInfo", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody boolean deleteDocInfo(HttpSession session, String ids, boolean isDel) {

		int org = (int) session.getAttribute("loginOrgId");
		String fileBucket = "deleted";
		String[] docIds = ids.split(",");
		for (String id : docIds) {
			DocData docData = getDocInfo(session, Integer.parseInt(id));

			if (!isDel) {
				String userApiKey = session.getAttribute("userApiKey").toString();
				String retData = HttpUtil.callGet(APIUtil.DOC_DEL_URL + "?docId=" + id, userApiKey);
			}

		}
		return true;
	}

	@RequestMapping(value = "/deleteFile", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody boolean deleteFile(HttpSession session, int id) {

		String userApiKey = session.getAttribute("userApiKey").toString();

		String retData = HttpUtil.callGet(APIUtil.DOC_DEL_FILE_URL + "?fileId=" + id, userApiKey);
		return true;
	}

	@RequestMapping(value = "/searchDoc", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String searchDoc(HttpSession session, @RequestBody String keyWord) {
		int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());

		String jsonData = "{'content':'" + keyWord + "', 'orgid':'" + orgId + "'}";
		JSONObject cred = new JSONObject(jsonData);

		String userApiKey = session.getAttribute("userApiKey").toString();

		String Obj = HttpUtil.callPostStr(APIUtil.SEARCH_DOC_URL, cred, userApiKey);

		return Obj;
	}

	@Async
	@RequestMapping(value = "/urlIndexing", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String urlIndexing(HttpSession session, @RequestBody String url, String docId) {
		int orgId = Integer.parseInt(session.getAttribute("loginOrgId").toString());

		String orgIdWithtag = "";
		orgIdWithtag = "orgid=" + orgId + "&content_format=url&doc_id=" + docId + "";

		String jsonData = "{'Records':[{'articleUrl':" + url + "}], 'tags':'" + orgIdWithtag + "','doc_id':" + docId
				+ "}";
		JSONObject cred = new JSONObject(jsonData);

		String userApiKey = session.getAttribute("userApiKey").toString();

		String Obj = HttpUtil.callPostStr(APIUtil.PAGE_PROFILE_URL, cred, userApiKey);

		return Obj;
	}

	@RequestMapping(value = "/docconversion", method = RequestMethod.GET, headers = "Accept=application/json")
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
			flexiLbl.setScrId("DOC_CONVERSATION");
			FlexiUtil.getFlexiMapping(session, flexiLbl, APIUtil.FLEXI_LBL_URL, "DOC_CONVERSATION");

		}

		return "docprocess";
	}

}
