<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> labelMap = ((Map<String, Map<String, String>>) session.getAttribute("EDIT_DOC"));
Map<String, Map<String, String>> labelEMap = ((Map<String, Map<String, String>>) session.getAttribute("E_EDIT_DOC"));


int loginOrgId = 0;
if(session.getAttribute("loginOrgId") != null)
{
	loginOrgId = (int) session.getAttribute("loginOrgId");
}

String DOC_LIST_URL = APIUtil.DOCLISTURL;
String DOC_ADD_UPDATE_URL = APIUtil.DOC_ADD_UPDATE_URL;
String DOC_INFO_URL = APIUtil.DOC_INFO_URL;
String DOC_DEL_URL = APIUtil.DOC_DEL_URL;
String DOC_KC_SEARCH_URL=APIUtil.DOC_KC_SEARCH_URL;


%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sentient IO</title>
  <meta charset="utf-8">
  <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="resources/css/bootstrap.css">
  <link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/ng-tags.css" />
      
  <link rel="stylesheet" href="resources/css/angular-datatables.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/tabletools/2.2.4/css/dataTables.tableTools.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/mob-res.css">
  <style>
  	.kBaseBox{
  		display:block;
		}
		.tagDisable{
			color:#5683aa;
		}
		.k-row{
			margin-right:0;
	margin-left:0px; 
	margin-top:15px;
		}
		h4{margin-top: 0px;
    margin-bottom: 0px;}
  </style>
  
  	<script>
  	 var loginOrgId = <%=loginOrgId%>;
  	 var DOC_LIST_URL = "<%=DOC_LIST_URL%>";
  	 var DOC_ADD_UPDATE_URL = "<%=DOC_ADD_UPDATE_URL%>";
 	 var DOC_INFO_URL = "<%=DOC_INFO_URL%>";
  	 var DOC_DEL_URL = "<%=DOC_DEL_URL%>";
  	 var DOC_KC_SEARCH_URL = "<%=DOC_KC_SEARCH_URL%>";
  	</script>  
</head>
	<body ng-app="sentiApp" ng-controller="editKnowledge">
		<jsp:include page="header.jsp"/>
		<div class = "dashPage" >
		<!-- <div class="loadr" ng-if="loaderS"> -->
				<div class="loading-container" ng-if="loaderS">
						<div class="loading">
						  <!-- <span>Loading...</span> -->
						</div>
					  </div>
			</div>	
			<div class="container-fluid paddingLR30 pageTBMargin padding0 " ng-show="editForm">
				<div class ="titleInfo">
					<h4 class="dastitl btn_bg font-weight-bold" style="padding-left: 25px; margin-top:0; margin-bottom:0;"><%=labelMap.get("EDIT_DOC").get("D_EDT_SUBTITLE")%></h4>
				</div>
				<div class="clearfix"></div>
				<section class="tablData box box-bg">
				<div class="row k-row kBaseBox">
					<div class="col-sm-8 LR0">
						<form name="formEdit" novalidate>
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3><%=labelMap.get("EDIT_DOC").get("D_EDT_NAME")%></h3>
								</div>

								<div class="formField col-sm-7">
									<input type="hidden" ng-model="editList.id">
									<input type="text" placeholder="<%=labelMap.get("EDIT_DOC").get("D_EDT_NAME_P")%>" ng-model="editList.docName">
								</div>
							</div>
							
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3><%=labelMap.get("EDIT_DOC").get("D_EDT_DESC")%></h3>
								</div>

								<div class="formField col-sm-7 ">
									<textarea type="text" placeholder="<%=labelMap.get("EDIT_DOC").get("D_EDT_DESC_P")%>" ng-model="editList.docDesc"></textarea>
								</div>
							</div>

							<div class="clearfix"></div>
							
							<div class="formGrp">
								<div class="formLabel col-sm-3 ">
									<h3><%=labelMap.get("EDIT_DOC").get("D_EDT_ACCESS")%></h3>
								</div>

								<div class="formField col-sm-7">
									<select class="dropBoxed" ng-model="editList.docAccess" ng-class="{true : 'colorAAA',false : ''}[editList.docAccess == undefined || editList.docAccess == '']">
										<%-- <option value=""><%=labelMap.get("EDIT_DOC").get("D_EDT_ACCESS_P")%></option> --%>
										<option value="{{docAc.value}}" ng-repeat="docAc in docAccessList">{{docAc.value}}</option>
									</select>
								</div>
							</div>
							
							<div class="clearfix"></div>
							
							<div class="formGrp">
								<div class="formLabel col-sm-3" style="padding-top: 5px;">
									<h3><%=labelMap.get("EDIT_DOC").get("D_EDT_FORMAT")%></h3>
								</div>

								<div class="formField col-sm-7" style="padding:0px 8px;">
									<ul class="list-unstyled fileTypRadi" style="margin:0px; padding:0px;">
										<li><input type="radio"  value="document"  ng-model="editList.uploadType" ng-disabled="true"><span><%=labelMap.get("EDIT_DOC").get("D_EDT_DOCUMENT")%></span></li>
					    				<li><input type="radio"  value="website" ng-model="editList.uploadType" ng-disabled="true"><span><%=labelMap.get("EDIT_DOC").get("D_EDT_URL")%></span></li>
					    				
					    			</ul>	
					    			<%-- <span ng-show="editList.uploadType=='website'"><%=labelMap.get("EDIT_DOC").get("D_EDT_URL")%></span>
            						<span ng-show="editList.uploadType=='document'"><%=labelMap.get("EDIT_DOC").get("D_EDT_DOCUMENT")%></span> --%>
								</div>
							</div>

							<!--<div class="clearfix"></div>-->
							
							<div class="formGrp">
								<div class="col-sm-3 formLabel">
									<h3><%=labelMap.get("EDIT_DOC").get("D_EDT_UPLOAD")%></h3>
								</div>

								<div class="formField col-sm-7">
									<div class="formField" ng-show="editList.uploadType == 'website'">
										<input type="text" placeholder="<%=labelMap.get("EDIT_DOC").get("D_EDT_SOURCE")%>" ng-model="editList.filePath">
									</div>
									
									<%-- <div class="relative formUpload" ng-hide="editList.fileName">
										<input id="uploadbtnn" ngf-select="uploadFiles($files)"  ngf-pattern="'application/pdf,application/vnd.ms-excel,application/msword,text/plain,application/vnd.openxmlformats-officedocument.wordprocessingml.document'"/>
										<label class="btn btn-default" for="uploadbtnn"><%=labelMap.get("EDIT_DOC").get("D_EDT_UPLOAD_P")%></label>
									</div> --%>
									
									<div class="relative formUpload" ng-hide="editList.uploadType == 'website' || editList.fileName!=''">
										<div class="dragDrpBx" ngf-select="uploadFiles($files)" ngf-drop="uploadFiles($files)" ng-model="files">
											<p><a ng-disabled="!uploadType">Choose files or Drag here to upload</a></p>
										</div>
									</div>
									
									<div class="clearfix"></div>

									<div class="upldinFile"  ng-show="editList.fileName">
										<ul class="margin0 list-unstyled pull-left" ng-hide="editList.uploadType == 'website'">
											<li class="">
												{{editList.fileName}}
												<i class="fa fa-close" ng-click="editList.fileName ='';editList.filePath = '';editList.isFileChanged='Y'"></i>
											</li>
										</ul>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							
							<div class="formGrp">
								<div class="col-sm-3 formLabel">
									<h3><%=labelMap.get("EDIT_DOC").get("D_EDT_TAGS")%></h3>
								</div>

								<div class="formField col-sm-9 padding0">
									<div class="formGrp" style="margin-bottom:0px;">
										<div novalidate class="formField" ng-form="tagForm">
											<div class="col-sm-4">
												<input type="text" placeholder="<%=labelMap.get("EDIT_DOC").get("EDIT_TAG_KEY")%>" ng-model="uniqueKey">
											</div>
											<div class="col-sm-4 padding0">
												<input type="text" placeholder="<%=labelMap.get("EDIT_DOC").get("EDIT_TAG_VALUE")%>" ng-model="uniqueValue">
											</div>
											<div class="col-sm-1">
												<button type="submit" class="uButton popBtn" ng-disabled="!uniqueKey || !uniqueValue" ng-click="addTagsRow(editList.tags)"><i class="fa fa-plus"></i></button>
											</div>
											<div class="col-sm-2">
											<button type="button" class="btn btn-successcustom" ng-click="showOrgTagPop()"><%=labelMap.get("EDIT_DOC").get("ADD_FROM_LIST")%></button>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							
				<!--			<div class="formGrp">-->
																
								<div class="formGrp " ng-repeat="list in editList.tags" ng-show="list.delMark=='N'">
									<div class="formField col-sm-offset-3 col-sm-9 padding0">
										<div class="col-sm-4">
											<input type="text" placeholder="key" ng-model="list.tag" disabled="true">
										</div>
										<div class="col-sm-4 padding0">
											<input type="text" placeholder="value" ng-model="list.value" disabled="true">
										</div>
										<div class="col-sm-1">
											<button class="uButton popBtn" ng-click="removeTagz($index,list,editList.tags)"><i class="fa fa-close colorAAA"></i></button>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							<!-- 	<div class=" col-sm-5 col-sm-offset-2">
									<label class="error_css" ng-show="errorKey"><%=labelEMap.get("E_EDIT_DOC").get("D_EDIT_ALT_KEY")%></label>
								</div>
								
								<div lass="clearfix"></div>-->
							<!--</div>-->
							
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3><%=labelMap.get("EDIT_DOC").get("D_EDT_STATUS")%></h3>
								</div>

								<div class="formField col-sm-7" style="padding:7px 15px;">
									 {{editList.status}}
								</div>
<div class=" col-sm-5 col-sm-offset-2">
                                                                        <label class="error_css" ng-show="errorKey"><%=labelEMap.get("E_EDIT_DOC").get("D_EDIT_ALT_KEY")%></label>
                                                                </div>
							</div>

						<!-- 	<div class="formGrp">
								<div class="formLabel col-sm-2">
									<h3>Remarks</h3>
								</div>

								<div class="formField col-sm-5" style="padding:10px 15px;">
									integration in progress
								</div>
							</div> -->

							<div class="clearfix"></div>
						</form>
					</div>
					<div class="col-sm-4">
						<h4 style="margin-left: 23px;" 	ng-if="nGrams.length>0">Top 15 n-grams</h4>
<br/>							
<div class="col-sm-12">
								<ul class="list-unstyled" ng-repeat="ngrm in nGrams | orderObjectBy : 'score'|limitTo : '15' " style="border-bottom: 1px solid #efefef;">
									<li>
										{{ngrm.name}} &nbsp;&nbsp;- {{ngrm.score.substr(0, 4)}}
									</li>
								</ul>
							</div>
					</div>
				</div>
					
					<div class="clearfix"></div>
					
					<div ng-hide="hideForm" class="marginRight10">
						<div ng-show="formvalidation" class="formValidator marginTop10">
							<ul class="list-unstyled">
								<li ng-hide="editList.docName"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_NAME")%></li>
								<%-- <li ng-hide="editList.docDesc"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_TYPE")%></li> --%>
								<li ng-hide="editList.docFormat"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_FMT")%></li>
								<%-- <li ng-hide="sentAccess"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_ACCESS")%></li>
								<li ng-hide="fileType"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_DOC")%></li> --%>
								<li ng-hide="editList.fileName || editList.uploadType=='website'">Please select the file</li>
								<li ng-hide="sentSourceURl">
									<span ng-show="fileType == 'url'"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_SRC")%></span>
								</li>
								<li ng-hide="selectedFils.length > 0">
									<span ng-show="fileType == 'fileUp'"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_FILES")%></span>
								</li>
							</ul>
						</div>
					</div>
					
					<div class="marginTop10 marginRight10 textRight"style="padding-bottom: 45px;">	
						<button class="btn btn-default" onclick="location.href='docList'"><%=labelMap.get("EDIT_DOC").get("D_EDT_CANCEL")%></button>
						<button ng-if="uAccess.KC_DELETEDOC" class="btn btn-default marginLeft5" data-toggle="modal" data-target="#confimationPop"><%=labelMap.get("EDIT_DOC").get("D_EDT_DELETE")%></button>
						<button ng-if="uAccess.KC_UPDATEDOC" class="btn btn-successcustom marginLeft5" ng-click="updateData(editList)"><%=labelMap.get("EDIT_DOC").get("D_EDT_UPDATE")%></button>
						<div class="clearfix"></div>
					</div>	
				</section>
			</div>
		

		<!-- BOOTSTRAP ERROR MODAL -->
			<div id="errorModal" class="customPop modal fade" role="dialog">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title">Error !!</h4>
			      </div>
			      <div class="modal-body">
			        <p>{{popUpMsg}}</p>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-successcustom" data-dismiss="modal">ok</button>
			      </div>
			    </div>

			  </div>
			</div>
		<!-- BOOTSTRAP ERROR MODAL -->
		
				<!-- BOOTSTRAP DELETE CHECK MODAL -->
			<div id="confimationPop" class="customPop modal fade" role="dialog" style="margin-top:30px;">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_DLT")%></h4>
			      </div>
			      <div class="modal-body">
			        <p><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_DLT_MSG")%></p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default uButton" data-dismiss="modal"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_NO")%></button>
			        <button type="button" class="btn btn-successcustom" ng-click="deleteThis(editList.docId)"><%=labelEMap.get("E_EDIT_DOC").get("D_EDT_ALT_YES")%></button>
			      </div>
			    </div>

			  </div>
			</div>
		<!-- BOOTSTRAP DELETE CHECK MODAL -->
		
			<!-- ORG TAG POPUP START -->
		
			<div id="orgTagPop" class="customPop modal fade" role="dialog">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title"><%=labelMap.get("EDIT_DOC").get("ORG_TAG_TITLE")%></h4>
			      </div>
			      <div class="modal-body" style="max-height: 500px; overflow: auto;">
					<ul class="nav nav-tabs" id="tabContent">
					    <li class="active"><a href="#tags"  data-toggle="tab">Tags</a></li>
					    <li><a href="#tagGroup" data-toggle="tab">Tags Group</a></li>
					</ul>							
					<section class="wrapper tagsWrapp">
					<div class="tab-content">
						<div class="tab-pane" id="tagGroup">
						<div class="parnt_dii box " ng-repeat="tag in tagList">
							<div class="child_row" style="background-color: #efefef;">						
								<div class="col-sm-5 formFiltt" style="padding-left: 0px !important; ">
									<span ng-hide="tag.excp" style="float: left; padding-right: 5px; padding-top: 8px; cursor: pointer;" ng-click="tag.excp = !tag.excp" ><i class="fa fa-angle-down"></i></span>
									<span ng-show="tag.excp" style="float: left; padding-right: 5px; padding-top: 8px; cursor: pointer;" ng-click="tag.excp = !tag.excp" ><i class="fa fa-angle-up"></i></span>
									<span  style="float: left;"><input type="text" ng-model="tag.tagKey" readonly class="formTextBox"></span>
								</div>
								<div class="col-sm-5 formFiltt">
									<input type="text" ng-model="tag.tagValue" readonly class="formTextBox">
								</div>
								<div class="col-sm-2" style="text-align: right; " >		
									<!-- <span ng-show="tag.checkedStatus=='checked'" ng-click="setOnOffTag(tag, 'P')">
									<i class="fa fa-toggle-on" style="color: #a4c158; font-size: xx-large; padding-top: 2px"></i>
									</span>
									<span ng-hide="tag.checkedStatus=='checked'" ng-click="setOnOffTag(tag, 'P')">
									<i class="fa fa-toggle-off" style="color: #bc0000; font-size: xx-large; padding-top: 2px"></i>
									</span> -->
									<!-- <input class="dummyPTag" type="checkbox" ng-model='tag.checkedStatus'  data-toggle="toggle" data-on="on" data-off="off" data-onstyle="success" data-offstyle="danger"> -->
								</div>
								<div class="clearfix"></div>
							</div>
							
							<div  ng-show="tag.excp" class="child_row subChild" ng-repeat="child in tag.childTags" style="border-bottom-color: #CCC; border-bottom-width: 1px; border-bottom-style: solid;">
								<!-- <div class="col-sm-1">
								</div> -->
								<div class="col-sm-5 formFiltt">
									<input type="text" ng-model="child.tagKey" readonly class="formTextBoxChild">
								</div>
								<!-- <div class="col-sm-1">
								</div> -->
								<div class="col-sm-5 formFiltt">
									<input type="text" ng-model="child.tagValue" readonly class="formTextBoxChild">
								</div>
								<div class="col-sm-2" style="text-align: right;">
									<span ng-show="child.checkedStatus=='checked'" ng-click="setOnOffTag(child, 'C')">
									<i class="fa fa-toggle-on" ></i>
									</span>
									<span ng-hide="child.checkedStatus=='checked'" ng-click="setOnOffTag(child, 'C')">
									<i class="fa fa-toggle-off"></i>
									</span>
									 <!-- <input type="checkbox" ng-click="setOnOffTag(child.id)" checked data-toggle="toggle" data-on="on" data-off="off" data-onstyle="success" data-offstyle="danger"> -->
								</div>
								<div class="clearfix"></div>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
					
					<div class="tab-pane active" id="tags">
				<div class="parnt_dii box">
					<div  class="child_row subChild" ng-repeat="child in singleTags" style="border-bottom-color: #CCC; border-bottom-width: 1px; border-bottom-style: solid;">
						<div class="col-sm-1">
						</div>
						<div class="col-sm-4 formFiltt">
							<input type="text" ng-model="child.tagKey" readonly class="formTextBoxChild">
						</div>
						<div class="col-sm-1">
						</div>
						<div class="col-sm-4 formFiltt">
							<input type="text" ng-model="child.tagValue" readonly class="formTextBoxChild">
						</div>
						<div class="col-sm-2" style="text-align: right;">
							<span ng-show="child.checkedStatus=='checked'" ng-click="setOnOffTag(child, 'C')">
							<i class="fa fa-toggle-on"></i>
							</span>
							<span ng-hide="child.checkedStatus=='checked'" ng-click="setOnOffTag(child, 'C')">
							<i class="fa fa-toggle-off"></i>
							</span>
						</div>
						<div class="clearfix"></div>
					</div>						
					<div class="clearfix"></div>
				</div>
				</div>
				</div>
			</section>	
				<div class="clearfix"></div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-successcustom" data-dismiss="modal">Close</button>
			      </div>
			    </div>

			  </div>
			</div>	
			<!-- ORG TAG POPUP END -->	
</div>
	<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="resources/js/app.js"></script>
	  	<script src="resources/controller/controller.js"></script>
	  	<script src="resources/js/directive.js"></script>
	  	<script src="resources/js/factory.js"></script>

	  	<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	  	<script src="resources/js/angular-datatables.min.js"></script>
	  	<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.colVis.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
		<script src="resources/js/angular-datatables.buttons.js"></script>
		
		<script src="https://cdn.datatables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js"></script>
		<script src="resources/js/angular-datatables.tabletools.min.js"></script>
	  	
	  	<script src="resources/js/ng-file-upload-shim.js"></script>
	  	<script src="resources/js/ng-file-upload.js"></script>
	  	<script src="resources/js/custom.js"></script>
	  	<script src="resources/js/ng-tags.js"></script>
	  	<script src="resources/js/ngstorage.min.js"></script>
<script>
	$(function(){
		$('#knowledge').addClass('menu-active');
	})
</script>
	</body>
</html>
