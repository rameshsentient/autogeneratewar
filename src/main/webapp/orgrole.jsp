<%@ page session="true" %>
<%@page import="java.util.Map"%>

<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> lblOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_DE"));
Map<String, Map<String, String>> lblOrgRol = ((Map<String, Map<String, String>>) session.getAttribute("ORG_ROL"));
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

.btn-successcustom {
    background-color: #96CA4E;
    border-color: #96CA4E;
}

</style>
<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">

<div class="wrapper " ng-controller="roles" ng-cloak>
<%@include file="header.jsp"%>
	<!-- <div class="loadr" ng-if="loader"></div> -->
	<div class="loading-container" ng-if="loader">
			<div class="loading">
			  <span>Loading...</span>
			</div>
		  </div>
			<div class="container-fluid paddingLR30 pageTBMargin80 box paddingTop0 padding0 paddingbtm">
					<div class="">
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
						<!-- <i ng-if="orgDetails.orgType == 'child' && uAccess.ORG_DELETEORG" class="fa fa-trash sColor delOrgz" data-toggle="modal" data-target="#deleOrgnzt"></i>
						<i ng-if="uAccess.ORG_UPDATEORGINFO" class="fa fa-pencil colorAAA editOrgz" ng-click="setOrgEditMode()" ng-hide="editOrg2"></i>
						<i class="fa fa-check pColor editOrgz"  ng-click="updateOrgz()" ng-show="editOrg2"></i> -->
					</ul>	
</div>
					<div class="clearfix"></div>
					</div>			
		
			
			
				<div class="container-fluid">
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
						<li ng-if="uAccess.ORG_GETORGROLELIST" class="active"><a href="orgrole"><%=lblOrg.get("ORG_DE").get("ROLES")%></a></li>
						<%-- <li ng-if="uAccess.ORG_GETORGROLELIST" class="active" ng-show="roleDetails"><a ng-click="roleDetails = false"><%=lblOrg.get("ORG_DE").get("ROLES")%></a></li> --%>
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

			<div class="container-fluid marginMinus" ng-hide="roleDetails">
				<button ng-if="uAccess.ORG_GETORGROLELIST && uAccess.ORG_UPDATEORGROLE" class="pButton" data-toggle="modal" data-target="#createRole" ng-click="loadFunctionDropdown()"><%=lblOrgRol.get("ORG_ROL").get("ADD_ROL")%></button>
					<div class="clearfix"></div>
					<div class="table-responsive border-box-table marginTop20 padding0">
				<table class="listTable table table-striped table-hover" ng-if="uAccess.ORG_GETORGROLELIST">
					<thead>
						<th class="width80 checkbox">
							<input id="checkall_{{$index}}" type="checkbox" ng-model="isAllSelected" ng-click="toggleAll(isAllSelected)"/>
							<label for="checkall_{{$index}}"></label>
						</th>
						<th>
							<span ng-hide="advSpan"><%=lblOrgRol.get("ORG_ROL").get("NAME")%></span>
							<a ng-if="uAccess.ORG_DELETEROLE" class="advOptn white cursor" ng-show="advSpan" data-toggle="modal" data-target="#deleUssr">
								<%=lblOrgRol.get("ORG_ROL").get("DELETE")%>
							</a>	
							<!-- <a style="margin-left: 12px;" class="advOptn white cursor" ng-show="advEditSpan" ng-click="editRole()">
								edit
							</a> -->
						</th>
						<th>
							<span ng-hide="advSpan"><%=lblOrgRol.get("ORG_ROL").get("DESC")%></span>
						</th>
						<th><span ng-hide="advSpan"><%=lblOrgRol.get("ORG_ROL").get("USERS")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrgRol.get("ORG_ROL").get("CREATEDBY")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrgRol.get("ORG_ROL").get("CREATEDDATE")%></span></th>
					</thead>

					<tbody>
						<tr ng-repeat="role in roleDatas" class="cursor">
							<td class="width80 checkbox">
								<input id="checkbxl_{{$index}}" type="checkbox" ng-model="role.check_bx" ng-change="optionToggled();"/>
								<label for="checkbxl_{{$index}}"></label>
							</td>
							<td nowrap="nowrap" ng-click="getRoleDets(role)">{{role.roleName}}</td>
							<td style="width:300px;text-indent: 0%" ng-click="getRoleDets(role)">
							{{role.roleDesc.substr(0, 100)}}
							<span ng-show="role.roleDesc.length>100">...</span>
							</td>
							<td ng-click="getRoleDets(role)">{{role.users}}</td>
							<td ng-click="getRoleDets(role)">{{role.createdBy}}</td>
							<td ng-click="getRoleDets(role)">{{customDateFormat(role.dateCreated)}}</td>
						</tr>
						<tr ng-if="roleDatas.length < 1">
							<td class="emptyrow" colspan="6">no data found</td>
						</tr>
					</tbody>
				</table>		
				</div>
			</div>
			
			<div class="container-fluid tmenu_Body" ng-show="roleDetails">
				<h4 class="pageH1  paddingLeft10"><%=lblOrgRol.get("ORG_ROL").get("ROL_TITLE")%></h4>
					<ul class="list-unstyled ul_orgDets">
						<li>
							<label class="col-sm-2 textRight"><%=lblOrgRol.get("ORG_ROL").get("ROL_NAME")%></label>		
							<span class="col-sm-4">{{roleFuncts.roleName}}</span>
						</li>	
						<li>
							<label class="col-sm-2 textRight"><%=lblOrgRol.get("ORG_ROL").get("ROL_DESC")%></label>		
							<span class="col-sm-4">{{roleFuncts.roleDesc}}</span>
						</li>	
					</ul>
				<div class="clearfix"></div>	

				<div class="dets_Tab_main marginTop20">
					<ul class="list-unstyled tabsoF_details margin0">
						<li ng-class="(tabsRole == 'role_function')?'active':''"><a ng-click="tabsRole = 'role_function'"><%=lblOrgRol.get("ORG_ROL").get("ROL_FUN")%></a></li>
						<li ng-class="(tabsRole == 'role_user')?'active':''"><a ng-click="tabsRole = 'role_user'"><%=lblOrgRol.get("ORG_ROL").get("ROL_USRFUN")%></a></li>
					</ul>

					<div class="clearfix"></div>

					<div class="tabz_Contnt" ng-init="tabsRole = 'role_function'">
						<div ng-show="tabsRole == 'role_function'">
							<button class="sButton marginRight10" data-toggle="modal" data-target="#groupFn" ng-click="cancelRole()"><%=lblOrgRol.get("ORG_ROL").get("ROL_ADDFUN")%></button>
							<strong><%=lblOrgRol.get("ORG_ROL").get("ROL_ATTACHFUN")%> : {{roleFuncts.rFunction.length}}</strong>
								<div class="clearfix"></div>
						
							<div class="listOf_tabsLis marginTop20">
								<ul class="list-unstyled">
									<li ng-repeat="rol in roleFuncts.rFunction">
										<img src="resources/org/images/function_list.png"/> 
										<span>{{rol.value}}</span>
										<i class="fa fa-close pull-right cursor delePopId" data-toggle="modal" data-target="#deleteRolFn" data-id="{{rol.id}}"></i>
									</li>
								</ul>
							</div>
						</div>
						
						<div ng-show="tabsRole == 'role_user'">
							<div class="listOf_tabsLis marginTop20">
								<ul class="list-unstyled">
									<li ng-repeat="value in roleFuncts.users | unique: 'value'" class="userTabz"> 
										<i class="fa fa-user groupUser"></i>
										<span>{{value.value}}</span>
									</li>
								</ul>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>	

				</div>	
			</div>
		

		<!--CREATE USER MODAL -->
			<div id="createRole" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <form class="modal-content" name="roleForm" novalidate>
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="cancelRole()"></i>
			    	<h1 class="pageH1 pColor"><%=lblOrgRol.get("ORG_ROL").get("ADD_ROL")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrgRol.get("ORG_ROL").get("ROL_NAME")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8 padding0">
			    			<input ng-model="id" type="hidden">
			    			<input ng-model="orgRoleName" name="roleName" ng-readonly="id > 0" required>
			    			<i class="fa fa-close errClose" ng-show="formValidate && !orgRoleName"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrgRol.get("ORG_ROL").get("ROL_DESC")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8 padding0">
			    			<textarea ng-model="roleDescrptn" name="roleDesc" required></textarea>
			    			<i class="fa fa-close errClose" ng-show="formValidate && !roleDescrptn"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20" ng-hide="id > 0">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrgRol.get("ORG_ROL").get("ROL_FUNCTION")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-8 padding0">
			    			<select ng-model="funcModel" style="cursor:pointer">
			    				<option ng-repeat="fun in functionDatas" style="cursor:pointer" value="{{fun.functionId}}"> {{fun.name}}</option>	
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="val in tempFunRole"> 
			    					<img src="resources/org/images/function_list.png">
			    					{{val.name}}
			    					<i class="fa fa-close pull-right" ng-click="removeFInd($index)"></i>
			    				</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addFunctn(funcModel)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
			
					<div class="formGroups marginTop20">
			    		<div class="formInput  col-sm-offset-3 col-sm-9">
			    			<!-- <div ng-show="formValidate">
				    			<label class="marginTop10 error_css" ng-hide="orgRoleName">
				    				Please enter the name
				    			</label>
				    			
				    			<label class="marginTop10 error_css" ng-hide="roleDescrptn">
				    				Please fill the role description
				    			</label>
			    			</div> -->
			    			<label class="marginTop10 error_css" ng-if="errorShow">{{errMessage}}</label>
			    			<label class="marginTop10 success_css" ng-if="sucsMsg">{{successMsg}}</label>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
						    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput  col-sm-offset-5 col-sm-8" align="center">
			    			<button class="btn btn_cancel btn-default uButton" data-dismiss="modal" ng-click="cancelRole()"><%=lblOrgRol.get("ORG_ROL").get("ROL_CANCEL")%></button>
			    			<button ng-hide="id > 0" class="btn btn-successcustom pButton marginLeft10" ng-click="addRole()"><%=lblOrgRol.get("ORG_ROL").get("ROL_CREATE")%></button>
			    			<button ng-show="id > 0" class="pButton marginLeft10" ng-disabled="roleForm.$invalid" ng-click="updateRole()">Update</button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </form>

			  </div>
			</div>
			
				<!-- ROLE FUNCTION MODAL -->
			<div id="groupFn" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectedFninRole = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblOrgRol.get("ORG_ROL").get("ROL_ADD_FUN")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblOrgRol.get("ORG_ROL").get("ROL_SELECT")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectedFninRole">
			    				<option ng-repeat="val in functioninRole" value="{{val.functionId}}" ng-disabled="disableFunc(val.name)"> {{val.name}}</option>
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="rol in roleFuncts.rFunction">
									<img src="resources/org/images/function_list.png"/> 
									<span>{{rol.value}}</span>								
								</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addfntoRole(selectedFninRole)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="btn btn_save btn-successcustom pull-right pButton" ng-click="selectedFninRole = ''" data-dismiss="modal"><%=lblOrgRol.get("ORG_ROL").get("ROL_CLOSE")%></button>
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
			    		
			    		<p>are you want to delete the selected data?</p>
		    		<div class="formInput col-sm-12">
		    			<button class=" pull-right pButton marginLeft10" ng-click="removeFninRole(deleteMe)">Yes</button>
		    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgRol.get("ORG_ROL").get("ROL_CANCEL")%></button>
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
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgRol.get("ORG_ROL").get("ROL_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
					
												<!-- DELETE ROLE LIST -->
			<div id="deleUssr" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1">Delete Confirmation</h1>
			    		
			    		<p>are you want to delete the selected data?</p>
			    		<div class="formInput col-sm-12">
			    			<button class="btn btn btn_save btn-successcustom pull-right pButton marginLeft10" ng-click="deleteRole()">Yes</button>
			    			<button class="btn btn_cancel btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgRol.get("ORG_ROL").get("ROL_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
		</div>	
</div>
<%@include file="footer.jsp"%>
<script src="resources/org/controller/org_role_controller.js"></script>

		<script>
			$(function(){
				$('#orgz').addClass('active');
			});			
		</script>