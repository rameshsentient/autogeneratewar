<%@ page session="true" %>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>
<%@include file="session.jsp"%>
<%
Map<String, Map<String, String>> lblOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG"));
Map<String, Map<String, String>> errOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_ERR"));

String ACTIVATE_DELETED_ORG = APIUtil.ACTIVATE_DELETED_ORG;
String LIST_PREDEFINED_GROUP = APIUtil.LIST_PREDEFINED_GROUP;
%>

<script type="text/javascript">
var ACTIVATE_DELETED_ORG = "<%=ACTIVATE_DELETED_ORG%>";
var LIST_PREDEFINED_GROUP = "<%=LIST_PREDEFINED_GROUP%>";
</script>
       
  <style>
  	table.listTable tr th{
  		text-indent: 3%;
  	}
  		table.listTable tbody td{
  		text-indent: 3%;
	  }
	  h4{
		  margin-top:0px!important;
		  margin-bottom: 0px!important;
	  }
	  table{
		  margin: auto;
	  }
  </style>
  <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="resources/css/mob-res.css">
  
		<div class="wrapper" ng-controller="listOrganistn" ng-cloak>
		<%@include file="header.jsp"%>
		<div class="loading-container" ng-if="loader">
					<div class="loading">
					</div>
				  </div>		
			<div class="container-fluid paddingLR30 pageTBMargin80 padding0" ng-if="uAccess.ORG_GETORGLIST">
				
				<div class="titleInfo">
				<h4 class="btn_bg font-weight-bold pageH1 dastitl"><%=lblOrg.get("ORG").get("TITLE")%></h4>
			</div>
			<div class="col-md-12 box padding20">
			<div>
				<button ng-if="uAccess.ORG_UPDATEORGINFO" class="pButton" data-toggle="modal" data-target="#createOrg"><%=lblOrg.get("ORG").get("SUB_TITLE")%></button>
				<span ng-if="uAccess.ORG_UPDATEORGINFO">			
					<button  ng-hide="showActiveORG" class="pButton" data-toggle="modal" ng-click="getList()">Active Organisation</button>
					<button ng-show="showActiveORG" class="pButton" data-toggle="modal" ng-click="getDeletedORGList()">Deleted Organisation</button>
				</span>
					<div class="clearfix"></div>
				</div>
        <div style="margin-top: 20px;">
			<div class="col-md-12 table-responsive border-box-table table-bottom20 padding0">
				<table class="listTable table table-striped table-hover " ng-show="showActiveORG" >
					<thead>
						<th><%=lblOrg.get("ORG").get("NAME")%></th>
						<th style="text-indent: 0%"><%=lblOrg.get("ORG").get("DESC")%></th>
						<th><%=lblOrg.get("ORG").get("CREATED_BY")%></th>
						<th><%=lblOrg.get("ORG").get("CREATE_DATE")%></th>
						<th><%=lblOrg.get("ORG").get("STATUS")%></th>
						<!-- <th>flexy</th> -->
					</thead>

					<tbody>
						<tr class="cursor" ng-repeat="org in OrgDatas">
							<td nowrap="nowrap" ng-click="getOrgDets(org)">{{org.name}}</td>
							<td style="width:300px;text-indent: 0%" ng-click="getOrgDets(org)">
							<span>{{org.desc.substr(0, 100)}}</span>
							<span ng-show="org.desc.length>100">...</span>
							</td>
							<td ng-click="getOrgDets(org)">{{org.userName}}</td>
							<td ng-click="getOrgDets(org)">{{customDateFormat(org.dateCreated)}}</td>
							<td ng-click="getOrgDets(org)">Active</td>
							<!-- <td ng-click="gotoFlexcy(org)"><i class="fa fa-globe" data-toggle="tooltip" title="Flexy Change"></i></td> -->
						</tr>
						<tr ng-if="OrgDatas.length < 1">
							<td class="emptyrow" colspan="5">no data found</td>
						</tr>
					</tbody>
				</table>
        </div>	
			</div>
			<div class="col-md-12 table-responsive border-box-table  padding0" ng-hide="showActiveORG" >
				<table class="listTable table table-striped table-hover">
					<thead>
						<th class="checkbox" style="text-indent: 0% !important; width: 30px;">
							<input id="checkboxall" type="checkbox" ng-model="isAllSelected" ng-click="toggleAll(isAllSelected)"/>
							<label for="checkboxall"></label>
						</th>
												
						<th>
							<span ng-hide="advSpan"><%=lblOrg.get("ORG").get("NAME")%></span>
							<a class="advOptn white cursor" ng-show="advSpan" data-toggle="modal" data-target="#reActivateORG">
								re-activate
							</a>							
						</th>
						<th style="text-indent: 0%"><span ng-hide="advSpan"><%=lblOrg.get("ORG").get("DESC")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrg.get("ORG").get("CREATED_BY")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrg.get("ORG").get("CREATE_DATE")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrg.get("ORG").get("STATUS")%></span></th>
						<!-- <th>flexy</th> -->
					</thead>

					<tbody>
						<tr class="cursor" ng-repeat="org in OrgDeletedData">
							<td class="checkbox" style="text-indent: 0% !important;">								
								<input id="checkVal_{{$index}}" type="checkbox" ng-model="org.check_bx" ng-change="optionToggled()"/>
								<label for="checkVal_{{$index}}"></label>
								
							</td>						
							<td nowrap="nowrap" >{{org.name}}</td>
							<td style="width:300px;text-indent: 0%">
							<span>{{org.desc.substr(0, 100)}}</span>
							<span ng-show="org.desc.length>100">...</span>
							</td>
							<td >{{org.userName}}</td>
							<!-- <td>{{customDateFormat(org.dateCreated) | date:'yyyy-MM-dd HH:mm'}}</td> -->
							<td>{{customDateFormat(org.dateCreated)}}</td>
							<td>Deleted</td>
							<!-- <td ng-click="gotoFlexcy(org)"><i class="fa fa-globe" data-toggle="tooltip" title="Flexy Change"></i></td> -->
						</tr>
						<tr ng-if="OrgDeletedData.length < 1">
							<td class="emptyrow" colspan="5">no data found</td>
						</tr>
					</tbody>
				</table>
			</div>	
		</div>
		</div>

		<!-- CREATE ORGANISATION MODAL -->
			<div id="createOrg" class="modal fade popUpId" role="dialog" ng-click="checkMinLen(newOrgUserName)">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="clearAllData()"></i>
			    	<h1 class="pageH1 pColor"><%=lblOrg.get("ORG").get("ADD_ORG")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrg.get("ORG").get("ADD_NAME")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<input ng-model="newOrgName">	
			    			<i class="fa fa-close errClose" ng-show="formValidate && !newOrgName"></i>			    			
			    		</div>	
			    		
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrg.get("ORG").get("RUSER_NAME")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<input ng-model="newOrgUserName" id="rootUserNameId" onkeyup="return allowOnlyChars()">	
			    			<i class="fa fa-close errClose" ng-show="formValidate && !newOrgUserName"></i>
			    			<span ng-show="minLenError && newOrgUserName.length<5" style="color:red; font-size: 12px;"><br>Value is too short. Min length is 5 characters</span>			    			
			    		</div>	
			    		
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrg.get("ORG").get("ADD_EMAIL")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<input ng-model="newOrgEmail" ng-click="checkMinLen(newOrgUserName)">	
			    			<i class="fa fa-close errClose" ng-show="formValidate && !newOrgEmail"></i>			    			
			    		</div>	
			    		
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrg.get("ORG").get("ADD_DESC")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<textarea ng-model="newOrgDetails"></textarea>
			    			<i class="fa fa-close errClose" ng-show="formValidate && !newOrgDetails"></i>
			    		</div>	
			    		
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrg.get("ORG").get("PUBLICKEY")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<textarea ng-model="publickey"></textarea>
			    			<div style="text-align: right; padding-top: 5px;"><a ng-href="keys" target="_blank" ><%=lblOrg.get("ORG").get("GEN_KEYS")%></a></div>
			    			<!--<i class="fa fa-close errClose" ng-show="formValidate && !publickey"></i> -->
			    			<!-- <i class="fa fa-close errClose"></i> -->
			    		</div>
			    		<div class="col-sm-1">
			    			
			    			<!-- <a ng-href="keys" target="_blank" ><i class="fa fa-key pColor keyAddOrg"></i></a> -->
			    		</div>	
			    		
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrg.get("ORG").get("TICKET_ID")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<input ng-model="newOrgTicketId">
			    			<!-- <i class="fa fa-close errClose" ng-show="formValidate && !newOrgTicketId"></i>	 -->		    			
			    		</div>	
			    		
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrg.get("ORG").get("CREATE_GROUP")%></label>
			    		</div>	
			    		<%-- <div class="formInput formSelect col-sm-8">
			    				<select ng-model="tempGroupName">
			    					<option  value=0></option>
			    					<option ng-repeat="grp in microDataPred" value="{{grp.id}}" ng-disabled="disableGrp(grp.id)">{{grp.name}}</option>
			    				</select>
			    				
			    				<ul ng-show="consumerGroup || provideGroup" class="selectdPoLst list-unstyled margin0">
			    				<li  ng-show="consumerGroup" class="cursor" >
			    					<img src="resources/org/images/group_list.png">
			    					<%=lblOrg.get("ORG").get("OPTION_CONSUMER")%>
			    					<i class="fa fa-close pull-right" ng-click="setRemoveGroup('Data Consumer')"></i>
			    				</li>
			    				<li  ng-show="provideGroup" class="cursor" >
			    					<img src="resources/org/images/group_list.png">
			    					<%=lblOrg.get("ORG").get("OPTION_PROVIDER")%>
			    					<i class="fa fa-close pull-right" ng-click="setRemoveGroup('Data Producer')"></i>
			    				</li>
			    			</ul> 		
			    		</div> --%>
			    		
			    		<div class="formInput formSelect col-sm-8">
		    				<select ng-model="tempGroupName">
		    					<!-- <option  value=0></option> -->
		    					<option ng-repeat="grp in microDataPred" value="{{grp.id}}" ng-disabled="disableGrp(grp.id)">{{grp.name}}</option>
		    				</select>
		    				<ul class="selectdPoLst list-unstyled margin0">
			    				
			    				<li  ng-repeat="predef in predefinedGroups"  >
			    					<img src="resources/org/images/group_list.png">
			    					{{predef.groupName}}
			    					<i class="fa fa-close pull-right" ng-click="setRemoveGroup(predef.groupId)"></i>
			    				</li>
		    				</ul> 		
			    		</div>
			    			
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="updatePreDifGroup()"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label>Functions</label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-8">
			    			<select ng-model="grpFunctn" ng-change="selectallFun()">
				    			<option value="all" style="font-weight: bold;" ng-hide="selectall">Select all</option>
		    					<option value="uall" style="font-weight: bold;" ng-show="selectall">Deselect all</option>
			    				<option ng-repeat="fun in functionDatas" ng-hide="disableRepeat(fun.functionId)" value="{{fun.functionId}}"> {{fun.name}}</option>	
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li class="cursor" ng-repeat="val in tempGroupData">
			    					<img src="resources/org/images/function_list.png">
			    					{{val.name}}
			    					<i class="fa fa-close pull-right" ng-click="removeGroupInd($index)"></i>
			    				</li>
			    			</ul>
			    			
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="createGrou(grpFunctn)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>			    	
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			
			    		</div>	
			    		<div class="formInput col-sm-8">
			    		<!-- 	<div ng-show="formValidate">
				    			<label class="marginTop10 error_css" ng-hide="newOrgName">
				    				Please enter the name
				    			</label>
				    			
				    			<label class="marginTop10 error_css" ng-hide="newOrgDetails">
				    				Please fill the organisation description
				    			</label>
			    			</div>	 -->
			    			<label class="marginTop10 error_css" ng-if="errorShow">
			    				<%=errOrg.get("ORG_ERR").get("ADD_EXISTS")%>
			    			</label>
			    			<label class="marginTop10 success_css" ng-if="sucsMsg">
			    				{{successMsg}}
			    			</label>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
					
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9" style="text-align:right;">
			    			<button class="btn btn-default uButton" data-dismiss="modal" ng-click="clearAllData()"><%=lblOrg.get("ORG").get("CANCEL")%></button>
			    			<button class="pButton marginLeft10" ng-click="addOrg()"><%=lblOrg.get("ORG").get("CREATE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    </div>

			  </div>
			</div>
			<br/><br/>
												<!-- RE ACTIVATE USER LIST MODAL -->
			<div id="reActivateORG" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1">Re-activate Confirmation</h1>
			    		
			    		<p>are you want to re-activate the selected Organisation(s)?</p>
			    		
			    		<div class="formInput col-sm-12" >
			    			<button class="pull-right pButton marginLeft10" ng-click="activateORG()">Yes</button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal">No</button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>
			</div>

		<!-- END CREATE ORGANISATION MODAL -->
<%@include file="footer.jsp"%>
<script src="resources/org/controller/add_org_controller.js"></script>

<script>
	$(function(){
		$('#orgz').addClass('active');
	});	

	function allowOnlyChars(){
        var input   = document.getElementById('rootUserNameId');
        input.value = input.value.replace(/[^0-9A-Za-z]/,'');
	}

			
</script>