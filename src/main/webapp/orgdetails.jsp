<%@ page session="true" %>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>
<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> lblOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_DE"));
Map<String, Map<String, String>> lblOrgUsr = ((Map<String, Map<String, String>>) session.getAttribute("ORG_USR"));
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
String ACTIVATE_USER_URL = APIUtil.ACTIVATE_USER_URL;
String RESET_PASSWORD_EMAIL = APIUtil.RESET_PASSWORD_EMAIL;
String CHANGE_PASSWORD_URL = APIUtil.CHANGE_PASSWORD_URL;

%>
<style>

.radio-align{
	text-align: left;
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
/* .editOrgz{

	background-color: #96CA4E!important;
    border-color: white!important;
} */

.delOrgz{
	position: absolute;
	right: 85px!important;
    top: 0px;
    cursor: pointer;
}


.marginLeft15{
	margin-left:15px;
}
.container-radio {
    display: block;
    position: relative;
    padding-left: 23px;
    margin-bottom: 12px;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }

.delSelectedUser.active{
	background: #d41f26!important;
	color:white;
	border:1px solid #d41f26!important;
	cursor: pointer;
}
.active-list{
	color: #95b70a!important;
    border: none;
    background:none;
}

</style>
<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
 <link rel="stylesheet" href="resources/css/mob-res.css">
 <link rel="stylesheet" href="resources/css/style.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">

<script type="text/javascript">
var ACTIVATE_USER_URL = "<%=ACTIVATE_USER_URL%>";
var RESET_PASSWORD_EMAIL = "<%=RESET_PASSWORD_EMAIL%>";
var CHANGE_PASSWORD_URL = "<%=CHANGE_PASSWORD_URL%>";
</script>
		<div class="wrapper" ng-controller="listUser" ng-cloak>
		<%@include file="header.jsp"%>
			<!-- <div class="loadr" ng-if="loader"></div>	 -->
			<div class="loading-container" ng-if="loader">
					<div class="loading">
					  <!-- <span>Loading...</span> -->
					</div>
				  </div>

			<div class="container-fluid container-fluid-BG pageTBMargin49">
				<div class="paddingLR30 paddingTopBtm30">
				<div class="row leftPadding40">
				<h3 class="orgTitle marginBottom0"><%=lblOrg.get("ORG_DE").get("TITLE")%></h3>
					<div class="pad-15">
					<ul class="list-unstyled ul_orgDets form-margin">
						<li>
							<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("NAME")%></label>	
							<div class="col-sm-8">	
								<p class="wordWrpa" ng-hide="editOrg2">{{orgDetails.name}}<span class="padding0" ng-show="!orgDetails.name.length">N/A</span></p>
								<div class="formInput" ng-show="editOrg2">
									<input type="text" ng-model="orgDetails.name" readonly="true">
								</div>
							</div>
						</li>
						<li>
							<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("EMAIL")%></label>	
							<div class="col-sm-8">	
								<p class="wordWrpa" ng-hide="editOrg2">{{orgDetails.email}}<span class="padding0" ng-show="!orgDetails.email.length">N/A</span></p>
								<div class="formInput" ng-show="editOrg2">
									<input type="text" ng-model="orgDetails.email">
								</div>
							</div>
						</li>	
						<li>
							<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("STATUS")%></label>	
							<div class="col-sm-8" >		
								<p class="wordWrpa" ng-hide="editOrg2">{{orgDetails.desc}}<span class="padding0" ng-show="!orgDetails.desc.length">N/A</span></p>
								<div class="formInput" ng-show="editOrg2">
									<textarea ng-model="orgDetails.desc"></textarea>
								</div>
							</div>
						</li>
						<li>
							<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("PUBLIC_KEY")%></label>	
							<div class="col-sm-8" >		
								<p class="wordWrpa" ng-hide="editOrg2">{{orgDetails.publicKey}}<span class="padding0" ng-show="!orgDetails.publicKey.length">N/A</span></p>
								<div class="formInput" ng-show="editOrg2">
									<textarea ng-model="orgDetails.publicKey"></textarea>
									<div style="text-align: left; padding-top: 5px;  color:#2d9eff; text-decoration: underline;"><a ng-href="keys" target="_blank">Click here to generate key</a></div>
								</div>
							</div>
						</li>
						
						<li>
							<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("CLIENT_ID")%></label>	
							<div class="col-sm-8" >		
								<p class="wordWrpa">{{orgDetails.clientid}}<span class="padding0" ng-show="!orgDetails.clientid.length">N/A</span></p>
							</div>
						</li>
						
						<li>
							<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("ORG_API_KEY")%></label>	
							<div class="col-sm-8" >		
								<p class="wordWrpa">{{orgDetails.apikey}}<span class="padding0" ng-show="!orgDetails.apikey.length">N/A</span></p>
							</div>
						</li>
						<li ng-show="succesUpdat">
							<label class="marginTop10 success_css">Update Successfully !!</label>
						</li>
						<span class="sColor delOrgz " ng-if="orgDetails.orgType == 'child' && uAccess.ORG_DELETEORG && editOrg2" data-toggle="modal" data-target="#deleOrgnzt"><i  class="fa fa-trash " ></i>  <span style="font-size:14px">Delete</span></span>
						<span class="colorAAA editOrgz" ng-if="uAccess.ORG_UPDATEORGINFO"  ng-click="setOrgEditMode()" ng-hide="editOrg2" > <i  class="fa fa-pencil" style="font-size:16px;"></i>  <span style="font-size:14px">Edit</span></span>					
						<span class="editOrgz" style="background: #96CA4E;" ng-click="updateOrgz();" ng-show="editOrg2"> <i class="fa fa-check"  style="font-size:14px;" ></i> <span style="font-size:14px">Edit</span></span>
					
					</ul>	
				</div>		
					<div class="clearfix"></div>
			</div>	
		<div class="box bgWhite">
				<div class="respMarginTop">
					<div class="orgnztnMenu">
					<ul class="list-unstyled margin0">
						<li class="active" ng-if="uAccess.ORG_GETUSERLIST"><a href="orgdetails"><%=lblOrg.get("ORG_DE").get("USERS")%></a></li>
						<%-- <li class="active" ng-show="userDetails" ng-if="uAccess.ORG_GETUSERLIST"><a ng-click="userDetails = false"><%=lblOrg.get("ORG_DE").get("USERS")%></a></li> --%>
						<%
						if(orgTypeTemp.equals("main"))
						{
							%>
							<li ng-if="uAccess.ORG_GETORGASSIGNFUNCTIONS"><a href="orgFunctionList"><%=lblOrg.get("ORG_DE").get("FUNCTIONS")%></a></li>
							<%
						}
						%>
						<!-- <li ng-if="uAccess.ORG_GETORGROLELIST"><a href="orgrole"><%=lblOrg.get("ORG_DE").get("ROLES")%></a></li> -->
						<li ng-if="uAccess.ORG_GETORGGROUPLIST"><a href="orggroup"><%=lblOrg.get("ORG_DE").get("GROUP")%></a></li>
						<!-- <li ng-if="uAccess.ORG_GETORGTAGSLIST"><a href="orgtags"><%=lblOrg.get("ORG_DE").get("TAGS")%></a></li> -->
						<%
						if (loginOrgId2 == 1){
							%>
							<li ><a href="dasetting">DA SETTINGS</a></li>
							<%
						}
						%>
						
					</ul>	
				</div>
			</div>

			<div class="marginMinus20" ng-hide="userDetails">
					<div class="alignCenter" style="margin-top:55px;">
				<button ng-if="uAccess.ORG_GETUSERLIST && uAccess.ORG_UPDATEUSERINFO && !showDeletedList" class="aButton" data-toggle="modal" data-target="#createUser">
						<i class="fas fa-plus-circle"></i> <%=lblOrg.get("ORG_DE").get("ADD_USR_BTN")%>
				</button>
			<span style="padding-left:5px;"></span>
				<span>
					<button  class="dButton delSelectedUser active" ng-if="uAccess.ORG_DELETEUSER && advSpan && !showDeletedList" data-toggle="modal" data-target="#deleUssr">Delete Selected User</button>
					<button  class="dButton delSelectedUser" ng-if="uAccess.ORG_DELETEUSER && !advSpan && !showDeletedList">Delete Selected User</button>
					<button  class="dButton delSelectedUser active" ng-if="showDeletedList && advSpan" data-toggle="modal" data-target="#reActivateUssr">Re-activate</button>
					<button  class="deleted-list active-list" ng-show="showDeletedList" ng-click="showDeletedList=false;toggleAll(false)">Show Active User List</button>
				</span>
				<span class="deleted-list" ng-hide="showDeletedList" ng-click="getDeletedUserList(orgDetails.id);showDeletedList=true;toggleAll(false)">Show Deleted User List</span>
			</div>
	
					<div class="clearfix"></div>
					<div class="tablePadd">
					<div class="table-responsive padding0 orgTable" style="margin-bottom:45px;">
				<table class="listTable table table-striped  table-hover" ng-if="uAccess.ORG_GETUSERLIST">
					<thead>
						<th class="width60 checkbox">
							<input id="checkboxall" type="checkbox" ng-model="isAllSelected" ng-click="toggleAll(isAllSelected)" onchange="selectCheckBox()"/>
							<label for="checkboxall"></label>
						</th>	
						<th>
							<span><%=lblOrg.get("ORG_DE").get("USER_NAME")%></span>
							<!-- <a ng-if="uAccess.ORG_DELETEUSER" class="advOptn white cursor" ng-show="advSpan && !showDeletedList" data-toggle="modal" data-target="#deleUssr">
								Delete
							</a>
							<a class="advOptn white cursor" ng-show="advSpan && uAccess.ORG_ACTIVATEUSERS && showDeletedList" data-toggle="modal" data-target="#reActivateUssr">
								re-activate
							</a> -->
						</th>
						<th>
						<span><%=lblOrg.get("ORG_DE").get("USER_GROUP")%></span></th>
						<%-- <th><span><%=lblOrg.get("ORG_DE").get("USER_ROLES")%></span></th> --%>
						<th><span><%=lblOrg.get("ORG_DE").get("USER_ACT")%></span></th>
						<th><span><%=lblOrg.get("ORG_DE").get("USER_CREATE")%></span></th>
						<th><span><%=lblOrg.get("ORG_DE").get("USER_C_DATE")%></span></th>
					</thead>

					<tbody>
						<tr ng-repeat="val in UserDatas" class="cursor" ng-hide="showDeletedList">
							<td class="width60 checkbox">
								<span ng-show="val.rootUser!='yes'">
								<input id="checkVal_{{$index}}" class="chkBox" type="checkbox" ng-model="val.check_bx" ng-change="optionToggled()" onchange="selectCheckBox()"/>
								<label for="checkVal_{{$index}}"></label>
								</span>
							</td>
							<td  ng-click="getUserDets(val)"><span ng-show="val.rootUser=='yes'" title="root user"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;</span>{{val.userName}}<span ng-show="!val.userName.length">N/A</span></td>
							<td  ng-click="getUserDets(val)">
								<span ng-if="val.groups.length==0">N/A</span>
								<span class="commAftr" ng-repeat="grp in val.groups">{{grp.value}}</span>
							</td>
							<!-- <td  ng-click="getUserDets(val)">
								<span class="commAftr" ng-repeat="role in val.roles">{{role.value}} </span><span ng-show="!val.roles.length">N/A</span>
							</td> -->
							<td ng-click="getUserDets(val)">{{customDateFormat(val.lastActivity)}}<span ng-show="!val.lastActivity.length">None</span></td>
							<td  ng-click="getUserDets(val)">{{val.createdBy}}<span ng-show="!val.createdBy.length">N/A</span></td>
							<td  ng-click="getUserDets(val)">{{customDateFormat(val.dateCreated)}}<span ng-show="!val.dateCreated.length">N/A</span></td>
						</tr>	
						<tr ng-if="UserDatas.length < 1">
							<td class="emptyrow" colspan="6">no data found</td>
						</tr>
						
						<!-- Deleted List -->
						
						<tr ng-repeat="val in deletedUserDatas" class="cursor" ng-show="showDeletedList">
							<td class="width60 checkbox">
								<span ng-show="val.rootUser!='yes'">
								<input id="DcheckVal_{{$index}}" type="checkbox" ng-model="val.check_bx" ng-change="optionToggled()"/>
								<label for="DcheckVal_{{$index}}"></label>
								</span>
							</td>
							<td><span ng-show="val.rootUser=='yes'" title="root user"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;</span>{{val.userName}}</td>
							<td>
								<span class="commAftr" ng-repeat="grp in val.groups">{{grp.value}} </span>
							</td>
							<!-- <td>
								<span class="commAftr" ng-repeat="role in val.roles">{{role.value}} </span>
							</td> -->
							<td>{{customDateFormat(val.lastActivity)}}</td>
							<td>{{val.createdBy}}</td>
							<td>{{customDateFormat(val.dateCreated)}}</td>
						</tr>	
						<tr ng-if="deletedUserDatas.length < 1 && showDeletedList">
							<td class="emptyrow" colspan="6">no data found</td>
						</tr>
					</tbody>
				</table>	
			</div>
		</div>
			</div>
			
			<div class="tmenu_Body tablePadd  pad-15 marginMinus20" ng-show="userDetails">
				<h4 class="pageH1" style="font-weight:bold;"><%=lblOrgUsr.get("ORG_USR").get("USR_TITLE")%></h4>
					<ul class="list-unstyled ul_orgDets form-margin">
						<li>
							<label class="col-sm-2 paddingLeft0"><%=lblOrgUsr.get("ORG_USR").get("USR_USERNAME")%></label>		
							<span>{{userDetls.userName}}</span>
						</li>	
						<li>
							<label class="col-sm-2 paddingLeft0"><%=lblOrgUsr.get("ORG_USR").get("USR_LASTACTIVE")%></label>		
							<span ng-show="userDetls.lastActive">{{customDateFormat(userDetls.lastActive)}}</span>
            				<span ng-hide="userDetls.lastActive">None</span>
						</li>	
					</ul>
				<div class="clearfix"></div>	

				<div class="dets_Tab_main marginTop20">
					<ul class="list-unstyled tabsoF_details margin0">
						<li ng-class="(tabsGrpup == 'user_group')?'active':''"><a ng-click="tabsGrpup = 'user_group'"><%=lblOrgUsr.get("ORG_USR").get("USR_GROUPS")%></a></li>
						<%-- <li ng-class="(tabsGrpup == 'user_role')?'active':''"><a ng-click="tabsGrpup = 'user_role'"><%=lblOrgUsr.get("ORG_USR").get("USR_ROLES")%></a></li> --%>
						<li ng-class="(tabsGrpup == 'user_function')?'active':''"><a ng-click="tabsGrpup = 'user_function'"><%=lblOrgUsr.get("ORG_USR").get("USR_FUNCTIONS")%></a></li>
						<li ng-class="(tabsGrpup == 'user_security')?'active':''"><a ng-click="tabsGrpup = 'user_security'"><%=lblOrgUsr.get("ORG_USR").get("USR_SECURITY")%></a></li>
					</ul>

					<div class="clearfix"></div>

					<div class="tabz_Contnt" ng-init="tabsGrpup = 'user_group'">
						<div ng-show="tabsGrpup == 'user_group'">
							<button ng-if="uAccess.ORG_ADDUSERTOGROUP"  class="sButton marginRight10" data-toggle="modal" data-target="#creategroup" ng-click="loadGroupDropdown()"><%=lblOrgUsr.get("ORG_USR").get("USR_ADDGRP")%></button>
							<strong><%=lblOrgUsr.get("ORG_USR").get("USR_ATTACHGRP")%> : {{userDetls.groups.length}}</strong>
								<div class="clearfix"></div>
						
							<h2 class="tab_Titlz"><%=lblOrgUsr.get("ORG_USR").get("USR_GRPNAME")%></h2>	
							
							<div class="listOf_tabsLis">
								<ul class="list-unstyled">
									<li ng-repeat="usr in userDetls.groups">
										<img src="resources/org/images/group_list.png"/> 
										<span>{{usr.value}}</span>
										<i ng-if="uAccess.ORG_REMOVEUSERFROMGROUP" class="fa fa-close pull-right cursor delePopId" data-toggle="modal" data-target="#deletegrpPgg" data-id="{{usr.id}}"></i>
									</li>
								</ul>
							</div>						
						</div>
						
						<div ng-show="tabsGrpup == 'user_role'" >
								<button ng-if="uAccess.ORG_ADDUSERTOROLE" class="sButton marginRight10" data-toggle="modal" data-target="#createrole" ng-click="loadRoleDropdown()"><%=lblOrgUsr.get("ORG_USR").get("USR_ASNROLE")%></button>
								<strong><%=lblOrgUsr.get("ORG_USR").get("USR_ATTACHROLE")%> : {{userDetls.roles.length}}</strong>
									<div class="clearfix"></div>
							
								<h2 class="tab_Titlz"><%=lblOrgUsr.get("ORG_USR").get("USR_ROLENAME")%></h2>	
								
								<div class="listOf_tabsLis">
									<ul class="list-unstyled">
										<li class="roleTabz" ng-repeat="usr in userDetls.roles">
											<img src="resources/org/images/role_list.png"/> 
											<span>{{usr.value}}</span>
											<i ng-if="uAccess.ORG_REMOVEUSERFROMROLE"  class="fa fa-close pull-right cursor delePopId" data-toggle="modal" data-target="#deleteRolePgg" data-id="{{usr.id}}"></i>
										</li>
									</ul>
								</div>
						</div>
						
						<div ng-show="tabsGrpup == 'user_function'">
							<button ng-if="uAccess.ORG_ADDUSERTOFUNCTION" class="sButton marginRight10" data-toggle="modal" data-target="#createfunction" ng-click="loadFunctionDropdown()"><%=lblOrgUsr.get("ORG_USR").get("USR_ADDFUN")%></button>
							<strong><%=lblOrgUsr.get("ORG_USR").get("USR_ATTACHEFUN")%> : {{userDetls.directFunction.length + userDetls.groupFunction.length + userDetls.roleFunction.length}}</strong>
								<div class="clearfix"></div>
						
							<h2 class="tab_Titlz"><%=lblOrgUsr.get("ORG_USR").get("USR_FUNNAME")%></h2>	
							
							<div class="listOf_tabsLis inUsList">
								<p data-toggle="collapse" data-target="#func_direct">
									<%=lblOrgUsr.get("ORG_USR").get("USR_DIRFUN")%>
								</p>
								
								<ul class="list-unstyled panel-collapse collapse in" id="func_direct">
									<li ng-repeat="dir in userDetls.directFunction | unique: 'value'">
										<img src="resources/org/images/function_list.png"/> 
										<span>{{dir.value}}</span>
										<i ng-if="uAccess.ORG_REMOVEUSERFROMFUNCTION" class="fa fa-close pull-right cursor delePopId" data-toggle="modal" data-target="#deleteUsrPgg" data-id="{{dir.id}}"></i>
									</li>
								</ul>
								
								<p data-toggle="collapse" data-target="#func_groups">
									<%=lblOrgUsr.get("ORG_USR").get("USR_ATT_GRP")%>
								</p>
								<ul class="list-unstyled panel-collapse collapse in" id="func_groups">
									<li ng-repeat="dire in userDetls.groupFunction">
										<img src="resources/org/images/function_list.png"/> 
										<span>{{dire.value}}</span>
									</li>
								</ul>
								
<%-- 								<p data-toggle="collapse" data-target="#func_user"><%=lblOrgUsr.get("ORG_USR").get("USR_ATT_ROLE")%></p>
								<ul class="list-unstyled panel-collapse collapse in" id="func_user">
									<li ng-repeat="direv in userDetls.roleFunction">
										<img src="resources/org/images/function_list.png"/> 
										<span>{{direv.value}}</span>
									</li>
								</ul> --%>
							</div>
						</div>
						
						<div ng-show="tabsGrpup == 'user_security'">
						
							<h2 class="tab_Titlz">API Credentials</h2>
							<!-- <div class="col-sm-10 col-md-6">
									<div class="formGroups marginTop20">
							    		<div class="formLabel textRight col-sm-12">
							    			<label>API key</label> : <label>{{userDetls.userApiKey}} </label>
							    		</div>	
							    		
							    		<div class="clearfix"></div>
							    	</div>
							</div> -->

							<div class="col-sm-10 col-md-12 padding0 ">
								<div class="formGroups">
									<div class="col-sm-12 col-sm-offset-2 marginTop30">
										<label class="col-sm-2 padding0">API key </label> <span class="col-sm-10">  {{userDetls.userApiKey}} </span>
									</div>	
									
									<div class="clearfix"></div>
								</div>
						</div>

							<div class="clearfix"></div>
							
							<h2 ng-if="uAccess.ORG_CHANGEPASSWORD && uAccess.CHANGE_PASSWORD" class="tab_Titlz"><%=lblOrgUsr.get("ORG_USR").get("USR_CHANGEPASS")%></h2>	
							
							<!-- ================================CUSTOM PASSWORD================================= -->
							
							<div  ng-if="uAccess.ORG_CHANGEPASSWORD && uAccess.CHANGE_PASSWORD && UserID.id != loginUserId" class="col-sm-10 col-md-6 col-sm-offset-2 padding0" style="width:53%;">
								<form class="change_usrPwd" name="formSecurity" novalidate>
									<div>
										<div class="col-md-4"> <label style="white-space: nowrap">Set password *</label></div>
										<div class="col-md-8">
										
											<label style="white-space: nowrap" class="container-radio" >Keep existing password
												<input type="radio" name="radio" checked="checked" value="keepPwd" ng-init="passwordType='keepPwd'" ng-model="passwordType" ng-change="generatPwd2(passwordType)">
												<span class="checkmark"></span>
										  	</label>
										  	
										  	<label style="white-space: nowrap" class="container-radio">Autogenerated password
												<input type="radio" id='autoPwdId' name="radio" value="autoPwd" ng-model="passwordType" ng-change="generatPwd2(passwordType)">
												<span class="checkmark"></span>
										  	</label>
											
											<label style="white-space: nowrap" class="container-radio">Custom password
												<input type="radio" name="radio" value="customPwd"  ng-model="passwordType" ng-change="generatPwd2(passwordType)">
												<span class="checkmark"></span>
											</label>	
										  	
										  	<div class="formInput col-md-12 padding0">
												<input type="hidden" ng-model="UserID.id">
												<input id="showText" type="password" ng-keyup="checkZerosts(oldPassCode)" ng-model="oldPassCode" ng-disabled="disabl">
											</div>
										</div>
										
									</div>
									
										<div>
											<div class="col-md-4"><label style="white-space: nowrap; margin-top:12px;"><span>Password reset</span></label></div>
											<div class="col-md-8" style="margin-top:12px;">
											<label class="container-checkbox" ng-show="!disabl"><span>Must create a new password at next sign-in</span>{{disabl}}
												<input type="checkbox" ng-model="checkBxForMail" ng-change="ischecked(checkBxForMail)">
												<span class="checkmark-ForBox" ></span>
											</label>
											<label class="container-checkbox" ng-show="disabl"><span> Must create a new password at next sign-in</span>
												<input type="checkbox" disabled>
												<span class="checkmark-ForBox" style="background-color:#ddd;" disabled></span>
											</label>
											</div>
										</div>
									
							    	<div class="formGroups marginTop20">
							    		<div class="formLabel textRight col-sm-4">
							    			
							    		</div>	
							    		<div class="formInput col-sm-8">
							    			<label class="marginTop10 success_css" ng-show="showSuccess">
							    				{{successMessage}}
							    			</label>
							    			<label class="marginTop10 error_css" ng-show="showError">
							    				{{errorMessage}}
							    			</label>
							    		</div>	
							    		<div class="clearfix"></div>
							    	</div>
						
							    	<div class="formGroups marginTop20">
										<div class="col-md-12 padding0" style="text-align: right;">
							    		<div class="formInput">
											
											<a style="border:1px solid #ccc;line-height:18px !important;text-decoration:none;" class="btn btn-default uButton black" ng-click="clear()"><%=lblOrgUsr.get("ORG_USR").get("USR_CANCEL")%></a>
							    			<button class="btn btn-successcustom pButton marginLeft10" ng-disabled="formSecurity.$invalid || disabl || (passwordType=='customPwd' && oldPassCode.length<1) || disableForCustomPwd" ng-click="confirmPwd2(oldPassCode)"><%=lblOrgUsr.get("ORG_USR").get("USR_CONFIRM")%></button>
							    			
										</div>
									</div>	
										
							    		<div class="clearfix"></div>
							    	</div>
						
						
								</form>	
							</div>
							
							
							<!-- ================================CHANGE PASSWORD================================= -->
							
							<div ng-if="uAccess.ORG_CHANGEPASSWORD && uAccess.CHANGE_PASSWORD && UserID.id == loginUserId" class="col-sm-10 col-md-6 col-sm-offset-1">
								<form class="change_usrPwd" name="formSecurity" novalidate>
									<div class="formGroups marginTop20">
							    		<div class="formLabel textRight col-sm-4">
							    			<label><%=lblOrgUsr.get("ORG_USR").get("USR_OLDPASS")%></label>
							    		</div>	
							    		<div class="formInput col-sm-8 padding0">
							    			<input type="hidden" ng-model="UserID.id">
							    			<input type="password" id="oldPassCodeId" ng-model="oldPassCode" required>	
							    		</div>	
							    		<div class="clearfix"></div>
							    	</div>
						
							    	<div class="formGroups marginTop20">
							    		<div class="formLabel textRight col-sm-4">
							    			<label><%=lblOrgUsr.get("ORG_USR").get("USR_NEWPASS")%></label>
							    		</div>	
							    		<div class="formInput col-sm-8 padding0">
							    			<input type="password" id="newPassCodeId" ng-model="newPassCode" name="newPwd" minlength="6" required>	
							    			<i class="fa fa-close errClose" ng-show="formSecurity.newPwd.$dirty && formSecurity.newPwd.$invalid"></i>
							    		</div>	
							    		<div class="clearfix"></div>
							    	</div>
						
							    	<div class="formGroups marginTop20">
							    		<div class="formLabel textRight col-sm-4">
							    			<label style="white-space: nowrap"><%=lblOrgUsr.get("ORG_USR").get("USR_CONPASS")%></label>
							    		</div>	
							    		<div class="formInput col-sm-8 padding0">
							    			<input type="password" id="confirmPassCodeId" ng-model="confirmPassCode" ng-pattern="newPassCode"  ng-class="{true:'errBorder', false:'',}[confirmPassCode != newPassCode]"  required>
							    			<i class="fa fa-close errClose" ng-show="confirmPassCode != newPassCode"></i>	
							    			
							    			<label class="marginTop10 error_css" ng-if="errorShow">
							    				{{responseMsg}}
							    			</label>
							    		</div>	
							    		<div class="clearfix"></div>
							    	</div>
							    	
							    	<div class="formGroups marginTop20">
							    		<div class="formLabel textRight col-sm-4">
							    			
							    		</div>	
							    		<div class="formInput col-sm-8">
							    			<label class="marginTop10 success_css" ng-if="sucsMsg">
							    				{{successMsg}}
							    			</label>
							    		</div>	
							    		<div class="clearfix"></div>
							    	</div>
						
							    	<div class="formGroups marginTop20">
										<div class="col-md-12 padding0" style="text-align: right;">
							    		<div class="formInput">
							    			<a class="btn btn-default cancelBtn" ng-click="newPassCode = confirmPassCode = oldPassCode =''"><%=lblOrgUsr.get("ORG_USR").get("USR_CANCEL")%></a>
							    			<button class="btn btn-successcustom-new pButton marginLeft10" ng-disabled="formSecurity.$invalid" ng-click="confirmPwd(oldPassCode, newPassCode)"><%=lblOrgUsr.get("ORG_USR").get("USR_CONFIRM")%></button>
										</div>
									</div>	
										
							    		<div class="clearfix"></div>
							    	</div>
						
						
								</form>	
							</div>
						</div>

						<div class="clearfix"></div>
					</div>	

				</div>	
			</div>
		

		<!--CREATE USER MODAL -->
			<div id="createUser" class="modal fade popUpId" role="dialog" ng-click="checkMinLen(userName)">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="cancelUsr()"></i>
			    	<h1 class="pageH1"><%=lblOrg.get("ORG_DE").get("ADD_USER_TITLE")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrg.get("ORG_DE").get("ADD_USERNAME")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8 padding0">
			    			<input ng-model="userName" no-special-char placeholder="username">
			    			<input ng-model="id" type="hidden">
			    			<i class="fa fa-close errClose" ng-show="formValidate && !userName"></i>
			    			
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblOrg.get("ORG_DE").get("ADD_PASS")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8 padding0">
			    			<ul class="list-unstyled radio-align">
			    				<li><input type="radio" name="passcode" value="autoPwd" ng-model="passwordType" ng-change="generatPwd(passwordType)" ng-click="checkMinLen(userName)"> <%=lblOrg.get("ORG_DE").get("ADD_AUTOPASS")%></li>
			    				<li><input type="radio" name="passcode" value="customPwd"  ng-model="passwordType" ng-change="generatPwd(passwordType)" ng-click="checkMinLen(userName)"> <%=lblOrg.get("ORG_DE").get("ADD_CUSTOMPASS")%></li>
			    			</ul>	

			    			<input ng-if="passwordType == 'autoPwd'" type="text" ng-model="userPassword" ng-click="checkMinLen(userName)"/>
			    			<input ng-hide="passwordType == 'autoPwd'" type="password" ng-model="userPassword" ng-disabled="!passwordType" ng-click="checkMinLen(userName)"/>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<%-- <div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label style="line-height:22px;"><%=lblOrg.get("ORG_DE").get("ADD_REQU")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8 padding0">
			    			<input type="checkbox" ng-model="userSignin">
			    			<%=lblOrg.get("ORG_DE").get("ADD_USER_MUST")%>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div> --%>
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight  col-sm-3">
			    			<label style="line-height:22px;">Send Email</label>
			    		</div>	
			    		<div class="formInput  col-sm-8 padding0">
			    			<input class="radio-align" style="text-align: left" type="checkbox"  ng-model="sendEmail">
			    			<br/><br/>
			    			<input type="text" ng-model="emailAddress" ng-show="sendEmail" />
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
					
					<div class="formGroups marginTop20" ng-show="formValidate">
			    		<div class="col-sm-offset-3 formInput col-sm-9">
			    			<label class="marginTop10 error_css" ng-show="minLenError && userName.length<5">
			    				Value is too short. Min length is 5 characters 
			    			</label>
			    		
			    			<label class="marginTop10 error_css" ng-hide="passwordType">
			    				Please select the password type
			    			</label>
			    			
			    			<label class="marginTop10 error_css" ng-hide="userPassword">
			    				Please fill the Password
			    			</label>
			    			<label class="marginTop10 error_css" ng-hide="passwordStrong">
			    				Password must contain at least 8 characters and mixture of alphanumeric characters with at least one or more special characters, numbers, upper and lower case 
			    			</label>
			    			
			    			<label class="marginTop10 error_css" ng-hide="Email_password_dif">
			    				Password cannot be the same as email address 
			    			</label>

			    			
			    			<!-- <label class="marginTop10 error_css" ng-hide="emailAddress">
			    				Please enter email address
			    			</label> -->
			    		</div>				    		
			    		<div class="clearfix"></div>
			    	</div>
					
					<div class="formGroups marginTop20">
			    		<div class="col-sm-offset-3 formInput col-sm-9">
			    			<label class="marginTop10 error_css" ng-if="errorShow">
			    				{{errMessage}}
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
			    		<div class="formInput  col-sm-11 padding0" align="right">
			    			<button class="btn btn-default uButton" data-dismiss="modal" ng-click="cancelUsr()"><%=lblOrg.get("ORG_DE").get("ADD_CANCEL")%></button>
			    			<button class="btn btn-successcustom pButton marginLeft10" ng-click="addUser()"><%=lblOrg.get("ORG_DE").get("ADD_CREATE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>
	
			<!--END CREATE USER MODAL -->
			
					<!-- ADD GROUP MODAL -->
			<div id="creategroup" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdGrpinUsr= ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblOrgUsr.get("ORG_USR").get("USR_ADD_GRP")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblOrgUsr.get("ORG_USR").get("USR_SELECTFRM")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdGrpinUsr">
			    				<option ng-repeat="val in groupDatas" value="{{val.id}}" ng-disabled="disableGroup(val.grpName)"> {{val.grpName}}</option>
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="usr in userDetls.groups">
									<img src="resources/org/images/group_list.png"/> 
									<span>{{usr.value}}</span>
								</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addGroupToUSr(selectdGrpinUsr)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="btn btn_save btn-successcustom pButton pull-right" ng-click="selectdGrpinUsr = ''" data-dismiss="modal"><%=lblOrgUsr.get("ORG_USR").get("USR_COSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    </div>
			  </div>
			</div>

		<!-- END ADD GROUP MODAL -->		
			<!-- ADD ROLE MODAL -->
			<div id="createrole" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdRolinUsr = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblOrgUsr.get("ORG_USR").get("USR_ADDROLE")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblOrgUsr.get("ORG_USR").get("USR_SELECTFRM")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdRolinUsr">
			    				<option ng-repeat="val in roleDatas" value="{{val.id}}" ng-disabled="disableRole(val.roleName)"> {{val.roleName}}</option>
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="usr in userDetls.roles">
									<img src="resources/org/images/role_list.png"/> 
									<span>{{usr.value}}</span>
									
								</li>
			    			</ul>
			    			
			    			<label class="marginTop10 error_css" ng-show="errorShw">{{errorMs}}</label>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addRoleToUSr(selectdRolinUsr)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="btn btn_save btn-successcustom pButton pull-right" ng-click="selectdRolinUsr = ''" data-dismiss="modal"><%=lblOrgUsr.get("ORG_USR").get("USR_COSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>

		<!-- END ADD ROLE MODAL -->
		
				<!-- ADD FUNCTION MODAL -->
			<div id="createfunction" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblOrgUsr.get("ORG_USR").get("USR_ADD_FUN")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblOrgUsr.get("ORG_USR").get("USR_SELECTFRM")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdFninUser">
			    				<option ng-repeat="rep in functionDatas" value="{{rep.functionId}}" ng-disabled="disableRepeat(rep.name)"> {{rep.name}}</option>	
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="dir in userDetls.directFunction">
									<img src="resources/org/images/function_list.png"/> 
									<span>{{dir.value}}</span>
									<!-- <i class="fa fa-close pull-right cursor" ng-click="removeFunFrmUsr(dir.id)"></i> -->
								</li>
			    			</ul>
			    			
			    			<label class="marginTop10 error_css" ng-show="errorShw">{{errorMs}}</label>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addDirFunc(selectdFninUser)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="btn btn_save btn-successcustom pull-right pButton" ng-click="selectdFninUser = ''" data-dismiss="modal"><%=lblOrgUsr.get("ORG_USR").get("USR_COSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>

		<!-- END ADD FUNCTION MODAL -->
		
		
			<!-- DELETE FUNCTION MODAL -->
			<div id="deleteUsrPgg" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1 font-weight-bold" >Delete Confirmation</h1>
			    		
			    		<p>Do you want to delete the selected data?</p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleteThisId(deleteMe)">Yes</button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgUsr.get("ORG_USR").get("USR_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
	
			<!-- DELETE GROUP MODAL -->
			<div id="deletegrpPgg" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1">Delete Confirmation</h1>
			    		
			    		<p>Do you want to delete the selected data?</p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="removeGrptoUsr(deleteMe)">Yes</button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgUsr.get("ORG_USR").get("USR_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
	
			<!-- DELETE ROLE MODAL -->
			<div id="deleteRolePgg" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1">Delete Confirmation</h1>
			    		
			    		<p>Do you want to delete the selected data?</p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="removeRoleFrmUsr(deleteMe)">Yes</button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgUsr.get("ORG_USR").get("USR_CANCEL")%></button>
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
			    		
			    		<p>Do you want to delete the selected data?</p>
			    		<div class="formInput col-sm-12">
			    			<button class="btn btn_save btn-successcustom pull-right pButton marginLeft10" ng-click="deleteOrg()">Yes</button>
			    			<button class="btn btn_cancel btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgUsr.get("ORG_USR").get("USR_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
									<!-- DELETE USER LIST MODAL -->
			<div id="deleUssr" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
			    		<h1 class="pageH1">Delete Confirmation</h1>
			    		
			    		<p>Do you want to delete the selected data?</p>
			    		
			    		<div class="formInput col-sm-12">
			    			<button class="btn btn btn_save btn-successcustom pull-right pButton marginLeft10" ng-click="deleteUser()">Yes</button>
			    			<button class="btn btn_cancel btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgUsr.get("ORG_USR").get("USR_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
									<!-- RE ACTIVATE USER LIST MODAL -->
			<div id="reActivateUssr" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1">Re-activate Confirmation</h1>
			    		
			    		<p>Do you want to re-activate the selected users?</p>
			    		
			    		<div class="formInput col-sm-12" >
			    			<button class="pull-right pButton marginLeft10" ng-click="activateUser()">Yes</button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=lblOrgUsr.get("ORG_USR").get("USR_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
									<!-- RE ACTIVATE USER LIST MODAL -->
			<div id="reActivateUssrMsg" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1">Re-Activation</h1>
			    		<p>Re-Activation request successfully processed.</p>
			    		<p ng-if="existUsers.length>0"><span ng-repeat="msg in existUsers">{{msg.username}}{{$last ? '' : ($index==shifts.length-2) ? ' and ' : ', '}}</span> is already exist.</p>
			    		
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>
</div>
		
</div>
<%@include file="footer.jsp"%>
<script src="resources/org/controller/org_user_controller.js"></script>

		<script>
			$(function(){
				$('#orgz').addClass('active');
			});	
           
			function removeComma(txt){
				console.log('removecomma')
				console.log(txt)
				if (txt){
					txt = txt.replace(',', '');
					return txt;
				}
				
			}		
		</script>
		