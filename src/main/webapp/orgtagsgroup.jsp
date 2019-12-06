<%@ page session="true" %>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>
<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> lblOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_DE"));
Map<String, Map<String, String>> lblOrgGrp = ((Map<String, Map<String, String>>) session.getAttribute("ORG_GRP"));
Map<String, Map<String, String>> errOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_ERR"));
Map<String, Map<String, String>> lblOrgTags = ((Map<String, Map<String, String>>) session.getAttribute("ORG_TAGS"));

Map<String, Map<String, String>> lblOrgTagsERR = ((Map<String, Map<String, String>>) session.getAttribute("ORG_TAGS_ERR"));
String ORG_TAG_PARENT_UPDATE_URL = APIUtil.ORG_TAG_PARENT_UPDATE_URL;
String ORG_TAG_CHILD_UPDATE_URL = APIUtil.ORG_TAG_CHILD_UPDATE_URL;
String ORG_TAG_PARENT_DELETE_URL = APIUtil.ORG_TAG_PARENT_DELETE_URL;  	 
String ORG_TAG_CHILD_DELETE_URL = APIUtil.ORG_TAG_CHILD_DELETE_URL;
String ORG_TAG_LIST_URL = APIUtil.ORG_TAG_LIST_URL;
String ORG_TAGGROUP_LIST_URL = APIUtil.ORG_TAGGROUP_LIST_URL;

int loginOrgId2 = 0;
if(session.getAttribute("loginOrgId") != null)
{
	loginOrgId2 = (int) session.getAttribute("loginOrgId");
}

%>
		<style>
		
			table.listTable tbody td{
				text-indent:1%;
			}
			.btn_cancel {
	border-color: #ccc;
    width: 10rem;
    margin-left: 10px;
    color: #333;
    border: 1px solid #c4c4c7;
}

.btn {
	display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
	touch-action: manipulation;
    cursor: pointer;
	user-select: none;
    background-image: none;
	border-radius: 4px;
	height: 32px;
}


.btn_save {
    color: white;
    width: 10rem;
    margin-right: 10px;
}
.btn-successcustom {
    background-color: #96CA4E;
    border-color: #96CA4E;
    
}
		</style>
<script>
  	 var ORG_TAG_PARENT_UPDATE_URL = "<%=ORG_TAG_PARENT_UPDATE_URL%>";
  	 var ORG_TAG_CHILD_UPDATE_URL = "<%=ORG_TAG_CHILD_UPDATE_URL%>";
  	 var ORG_TAG_PARENT_DELETE_URL = "<%=ORG_TAG_PARENT_DELETE_URL%>";  	 
  	 var ORG_TAG_CHILD_DELETE_URL = "<%=ORG_TAG_CHILD_DELETE_URL%>";
  	 var ORG_TAG_LIST_URL = "<%=ORG_TAG_LIST_URL%>";
  	 var ORG_TAGGROUP_LIST_URL = "<%=APIUtil.ORG_TAGGROUP_LIST_URL%>";
</script>		

<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">


<div class="wrapper" ng-controller="orgtags" ng-cloak>
	<%@include file="header.jsp"%>
	<!-- <div class="loadr" ng-if="loader"></div> -->
	<div class="loading-container" ng-if="loader">
			<div class="loading">
			  <!-- <span>Loading...</span> -->
			</div>
		  </div>
			<div class="container-fluid paddingLR30 pageTBMargin80 box paddingTop0 padding0 paddingbtm">
					<div class="formBottom">
				<h4 class="btn_bg margin0"><%=lblOrg.get("ORG_DE").get("TITLE")%></h4>
				<div class="pad-15">
					<ul class="list-unstyled ul_orgDets">
						<li>
							<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("NAME")%></label>	
							<div class="col-sm-4">	
								<span ng-hide="editOrg2">{{orgDetails.name}}</span>
								<div class="formInput" ng-show="editOrg2">
									<input type="text" ng-model="orgDetails.name" readonly="true">
								</div>
							</div>
						</li>	
						<li class="marginTop10">
							<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("STATUS")%></label>	
							<div class="col-sm-10">		
								<span ng-hide="editOrg2" style="width:100%">{{orgDetails.desc}}</span>
								<div class="formInput" ng-show="editOrg2">
									<textarea ng-model="orgDetails.desc"></textarea>
								</div>
							</div>
						</li>
						<li ng-show="succesUpdat">
							<label class="marginTop10 success_css">Update Successfully !!</label>
						</li>							
						<!-- <i  ng-if="orgDetails.orgType == 'child' && uAccess.ORG_DELETEORG" class="fa fa-trash sColor delOrgz" data-toggle="modal" data-target="#deleOrgnzt"></i>
						<i ng-if="uAccess.ORG_UPDATEORGINFO" class="fa fa-pencil colorAAA editOrgz" ng-click="setOrgEditMode()" ng-hide="editOrg2"></i>
						<i class="fa fa-check pColor editOrgz"  ng-click="updateOrgz();" ng-show="editOrg2"></i> -->
					</ul>

					<div class="clearfix"></div>			
			</div>	
		</div>
			
			<div class="marginTop10 orgMenu LR0">
				<div class="orgnztnMenu">
					<ul class="list-unstyled margin0">
						<li ng-if="uAccess.ORG_GETUSERLIST"><a href="orgdetails"><%=lblOrg.get("ORG_DE").get("USERS")%></a></li>
						<li ng-if="uAccess.ORG_GETORGASSIGNFUNCTIONS"><a href="orgFunctionList"><%=lblOrg.get("ORG_DE").get("FUNCTIONS")%></a></li>
						<li ng-if="uAccess.ORG_GETORGROLELIST"><a href="orgrole"><%=lblOrg.get("ORG_DE").get("ROLES")%></a></li>
						<li ng-if="uAccess.ORG_GETORGGROUPLIST"><a href="orggroup"><%=lblOrg.get("ORG_DE").get("GROUP")%></a></li>
						<li class="active tpMenu"><a href="orgtags"><%=lblOrg.get("ORG_DE").get("TAGS")%></a>
						<ul class="list-unstyled chsubMenu" ng-if="uAccess.ORG_GETORGTAGS">
								<li ng-if="uAccess.ORG_GETORGTAGS"><a href="orgtags"><%=lblOrg.get("ORG_DE").get("TAGS_M")%></a></li>
								<li ng-if="uAccess.ORG_GETORGGROUPLIST"><a href="orgtagsgroup"><%=lblOrg.get("ORG_DE").get("TAGS_GROUP")%></a></li>
							</ul>
						
						</li>
						<%
						if (loginOrgId2 == 1){
							%>
							<li><a href="dasetting"><%=lblOrg.get("ORG_DE").get("DA_SETTINGS")%></a></li>
							<%
						}
						%>
					</ul>	
				</div>
			</div>
			
			<section class="tagsWrapp LR0"  style="margin-bottom: 45px;">
			<div class="container-fluid " >
				<form class="main_row" ng-submit="addParentTag()" ng-if="uAccess.ORG_UPDATEORGPARENTTAG">
					<div class="col-sm-5 formFiltt">
						<input type="text" id="newParentKey" ng-model="newParentKey" placeholder="<%=lblOrgTags.get("ORG_TAGS").get("PARENT_KEY")%>" required>
					</div>
					<div class="col-sm-5 formFiltt">
						<input type="text" id="newParentValue" ng-model="newParentValue" placeholder="<%=lblOrgTags.get("ORG_TAGS").get("PATENT_VALUE")%>" required>
					</div>
					<div class="col-sm-2" style="white-space: nowrap !important; text-align: right;">
						<button class="btn btn_save btn-successcustom pButtonTag marginLeft10" ng-submit="addParentTag()"><%=lblOrgTags.get("ORG_TAGS").get("ADD_PARENT_TAG")%></button>
					</div>
					<div class="clearfix"></div>
				</form>


				<div ng-if="uAccess.ORG_GETORGTAGSGROUP" class="parnt_dii apps-container" ui-sortable="sortableOptions"  ng-repeat="tag in tagList">
					<div class="child_row" style="background-color: #efefef;">						
						<div class="col-sm-4 formFiltt" style="padding-left: 0px !important; ">
							<span ng-hide="tag.excp" style="float: left; padding-right: 5px; padding-top: 8px; cursor: pointer;" ng-click="tag.excp = !tag.excp" ><i class="fa fa-angle-down"></i></span>
							<span ng-show="tag.excp" style="float: left; padding-right: 5px; padding-top: 8px; cursor: pointer;" ng-click="tag.excp = !tag.excp" ><i class="fa fa-angle-up"></i></span>
							<span  style="float: left;"><input type="text" ng-model="tag.key" readonly class="formTextBox"></span>
						</div>
						<div class="col-sm-4 formFiltt">
							<input type="text" ng-model="tag.value" readonly class="formTextBox">
						</div>
						<div class="col-sm-4" style="text-align: right;">	
							<button ng-if="uAccess.ORG_UPDATEORGCHILDTAG" class="btn btn_save btn-successcustom pButtonTag"  ng-click="addChildTags(tag.childTags,$index)"><%=lblOrgTags.get("ORG_TAGS").get("ADD_CHILD")%></button>						
							<button ng-if="uAccess.ORG_DELETEORGPARENTTAGS" class="btn btn_save btn-successcustom sButtonTag" style="background-color: #bc0000; border:#bc0000" ng-click="deleteParent(tag, $index)" style="width: 100px;"><%=lblOrgTags.get("ORG_TAGS").get("DELETE_PARENT_TAG")%></button>
							
						</div>
						
						<div class="clearfix"></div>
					</div>
					
					<div  ng-show="tag.excp" class="child_row subChild app" ng-repeat="child in tag.childTags" ng-model="tag.childTags" style="border-bottom-color: #CCC; border-bottom-width: 1px; border-bottom-style: solid;">
						
						<!-- <div class="col-sm-1">
						</div> -->
						<div class="col-sm-4 formFiltt">
							<input type="text" ng-model="child.key" readonly class="formTextBoxChild">
						</div>
						<!-- <div class="col-sm-1">
						</div> -->
						<div class="col-sm-4 formFiltt">
							<input type="text" ng-model="child.value" readonly class="formTextBoxChild">
						</div>
						<div class="col-sm-4" style="text-align: right; padding-right: 10px;">
							<button ng-if="uAccess.ORG_DELETEORGCHILDTAG" class="uButton deleBtn" ng-click="deleteChild(child, tag, $index)" style="width: 100px; text-align: right;"><i class="fa fa-trash"></i></button>
						</div>
						<div class="clearfix"></div>
					</div>						
					<div class="clearfix"></div>
				</div>



			</div>
		</section>	
		
		<!-- TAG MODAL WINDOW -->
			<div id="tagsModal" class="customPop modal fade" role="dialog">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" ng-click="updateTagsinClose()">&times;</button>
			        <h4 class="modal-title">Add Tags</h4>
			      </div>
			      <div class="modal-body">
		        	<section>
					<div class="parnt_dii " ng-repeat="tag in tagsArray">
						
						<div  class=" subChild"  style="border-bottom-color: #CCC; border-bottom-width: 1px; border-bottom-style: solid;">
							<div class="col-sm-1">
							</div>
							<div class="col-sm-4 formFiltt">
								<input type="text" ng-model="tag.key" readonly class="formTextBoxChild">
							</div>
							<div class="col-sm-1">
							</div>
							<div class="col-sm-4 formFiltt">
								<input type="text" ng-model="tag.value" readonly class="formTextBoxChild">
							</div>
							<div class="col-sm-2" style="text-align: right;">
								<span ng-show="tag.checkedStatus=='checked'" ng-click="setOnOffTag(tag)">
								<i class="fa fa-toggle-on" ></i>
								</span>
								<span ng-hide="tag.checkedStatus=='checked'" ng-click="setOnOffTag(tag)">
								<i class="fa fa-toggle-off" ></i>
								</span>
							</div>
							<div class="clearfix"></div>
						</div>						
						<div class="clearfix"></div>
					</div>
					<p ng-if="tagsArray.length==0">Tags not found</p>
				</section>	
					</div>
				</div>
			</div>	
		</div>
		
		
			<div id="deleParentTag" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1"><%=lblOrgTagsERR.get("ORG_TAGS_ERR").get("DELETE_TITLE")%></h1>
			    		
			    		<p><%=lblOrgTagsERR.get("ORG_TAGS_ERR").get("CONFIRM_PARENT_DEL")%></p>
			    		
			    		<div class="formInput col-sm-12">
			    			<button class="btn btn_save btn-successcustom pull-right pButton marginLeft10" ng-click="deleteParentTag()">Yes</button>
			    			<button class="btn btn_cancel btn-default pull-right uButton" data-dismiss="modal">No</button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>		
			
			<div id="deleChildTag" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1"><%=lblOrgTagsERR.get("ORG_TAGS_ERR").get("DELETE_TITLE")%></h1>
			    		
			    		<p><%=lblOrgTagsERR.get("ORG_TAGS_ERR").get("CONFIRM_CHILD_DEL")%></p>
			    		
			    		<div class="formInput col-sm-12">
			    			<button class="btn btn_save btn-successcustom pull-right pButton marginLeft10" ng-click="deleteChildTag()">Yes</button>
			    			<button class="btn btn_cancel btn-default pull-right uButton" data-dismiss="modal">Cancel</button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>		
			
			
</div>
		
<%@include file="footer.jsp"%>
<script src="resources/org/controller/org_tags_controller.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
		<script>
			$(function(){
				$('#orgz').addClass('active');
			});			
		</script>