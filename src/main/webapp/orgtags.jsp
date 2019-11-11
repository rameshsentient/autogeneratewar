<%@ page session="true" %>
<%@page import="java.util.Map"%>

<%@include file="session.jsp"%>
<%@page import="com.util.APIUtil"%>

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
String ORG_TAG_DELETE_URL = APIUtil.ORG_TAG_DELETE_URL;  

int loginOrgId2 = 0;
if(session.getAttribute("loginOrgId") != null)
{
	loginOrgId2 = (int) session.getAttribute("loginOrgId");
}

String orgTypeTemp = "";

if(session.getAttribute("orgType") != null)
{
	orgTypeTemp = session.getAttribute("orgType").toString();
}
%>


<style>
table.listTable tbody td {
	text-indent: 0.2% !important;

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
  	 var ORG_TAGGROUP_LIST_URL = "<%=ORG_TAGGROUP_LIST_URL%>";
  	 var ORG_TAG_DELETE_URL = "<%=ORG_TAG_DELETE_URL%>";
</script>

<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">

<div class="wrapper" ng-controller="orgtags" ng-cloak>
	<%@include file="header.jsp"%>
	<!-- <div class="loadr" ng-if="loader"></div> -->
	<div class="loading-container" ng-if="loader">
			<div class="loading">
			  <span>Loading...</span>
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
				</div>
					<div class="clearfix"></div>
					</div>			
					
				<div class="container-fluid">
						<div class="orgnztnMenu marginTop10 orgMenu">
					<ul class="list-unstyled margin0">
						<li ng-if="uAccess.ORG_GETUSERLIST"><a href="orgdetails"><%=lblOrg.get("ORG_DE").get("USERS")%></a></li>
						<%
						if(orgTypeTemp.equals("main"))
						{
							%>
							<li ng-if="uAccess.ORG_GETORGASSIGNFUNCTIONS"><a href="orgFunctionList"><%=lblOrg.get("ORG_DE").get("FUNCTIONS")%></a></li>
							<%
						}
						%>
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
			<div class="container-fluid marginMinus">
			<section class="tablData" >
		
					<button ng-if="uAccess.ORG_UPDATEORGCHILDTAG"  class="btn btn-successcustom" ng-click="addTag()"> Add Tag</button>
					<div class="clearfix"></div>
					<div class="col-md-12  marginTop20 tableList dtesAre table-responsive box padding0" ng-if="uAccess.ORG_GETORGTAGSLIST">
						<table  class="listTable table table-striped" style="margin-bottom: 45px;">
       
       <!-- <thead ng-if="tagsArray.length > 0"> -->
       <thead>
	         <th class="width80 checkbox">
	          <input id="checkball_{{$index}}" type="checkbox" ng-model="isAllSelected" ng-click="toggleAll(isAllSelected)"/>
	          <label  for="checkball_{{$index}}"></label>
	         </th>
	       	 <th>
	          <span ng-if="!advSpan" class="noBorder">Tag Key</span>
	          <!-- <a class="advOptn" ng-if="advSpan">
	           <b id="itemSelectd">{{selectedList}}</b> selected
	          </a> -->
	          <a class="advOptn" style="cursor: pointer;" ng-if="uAccess.ORG_DELETEORGTAG && advSpan" data-toggle="modal" data-target="#confimationPop" ng-class="{true : '',false : ''}[advEditSpan]">
	           Delete
	          </a>          
	         </th>
	         <th>
	          <span ng-if="!advSpan" class="noBorder">Tag Value</span>
	         </th>
	         <th>
	          <span ng-if="!advSpan" class="noBorder">Document Count</span> 
	         </th>
	         <th>
	          <span ng-if="!advSpan" class="noBorder">Tags Assigned</span> 
	         </th>
	         <th>
	          <span ng-if="!advSpan" class="noBorder">Parent Tags</span> 
	         </th>
       </thead>
       <tbody>
        <tr ng-repeat="val in tagsArray" ng-style="val.check_bx === true ? { 'background-color':'#e8e8e8'} : { 'background-color':''}">
         <td class="width80 checkbox">
          <input id="checkbx_{{$index}}" type="checkbox" ng-model="val.check_bx" ng-change="optionToggled();"/>
          <label for="checkbx_{{$index}}"></label>
         </td>
         <td ng-click="tagUpdate(val)" >{{val.key}}</td>
         <td ng-click="tagUpdate(val)">{{val.value}}</td>
         <td ng-click="tagUpdate(val)">{{val.doc_count}}</td>
         <td ng-click="tagUpdate(val)">{{val.parent_count}}</td>
         <td>
        
    		<ul class="list-unstyled margin0" ng-init="valueslimit = 2">
				<li class="paddingTop5" ng-repeat="ngrm in val.parent_values|limitTo : valueslimit ">{{ngrm}}</li>
			</ul>
			<p class="desc pColor" style="cursor: pointer;"  ng-show="ngramExpand && val.parent_values.length > 2" ng-click="ngramExpand = !ngramExpand;valueslimit = 2">Collapse</p>
			<p class="desc pColor" style="cursor: pointer;" ng-show="!ngramExpand && val.parent_values.length > 2"  ng-click="ngramExpand = !ngramExpand;valueslimit = 500">Expand</p>
			
         </td>
        </tr>
        <tr ng-if="tagsArray.length < 1" class="ng-scope">
        	<td class="emptyrow" colspan="6">no data found</td>
        </tr>
       </tbody>
       <!-- <p ng-if="tagsArray.length == 0" >No data found</p> -->
	  </table>
	</div>
</section>
</div>
	
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
			        	<div class="formGrp">
							<form class="formField" novalidate>
								<div class="col-sm-5 padding0">
									<input type="text" placeholder="Key" ng-model="uniqueKey" ng-focus="errorKey=false;" >
									<input type="hidden"  ng-model="id">
								</div>
								<div class="col-sm-5">
									<input type="text" placeholder="Value" ng-model="uniqueValue" ng-focus="errorKey=false;" >
								</div>
								<div class="col-sm-2">
									<button type="submit" class="btn btn-successcustom" ng-disabled="!uniqueKey || !uniqueValue" ng-click="addTagsRow()">Add</button>
									
								</div>
							</form>
							<div class="clearfix"></div>
						</div>
						<label class="error_css" ng-show="errorKey">Key and Value must be unique</label>
					</div>
				</div>
			</div>	
		</div>
			
		<!-- BOOTSTRAP DELETE CHECK MODAL -->
			<div id="confimationPop" class="customPop modal fade" role="dialog">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title"><%=lblOrgTagsERR.get("ORG_TAGS_ERR").get("DELETE_TITLE")%></h4>
			      </div>
			      <div class="modal-body">
			        <p><%=lblOrgTagsERR.get("ORG_TAGS_ERR").get("CONFIRM_CHILD_DEL")%></p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn_cancel btn-default" data-dismiss="modal">No</button>
			        <button ng-hide="addTagButton" type="button" class="btn btn_save btn-successcustom" ng-click="deleteTableList()">Yes</button>
			        <button ng-show="addTagButton" type="button" class="btn btn_save btn-successcustom" >Yes <i class="fa fa-spinner fa-spin"></i></button>
			        
			      </div>
			    </div>

			  </div>
			</div>
		<!-- BOOTSTRAP DELETE CHECK MODAL -->	
		
					<!-- DELETE ROLE MODAL -->
			<div id="deleOrgnzt" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h4 class="pageH1">Delete Confirmation</h4>
			    		
			    		<p>are you want to delete the selected data?</p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleteOrg()">Yes</button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal">Cancel</button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
</div>
</div>
		
<%@include file="footer.jsp"%>
<script src="resources/org/controller/org_tags_controller.js"></script>
		<script>
			$(function(){
				$('#orgz').addClass('active');
			});			
		</script>