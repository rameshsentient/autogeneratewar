<%@ page session="true" %>
<%@page import="java.util.Map"%>

<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> lblOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_DE"));
Map<String, Map<String, String>> lblFun = ((Map<String, Map<String, String>>) session.getAttribute("ORG_FUN"));
Map<String, Map<String, String>> errOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_ERR"));

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
			table.listTable thead span{
				margin-left: 4%;
			}
			table.listTable tbody td{
				text-indent:1%;
			} 
		</style>
		
	<style>
		table.tableP{
			/* border : 1px solid #ccc;
			border-top :0px; */
			box-shadow: 0 1px 3px 0 rgba(0,0,0,.2), 0 1px 1px 0 rgba(0,0,0,.14), 0 2px 1px -1px rgba(0,0,0,.12);
		}	
	</style>		
<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
	
	<div class="wrapper" ng-controller="functions" ng-cloak>
	<%@include file="header.jsp"%>
	<div class="container-fluid paddingLR30 pageTBMargin80 box paddingTop0 padding0" style="margin-bottom: 15px;">
		<div class="padding0">
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
							<div class="col-sm-10" >		
								<span ng-hide="editOrg2" style="width:100% !important">{{orgDetails.desc}}</span>
								<div class="formInput" ng-show="editOrg2">
									<textarea ng-model="orgDetails.desc"></textarea>
								</div>
							</div>
						</li>	
						<li ng-show="succesUpdat">
							<label class="marginTop10 success_css">Update Successfully !!</label>
						</li>
						<!-- <i ng-if="orgDetails.orgType == 'child' && uAccess.ORG_DELETEORG" class="fa fa-trash sColor delOrgz" data-toggle="modal" data-target="#deleOrgnzt"></i>
						<i ng-if="uAccess.ORG_UPDATEORGINFO" class="fa fa-pencil colorAAA editOrgz" ng-click="setOrgEditMode()" ng-hide="editOrg2"></i>
						<i class="fa fa-check pColor editOrgz"  ng-click="updateOrgz();" ng-show="editOrg2"></i> -->
					</ul>	
				</div>				
					<div class="clearfix"></div>	
				</div>

					
							
		
			
			
				<div class="container-fluid">
						<div class="orgnztnMenu marginTop10">
					<ul class="list-unstyled margin0">
						<li ng-hide="userDetails" ng-if="uAccess.ORG_GETUSERLIST"><a href="orgdetails"><%=lblOrg.get("ORG_DE").get("USERS")%></a></li>
						<li ng-show="userDetails"><a ng-click="userDetails = false"><%=lblOrg.get("ORG_DE").get("USERS")%></a></li>
						<%
						if(orgTypeTemp.equals("main"))
						{
							%>
							<li class="active" ng-if="uAccess.ORG_GETORGASSIGNFUNCTIONS"><a href="orgFunctionList"><%=lblOrg.get("ORG_DE").get("FUNCTIONS")%></a></li>
							<%
						}
						%>						
						<li ng-if="uAccess.ORG_GETORGROLELIST"><a href="orgrole"><%=lblOrg.get("ORG_DE").get("ROLES")%></a></li>
						<li ng-if="uAccess.ORG_GETORGGROUPLIST"><a href="orggroup"><%=lblOrg.get("ORG_DE").get("GROUP")%></a></li>
						<li ng-if="uAccess.ORG_GETORGTAGSLIST"><a href="orgtags"><%=lblOrg.get("ORG_DE").get("TAGS")%></a></li>
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

			<div class="container-fluid marginMinus" ng-hide="fnDetails">
				<div class="marginLeft20">
				<h4 class="pageH1 margin0">Assign Functions</h4>
			</div>
				<div class="col-sm-6 popTable">
					<table class="tableP" ng-if="uAccess.ORG_GETORGASSIGNFUNCTIONS">
						<thead ng-if="orgDetails.orgType == 'child'">
							<th style="width:95%">
								<span>Available Functions</span>
				    			<select id="selectedFunction" ng-model="selectedFunction" ng-if="uAccess.ORG_ADDUSERTOFUNCTION">
				    				<option ng-repeat="rep in functionDatas" value="{{rep.functionId}}" ng-hide="disableRepeat(rep.name)"> {{rep.name}}</option>	
				    			</select>
							</th>
							<th>
								<button ng-if="uAccess.ORG_ADDUSERTOFUNCTION" class="btn btn-default addlangs" style="line-height:8px !important" ng-click="getSelectedFunction('selectedFunction')">+</button>
							</th>
						</thead>
						<thead ng-if="orgDetails.orgType == 'main'">
							<th style="width:95%">
								<span>Available Functions</span>
							</th>
						</thead>
						<tbody>
							<tr ng-repeat="fun in orgAssignFunctionList">
								<td>									
									<input type="text" ng-model="fun.name" readonly>
								</td>
								<td ng-if="orgDetails.orgType == 'child'">
									<!-- <button style="margin:18px 0px 0px 6px;" class="uButton delePopId" data-toggle="modal" data-id="{{fun.id}}" data-target="#deleLang"><i class="fa fa-close"></i></button> -->
									<button ng-if="uAccess.ORG_REMOVEUSERFROMFUNCTION" style="margin:0px 0px 0px 6px;" class="uButton delePopId" data-toggle="modal" ng-click="removeFunFrmOrg(fun.id)"><i class="fa fa-close"></i></button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>				
				
			</div>
			
			<div id="deleLang" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1">Delete Confirmation</h1>
			    		
			    		<p>are you want to remove the function?</p>
			    		
			    		<div class="formInput col-sm-12">
			    			<button class="pull-right pButton marginLeft10" ng-click="removeFunctionAccess()">Yes</button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal">Cancel</button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
					<!-- DELETE ROLE MODAL -->
			<div id="deleOrgnzt" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1">Delete Confirmation</h1>
			    		
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
<script src="resources/org/controller/org_function_controller.js"></script>
	
		<script>
			$(function(){
				$('#orgz').addClass('active');
			});			
		</script>