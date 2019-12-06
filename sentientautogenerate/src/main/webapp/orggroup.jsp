<%@ page session="true" %>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>
<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> lblOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_DE"));
Map<String, Map<String, String>> lblOrgGrp = ((Map<String, Map<String, String>>) session.getAttribute("ORG_GRP"));
Map<String, Map<String, String>> errOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_ERR"));

String LIST_PREDEFINED_GROUP = APIUtil.LIST_PREDEFINED_GROUP;

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

<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/css/mob-res.css">
<link rel="stylesheet" href="resources/css/style.css">

<script type="text/javascript">
var LIST_PREDEFINED_GROUP = "<%=LIST_PREDEFINED_GROUP%>";
</script>

<div class="wrapper" ng-controller="gropus" ng-cloak>
<%@include file="header.jsp"%>
	<!-- <div class="loadr" ng-if="loader"></div> -->
	<div class="loading-container" ng-if="loader">
			<div class="loading">
			  <!-- <span>Loading...</span> -->
			</div>
		  </div>
			<div class="container-fluid container-fluid-BG pageTBMargin49">
					<div class="paddingLR30 paddingTopBtm30">
							<div class="row leftPadding40">
									<div class="padding0">
							<h3 class="orgTitle"><%=lblOrg.get("ORG_DE").get("TITLE")%></h3>
							<div class="pad-15">
					<ul class="list-unstyled ul_orgDets form-margin">
							<li>
									<label class="col-sm-2 "><%=lblOrg.get("ORG_DE").get("NAME")%></label>	
									<div class="col-sm-4">	
										<p class="wordWrpa" ng-hide="editOrg2">{{orgDetails.name}}<span ng-show="!orgDetails.name.length">N/A</span></p>
										<div class="formInput" ng-show="editOrg2">
											<input type="text" ng-model="orgDetails.name" readonly="true">
										</div>
									</div>
								</li>
						
								<li>
										<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("STATUS")%></label>	
										<div class="col-sm-4" >		
											<p class="wordWrpa" ng-hide="editOrg2">{{orgDetails.desc}}<span ng-show="!orgDetails.desc.length">N/A</span></p>
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
						<div class="box bgWhite">
						<div class="orgnztnMenu marginTop10">
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
						<!-- <li ng-if="uAccess.ORG_GETORGROLELIST"><a href="orgrole"><%=lblOrg.get("ORG_DE").get("ROLES")%></a></li> -->
						<li ng-if="uAccess.ORG_GETORGGROUPLIST" class="active"><a href="orggroup"><%=lblOrg.get("ORG_DE").get("GROUP")%></a></li>
						<%-- <li ng-if="uAccess.ORG_GETORGGROUPLIST" class="active" ng-show="groupDetails"><a ng-click="groupDetails = false"><%=lblOrg.get("ORG_DE").get("GROUP")%></a></li> --%>
						<!-- <li ng-if="uAccess.ORG_GETORGTAGSLIST"><a href="orgtags"><%=lblOrg.get("ORG_DE").get("TAGS")%></a></li> -->
						<%
						if (loginOrgId2 == 1){
							%>
							<li><a href="dasetting"><%=lblOrg.get("ORG_DE").get("DA_SETTINGS")%></a></li>
							<%
						}
						%>
					</ul>	
				</div>
					
			

			<div class="container-fluid marginMinus" ng-hide="groupDetails">
				<button ng-if="uAccess.ORG_GETORGGROUPLIST && uAccess.ORG_UPDATEORGGROUP" class="pButton" data-toggle="modal" data-target="#createGroup" ng-click="loadFunctionDropdown()"><%=lblOrgGrp.get("ORG_GRP").get("ADD_GRP")%></button>
				<button ng-if="uAccess.ORG_GETORGGROUPLIST && uAccess.ORG_UPDATEORGGROUP && isSuperAdmin" class="pButton" data-toggle="modal" data-target="#assignPreDefinedGroupPopUp" >Add Predefined Group</button>
					<div class="clearfix"></div>
					<div class="marginTop20 table-responsive border-box-table padding0">
				<table class="listTable  table table-striped table-hover" ng-if="uAccess.ORG_GETORGGROUPLIST">
					<thead>
						<th class="width80 checkbox">
							<input id="checkboxall" type="checkbox" ng-model="isAllSelected" ng-click="toggleAll(isAllSelected)"/>
							<label for="checkboxall"></label>
						</th>
						<th>
							<span ng-hide="advSpan"><%=lblOrgGrp.get("ORG_GRP").get("NAME")%></span>
							<a ng-if="uAccess.ORG_DELETEGROUP"  class="advOptn white cursor" ng-show="advSpan" data-toggle="modal" data-target="#deleUssr">
								<%=lblOrgGrp.get("ORG_GRP").get("DELETE")%>
							</a>
						</th>
						<th><span ng-hide="advSpan"><%=lblOrgGrp.get("ORG_GRP").get("DESC")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrgGrp.get("ORG_GRP").get("USERS")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrgGrp.get("ORG_GRP").get("CREATEDBY")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrgGrp.get("ORG_GRP").get("CREATEDDATE")%></span></th>
					</thead>

					<tbody>
						<tr ng-repeat="grp in groupDatas" class="cursor">
							<td class="width80 checkbox">
								<input id="checkabx_{{$index}}" type="checkbox" ng-model="grp.check_bx" ng-change="optionToggled();"/>
								<label for="checkabx_{{$index}}"></label>
							</td>
							<td nowrap="nowrap" ng-click="getGroupDets(grp)">{{grp.grpName}}</td>
							<td style="width:300px;text-indent: 0%" ng-click="getGroupDets(grp)">
							{{grp.grpDesc.substr(0, 100)}}
							<span ng-show="grp.grpDesc.length>100">...</span>
							</td>
							<td ng-click="getGroupDets(grp)">{{grp.users}}</td>
							<td ng-click="getGroupDets(grp)">{{grp.creadedBy}}</td>
							<td ng-click="getGroupDets(grp)">{{customDateFormat(grp.dateCreated)}}</td>
						</tr>
						<tr ng-if="groupDatas.length < 1">
							<td class="emptyrow" colspan="6">no data found</td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
			
			<div class="container-fluid tmenu_Body" ng-show="groupDetails">
				<h4 class="pageH1 marginLeft20"><%=lblOrgGrp.get("ORG_GRP").get("GRP_TITLE")%></h4>
					<ul class="list-unstyled ul_orgDets paddingLeft10">
						<li>
							<label class="col-sm-2 textRight"><%=lblOrgGrp.get("ORG_GRP").get("GRP_NAME")%></label>		
							<span class="col-sm-4">{{groupDa.groupName}}</span>
						</li>	
						<li>
							<label class="col-sm-2 textRight"><%=lblOrgGrp.get("ORG_GRP").get("GRP_DESC")%></label>		
							<span class="col-sm-4">{{groupDa.groupDesc}}</span>
						</li>	
					</ul>
				<div class="clearfix"></div>	

				<div class="dets_Tab_main marginTop20">
					<ul class="list-unstyled tabsoF_details margin0">
						<li ng-class="(tabsGrp == 'group_function')?'active':''"><a ng-click="tabsGrp = 'group_function'"><%=lblOrgGrp.get("ORG_GRP").get("GRP_FUN")%></a></li>
						<li ng-class="(tabsGrp == 'group_user')?'active':''"><a ng-click="tabsGrp = 'group_user'"><%=lblOrgGrp.get("ORG_GRP").get("GRP_USRFUN")%></a></li>
					</ul>

					<div class="clearfix"></div>

					<div class="tabz_Contnt" ng-init="tabsGrp = 'group_function'">
						<div ng-show="tabsGrp == 'group_function'">
								<button class="sButton marginRight10" data-toggle="modal" data-target="#groupFn" ng-click="loadGroupFunction()"><%=lblOrgGrp.get("ORG_GRP").get("GRP_ADDFUN")%></button>
								<strong><%=lblOrgGrp.get("ORG_GRP").get("GRP_ATTACHFUN")%> : {{groupDa.gFunction.length}}</strong>
									<div class="clearfix"></div>
							
								<div  class="listOf_tabsLis marginTop20">
									<ul class="list-unstyled">
										<li ng-repeat="fn in groupDa.gFunction">
											<img src="resources/org/images/function_list.png"/> 
											<span>{{fn.value}}</span>
											<i ng-if="uAccess.ORG_REMOVEFUNCTIONFROMGROUP"  class="fa fa-close pull-right cursor delePopId" data-toggle="modal" data-target="#deleteRolFn" data-id="{{fn.id}}"></i>
										</li>
									</ul>
								</div>
						</div>
						<div ng-show="tabsGrp == 'group_user'">
							<div class="listOf_tabsLis marginTop20">
								<ul class="list-unstyled">
									<li ng-repeat="fn in groupDa.users | unique: 'value'" class="userTabz">
										<i class="fa fa-user groupUser"></i>
										<span>{{fn.value}}</span>
									</li>
								</ul>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>	

				</div>	
			</div>



			<div id="assignPreDefinedGroupPopUp" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <form class="modal-content" name="groupForm" novalidate>
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="cancelGrou();formValidate = false"></i>
			    	<h1 class="pageH1 pColor">Select Predefined Groups </h1>
			    	
			    	<div class="clearfix"></div>



			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label>Group Name</label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-8 padding0">
			    			<select ng-model="selectedPredefinedGroupId" style="cursor:pointer">
			    				<option ng-repeat="pdGroup in ownerPredefinedGroups" value="{{pdGroup.id}}"> {{pdGroup.name}}</option>	
			    			</select>	
			    		</div>	

			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formInput  col-sm-offset-3 col-sm-9">    		
			    			<label class="marginTop10 error_css" ng-if="errorShow">{{errMessage}}</label>
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
			    		<div class="formInput  col-sm-offset-5 col-sm-8" align="center">
			    			<button class="btn btn_cancel btn-default uButton" data-dismiss="modal"><%=lblOrgGrp.get("ORG_GRP").get("GRP_CANCEL")%></button>
			    			<button class="btn btn_save btn-successcustom pButton marginLeft10" ng-click="addPredefinedGroup()">Add</button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </form>

			  </div>
			</div>
			
</div>
		</div>
		</div>
	</div>
</div>
		<!--CREATE USER MODAL -->
			<div id="createGroup" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <form class="modal-content" name="groupForm" novalidate>
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="cancelGrou();formValidate = false"></i>
			    	<h1 class="pageH1 pColor"><%=lblOrgGrp.get("ORG_GRP").get("GRP_ADDGRP")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrgGrp.get("ORG_GRP").get("GRP_NAME")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8 padding0">
			    			<input ng-model="orgGroupName" name="groupName" required>
			    			<i class="fa fa-close errClose" ng-show="formValidate && !orgGroupName"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrgGrp.get("ORG_GRP").get("GRP_DESC")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8 padding0">
			    			<textarea ng-model="descrpition" name="groupDesc" required></textarea>
			    			<i class="fa fa-close errClose" ng-show="formValidate && !descrpition"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrgGrp.get("ORG_GRP").get("GRP_FUNCTION")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-8 padding0">
			    			<select ng-model="grpFunctn" style="cursor:pointer">
			    				<option ng-repeat="fun in functionDatas" value="{{fun.functionId}}"> {{fun.name}}</option>	
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
			    		<div class="formInput  col-sm-offset-3 col-sm-9">
			    			<!-- <div ng-show="formValidate">
				    			<label class="marginTop10 error_css" ng-hide="orgGroupName">
				    				Please enter the name
				    			</label>
				    			
				    			<label class="marginTop10 error_css" ng-hide="descrpition">
				    				Please fill the group description
				    			</label>
			    			</div> -->
			    		
			    			<label class="marginTop10 error_css" ng-if="errorShow">{{errMessage}}</label>
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
			    		<div class="formInput  col-sm-offset-5 col-sm-8" align="center">
			    			<button class="btn btn_cancel btn-default uButton" data-dismiss="modal" ng-click="cancelGrou();formValidate = false"><%=lblOrgGrp.get("ORG_GRP").get("GRP_CANCEL")%></button>
			    			<button class="btn btn_save btn-successcustom pButton marginLeft10" ng-click="addGroup()"><%=lblOrgGrp.get("ORG_GRP").get("GRP_CREATE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </form>

			  </div>
			</div>
			<!--END CREATE USER MODAL -->
			
					<!--GROUP FUNCTION MODAL -->
			<div id="groupFn" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectedFninGroup = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblOrgGrp.get("ORG_GRP").get("GRP_ADD_FUN")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblOrgGrp.get("ORG_GRP").get("GRP_SELECT")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectedFninGroup">
			    				<option ng-repeat="val in functioninGroup" value="{{val.functionId}}" ng-disabled="disableFunc(val.name)"> {{val.name}}</option>	
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="fn in groupDa.gFunction">
									<img src="resources/org/images/function_list.png"/> 
									<span>{{fn.value}}</span>
								</li>
			    			</ul>
			    		</div>	
			    		<div ng-if="uAccess.ORG_ADDFUNCTIONTOGROUP"  class="col-sm-1">
			    			<button class="uButton" ng-click="addFntoGroup(selectedFninGroup)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="btn btn_save btn-successcustom pull-right pButton" ng-click="selectedFninGroup = ''" data-dismiss="modal"><%=lblOrgGrp.get("ORG_GRP").get("GRP_CLOSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>

		<!-- END ADD GROUP MODAL -->
		
				
					<!-- DELETE ROLE MODAL -->
		<div id="deleteRolFn" class="modal fade popUpId" role="dialog">
		  	<div class="modal-dialog">			  	
		    <!-- Modal content-->
		    	<div class="modal-content">
		    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
		    		<h1 class="pageH1">Delete Confirmation</h1>
			    		
			    		<p>Do you want to delete the selected data?</p>
		    		<div class="formInput col-sm-12">
		    			<button class=" pull-right pButton marginLeft10" ng-click="removeFninGroup(deleteMe)">Yes</button>
		    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgGrp.get("ORG_GRP").get("GRP_CANCEL")%></button>
		    		</div>	
		    		<div class="clearfix"></div>
				</div>
			</div>
		</div>
			
		
										<!-- DELETE GROUP FUNCTION -->
			<div id="deleOrgnzt" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1">Delete Confirmation</h1>			    		
			    		<p>Do you want to delete the selected data?</p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleteOrg()">Yes</button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgGrp.get("ORG_GRP").get("GRP_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>
			
			
													<!-- DELETE GROUP LIST-->
			<div id="deleUssr" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1">Delete Confirmation</h1>
			    		
			    		<p>Do you want to delete the selected data?</p>
			    		<div class="formInput col-sm-12">
			    			<button class="btn btn btn_save btn-successcustom pull-right pButton marginLeft10" ng-click="deleteGroup()">Yes</button>
			    			<button class="btn btn_cancel btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgGrp.get("ORG_GRP").get("GRP_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>		
				
			



<%@include file="footer.jsp"%>
<script src="resources/org/controller/org_group_controller.js"></script>
		<script>
			$(function(){
				$('#orgz').addClass('active');
			});			
		</script>