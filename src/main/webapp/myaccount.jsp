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
	.wordWrpa{
margin: 0 0 10px;
   word-wrap: break-word;
/* overflow-x: hidden; */
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
.editOrgz{

	background-color: #96CA4E!important;
    border-color: white!important;
}
.form-margin li{
	margin-top:20px;
}
.delOrgz{
	position: absolute;
	right: 65px!important;
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
  .tabz_Contnt1{
	padding: 10em 2em 1.5em!important;
	border: none!important;	
  }
  .tabz_Contnt{
	margin-left: -5px!important;
  }
  .myAcc-details{
	background: white;
	margin-top: 20px;
	border: 1px solid #e8e8e8;
  }
  .tabz_Contnt{
	padding: 1em 2em 1.5em;
  }
  .paddingLeft50{
padding-left:50px!important;
  }

</style>
<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
 <link rel="stylesheet" href="resources/css/mob-res.css">
 <link rel="stylesheet" href="resources/css/style.css">

<script type="text/javascript">
var ACTIVATE_USER_URL = "<%=ACTIVATE_USER_URL%>";
var RESET_PASSWORD_EMAIL = "<%=RESET_PASSWORD_EMAIL%>";
var CHANGE_PASSWORD_URL = "<%=CHANGE_PASSWORD_URL%>";
</script>
		<div class="wrapper" ng-controller="listUser" ng-cloak>
		<%@include file="header.jsp"%>
			<!-- <div class="loadr" ng-if="loader"></div>	 -->
			<div class="loading-container2" ng-if="loader">
					<div class="loading">
					  <!-- <span>Loading...</span> -->
					</div>
				  </div>

			<div class="container-fluid container-fluid-BG pageTBMargin49">
					<div class="paddingLR30 paddingTopBTM30">
				<div class="row leftPadding40">
				<h3 class="orgTitle marginBottom0">My Account</h3>
					<div class="pad-15">
					<ul class="list-unstyled ul_orgDets form-margin">					
						<li>
							<label class="col-sm-2">Organisation</label>	
							<div class="col-sm-10"  style="padding: 3px">		
								<p class="wordWrpa" ng-hide="editOrg2">{{orgDetails.name}}<span ng-show="!orgDetails.desc.length">N/A</span></p>
								<div class="formInput" ng-show="editOrg2">
									<textarea ng-model="orgDetails.desc"></textarea>
								</div>
							</div>
						</li>	
												
						<li>
							<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("CLIENT_ID")%></label>	
							<div class="col-sm-10" style="padding: 3px" >		
								<p class="wordWrpa">{{orgDetails.clientid}}<span ng-show="!orgDetails.clientid.length">N/A</span></p>
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
			<div class="marginMinus20" ng-hide="userDetails">
				
				<div class="clearfix"></div>
				<div class="marginTop20 table-responsive border-box-table padding0" style="margin-bottom:45px;">
				<table class="listTable table table-striped  table-hover" ng-if="uAccess.ORG_GETUSERLIST">
					<thead>
						<th class="width80 checkbox">
							<input id="checkboxall" type="checkbox" ng-model="isAllSelected" ng-click="toggleAll(isAllSelected)"/>
							<label for="checkboxall"></label>
						</th>	
						<th>
							<span ng-hide="advSpan"><%=lblOrg.get("ORG_DE").get("USER_NAME")%></span>
							<a ng-if="uAccess.ORG_DELETEUSER" class="advOptn white cursor" ng-show="advSpan && !showDeletedList" data-toggle="modal" data-target="#deleUssr">
								Delete
							</a>
							<a class="advOptn white cursor" ng-show="advSpan && uAccess.ORG_ACTIVATEUSERS && showDeletedList" data-toggle="modal" data-target="#reActivateUssr">
								re-activate
							</a>
						</th>
						<th>
						<span ng-hide="advSpan"><%=lblOrg.get("ORG_DE").get("USER_GROUP")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrg.get("ORG_DE").get("USER_ROLES")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrg.get("ORG_DE").get("USER_ACT")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrg.get("ORG_DE").get("USER_CREATE")%></span></th>
						<th><span ng-hide="advSpan"><%=lblOrg.get("ORG_DE").get("USER_C_DATE")%></span></th>
					</thead>

					<tbody>
						<tr ng-repeat="val in UserDatas" class="cursor" ng-hide="showDeletedList">
							<td class="width80 checkbox">
								<span ng-show="val.rootUser!='yes'">
								<input id="checkVal_{{$index}}" type="checkbox" ng-model="val.check_bx" ng-change="optionToggled()"/>
								<label for="checkVal_{{$index}}"></label>
								</span>
							</td>
							<td  ng-click="getUserDets(val)"><span ng-show="val.rootUser=='yes'" title="root user"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;</span>{{val.userName}}<span ng-show="!val.userName.length">N/A</span></td>
							<td  ng-click="getUserDets(val)">
								<span ng-if="val.groups.length==0">N/A</span>
								<span class="commAftr" ng-repeat="grp in val.groups">{{grp.value}}</span>
							</td>
							<td  ng-click="getUserDets(val)">
								<span class="commAftr" ng-repeat="role in val.roles">{{role.value}} </span><span ng-show="!val.roles.length">N/A</span>
							</td>
							<td ng-click="getUserDets(val)">{{customDateFormat(val.lastActivity)}}<span ng-show="!val.lastActivity.length">None</span></td>
							<td  ng-click="getUserDets(val)">{{val.createdBy}}<span ng-show="!val.createdBy.length">N/A</span></td>
							<td  ng-click="getUserDets(val)">{{customDateFormat(val.dateCreated)}}<span ng-show="!val.dateCreated.length">N/A</span></td>
						</tr>	
						<tr ng-if="UserDatas.length < 1">
							<td class="emptyrow" colspan="7">no data found</td>
						</tr>
						
						<!-- Deleted List -->
						
						<tr ng-repeat="val in deletedUserDatas" class="cursor" ng-show="showDeletedList">
							<td class="width80 checkbox">
								<span ng-show="val.rootUser!='yes'">
								<input id="DcheckVal_{{$index}}" type="checkbox" ng-model="val.check_bx" ng-change="optionToggled()"/>
								<label for="DcheckVal_{{$index}}"></label>
								</span>
							</td>
							<td><span ng-show="val.rootUser=='yes'" title="root user"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;</span>{{val.userName}}</td>
							<td>
								<span class="commAftr" ng-repeat="grp in val.groups">{{grp.value}} </span>
							</td>
							<td>
								<span class="commAftr" ng-repeat="role in val.roles">{{role.value}} </span>
							</td>
							<td>{{customDateFormat(val.lastActivity)}}</td>
							<td>{{val.createdBy}}</td>
							<td>{{customDateFormat(val.dateCreated)}}</td>
						</tr>	
						<tr ng-if="deletedUserDatas.length < 1 && showDeletedList">
							<td class="emptyrow" colspan="7">no data found</td>
						</tr>
					</tbody>
				</table>	
			</div>
			</div>
			<div class="myAcc-details"> 
			<div class="tmenu_Body pad-15 marginMinus20" ng-show="userDetails">
					<h4 class="pageH1 paddingLeft40"  style="font-weight:600; padding-top:30px;"><%=lblOrgUsr.get("ORG_USR").get("USR_TITLE")%></h4>
					<ul class="list-unstyled ul_orgDets form-margin paddingLeft40">
						<li>
							<label class="col-sm-2 paddingLeft0"><%=lblOrgUsr.get("ORG_USR").get("USR_USERNAME")%></label>		
							<span>{{userDetls.userName}}</span>
						</li>	
						<li>
							<label class="col-sm-2 paddingLeft0">Last Active</label>		
							<!-- <span class="ng-binding">2019-11-15  06:59</span> -->
							<span class="ng-binding" >{{userDetls.lastActive}}</span>
							<span class="ng-binding" ng-if="!userDetls.lastActive">NA</span>
						</li>
					</ul>
					<!-- <ul class="list-unstyled tabsoF_details margin0">
						<li ng-class="(tabsGrpup == 'user_security')?'active':''"><a ng-click="tabsGrpup = 'user_security'"><%=lblOrgUsr.get("ORG_USR").get("USR_SECURITY")%></a></li>
					</ul> -->
					<div class="tabz_Contnt tabz_Contnt1" ng-init="tabsGrpup = 'user_security'">
						<div ng-show="tabsGrpup == 'user_security'">
						
							<h2 class="tab_Titlz" style="margin-top:0px;">API Credentials</h2>
							<div class="col-sm-10 col-md-12 padding0">
									<div class="formGroups marginTop30">
							    		<div class="col-sm-12 padding0">
							    			<label class="col-sm-2">API key </label> <span class="col-sm-10">  {{userDetls.userApiKey}} </span>
							    		</div>	
							    		
							    		<div class="clearfix"></div>
							    	</div>
							</div>
							<div class="clearfix"></div>
							
							
							<h2 class="tab_Titlz"><%=lblOrgUsr.get("ORG_USR").get("USR_CHANGEPASS")%></h2>	
							<div class="col-sm-10 col-md-6 col-sm-offset-2 padding0 marginTop30">
								<form class="change_usrPwd" novalidate>
									<div class="formGroups marginTop20">
							    		<div class="formLabel textRight col-sm-4">
							    			<label><%=lblOrgUsr.get("ORG_USR").get("USR_OLDPASS")%></label>
							    		</div>	
							    		<div class="formInput col-sm-8 padding0" >
							    			<input type="hidden" ng-model="UserID.id" autocomplete="off">
							    			<input type="password" ng-model="oldPassCode" autocomplete="off" required>	
							    		</div>	
							    		<div class="clearfix"></div>
							    	</div>
						
							    	<div class="formGroups marginTop20">
							    		<div class="formLabel textRight col-sm-4">
							    			<label><%=lblOrgUsr.get("ORG_USR").get("USR_NEWPASS")%></label>
							    		</div>	
							    		<div class="formInput col-sm-8 padding0">
							    			<input type="password" ng-model="newPassCode" autocomplete="off" name="newPwd" required>	
							    			<i class="fa fa-close errClose" ng-show="formSecurity && newPassCode"></i>
							    		</div>	
							    		<div class="clearfix"></div>
							    	</div>
						
							    	<div class="formGroups marginTop20">
							    		<div class="formLabel textRight col-sm-4">
							    			<label style="white-space: nowrap"><%=lblOrgUsr.get("ORG_USR").get("USR_CONPASS")%></label>
							    		</div>	
							    		<div class="formInput col-sm-8 padding0">
							    			<input type="password" ng-model="confirmPassCode" autocomplete="off" ng-pattern="newPassCode"  ng-class="{true:'errBorder', false:'',}[confirmPassCode != newPassCode]"  required>
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
							    		<div class="formLabel textRight col-sm-3">
							    			<label></label>
										</div>	
										<div class="col-sm-9 padding0" style="text-align: right;">
							    		<div class="formInput">
							    			<a style="text-decoration:none;" class="btn btn-default cancelBtn" ng-click="newPassCode = confirmPassCode = oldPassCode =''"><%=lblOrgUsr.get("ORG_USR").get("USR_CANCEL")%></a>
							    			<button class="btn btn-successcustom-new pButton marginLeft10" ng-disabled="newPassCode =='' || confirmPassCode =='' || oldPassCode =='' || formSecurity" ng-click="confirmPwd(oldPassCode, newPassCode)"><%=lblOrgUsr.get("ORG_USR").get("USR_CONFIRM")%></button>
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
					</div>
		</div>
		

		<!--CREATE USER MODAL -->
			<div id="createUser" class="modal fade popUpId" role="dialog">
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
			    				<li><input type="radio" name="passcode" value="autoPwd" ng-model="passwordType" ng-change="generatPwd(passwordType)"> <%=lblOrg.get("ORG_DE").get("ADD_AUTOPASS")%></li>
			    				<li><input type="radio" name="passcode" value="customPwd"  ng-model="passwordType" ng-change="generatPwd(passwordType)"> <%=lblOrg.get("ORG_DE").get("ADD_CUSTOMPASS")%></li>
			    			</ul>	

			    			<input ng-if="passwordType == 'autoPwd'" type="text" ng-model="userPassword"/>
			    			<input ng-hide="passwordType == 'autoPwd'" type="password" ng-model="userPassword" ng-disabled="!passwordType"/>
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
			    			<button class="btn btn-successcustom-new pButton marginLeft10" ng-click="addUser()"><%=lblOrg.get("ORG_DE").get("ADD_CREATE")%></button>
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

		
		
		
	
</div>
		
</div>
<%@include file="footer.jsp"%>
<script src="resources/org/controller/org_myaccount_controller.js"></script>

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
		