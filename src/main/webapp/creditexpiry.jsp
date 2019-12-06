<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("CREDITEXPIRY"));

String API_ENDPOINT_ORG_ACCOUNT_LIST = APIUtil.API_ENDPOINT_ORG_ACCOUNT_LIST;
String API_ENDPOINT_ORG_ALL_ACCOUNT_LIST = APIUtil.API_ENDPOINT_ORG_ALL_ACCOUNT_LIST;
String API_DA_GETEMAILID = APIUtil.API_DA_GETEMAILID;
String UPDATE_CREDIT_EXPIRY = APIUtil.UPDATE_CREDIT_EXPIRY;
String LIST_CREDIT_EXPIRY = APIUtil.LIST_CREDIT_EXPIRY;
String SUPPORT_EMAIL = APIUtil.SUPPORT_EMAIL;

int currentLoginId = 0;

if(session.getAttribute("id") != null)
{
	currentLoginId = (int) session.getAttribute("id");
}

int loginUsrId = (int) session.getAttribute("id");

%>
<script>

var API_ENDPOINT_ORG_ACCOUNT_LIST = "<%=API_ENDPOINT_ORG_ACCOUNT_LIST%>";
var API_ENDPOINT_ORG_ALL_ACCOUNT_LIST = "<%=API_ENDPOINT_ORG_ALL_ACCOUNT_LIST%>";
var API_DA_GETEMAILID = "<%=API_DA_GETEMAILID%>";
var UPDATE_CREDIT_EXPIRY = "<%=UPDATE_CREDIT_EXPIRY%>";
var LIST_CREDIT_EXPIRY = "<%=LIST_CREDIT_EXPIRY%>";
var SUPPORT_EMAIL = "<%=SUPPORT_EMAIL%>";

var currentLoginId = <%=currentLoginId%>;
var loginUsrId = <%=loginUsrId%>;

</script>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sentient</title>
  <meta charset="utf-8">
  <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.css">
  <link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/search.css">
  
  <link rel="stylesheet" href="resources/css/mob-res.css">
  
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  
  
  
  
  <style type="text/css">jj
  
  
    	.titleHeadDiv {
  		background-color: #676974; 
  		color: #FFFFFF;
  		 border-radius:5px;
  		 padding: 10px;
  		}
    	.modelContent{
      padding: 10px;
      }
      .modal-header h4{
      color: #333;
    font-weight: bold;
    text-align: center;
    margin-bottom: 0px;
      
      }
 .btn_bg{
 background-color: #54565f;
  color: #fff;
  cursor: pointer;
  padding: 20px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  /* font-size: 15px; */
  transition: 0.4s;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;}
  
  .font-weight-bold {
    font-weight: bold;
}
.rowLR{
margin-left:0px!important; 
	margin-right:0px!important; 
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
.paddingLeft0{
	padding-left:0;
}
.thanksModal .modal-header{
	border-bottom: none!important;
}


  </style>
  
    <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
    rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="resources/css/datafed_style.css">
	<link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="resources/css/contract.css">
	
  	<script src="resources/js/1.9.1-jquery.js"></script> 
  	<script src="resources/js/1.11.4-jquery-ui.js"></script>
	

  	
</head>
	<body ng-app="datafedApp" ng-controller="creditExpiryCtrl" ng-cloak>
		<jsp:include page="new_header.jsp"></jsp:include>
		
		<!-- <div class="loadr" ng-show="loadeer"></div> -->
		<div class="loading-container" ng-show="loadeer">
				<div class="loading">
				</div>
			  </div>
		
		<div class="container-fluid paddingLR30 padding0" style="margin-top: 50px !important">
				<h4 class="btn_bg lable"><%=lbl.get("CREDITEXPIRY").get("TITLE")%></h4>
			<div class="padding20 box">
				<div  class="row rowLR">
					<div class="col-md-3 paddingLeft0" ng-show="isSuperAdmin">
						<div style="text-align: left; padding-top: 8px !important; font-size: 14px; font-weight: bold;">
						 <label class="" ng-model="acId" style="padding-top: inherit;">{{accountDataId.orgName}} {{accountDataId.acNumber}} {{accountDataId.acType}} <%=lbl.get("CREDITEXPIRY").get("ACC_TXT")%></label>
						</div>
					</div>
					
					<div class="col-md-3 col-sm-3 paddingLeft0" ng-show="!isSuperAdmin">
						<div style="text-align: left; padding-top: 4px !important; font-size: 14px; font-weight: bold;">
						 <label class="" ng-repeat="acc in accountData" ng-if="acc.acType =='Spending'" style="padding-top: inherit;">{{acc.acNumber}} {{acc.acType}} <%=lbl.get("CREDITEXPIRY").get("ACC_TXT")%></label>
						</div>
					</div>
					
					
					<div class="col-md-4 paddingLeft0" ng-show="isSuperAdmin">
						&nbsp;
					</div>
					
					<div class="col-md-4 paddingLeft0" ng-show="!isSuperAdmin">
						&nbsp;
					</div>
					
										
					<div class="col-md-3 paddingLeft0" ng-show="isSuperAdmin">
						<div style="text-align: center; padding-top: 8px !important; font-size: 14px; font-weight: bold;">
						 <select class="form-control" ng-model="organisationId" ng-change="setAccountData(organisationId)" style="cursor:pointer;">
							<option ng-repeat="org in orgList | orderBy: 'orgName'" value="{{org.orgId}}" >{{org.orgName}}</option>
						</select>
						</div>
					</div>
					
					
					<div class="col-md-3 paddingLeft0" ng-show="!isSuperAdmin">
						&nbsp;
					</div>
					
					<div class="col-md-2 paddingLeft0" style="padding-right: 0px;" ng-show="isSuperAdmin">
						<div style="text-align: center; padding-top: 8px !important; font-size: 14px; font-weight: bold;">
						 	 <select class="form-control" ng-model="credit_Type"  ng-init="duration='current'" style="cursor:pointer">
								<option value="" selected><%=lbl.get("CREDITEXPIRY").get("SELECT_TYPE")%></option>
								<option value="{{credlis.code}}" ng-repeat="credlis in creditTypesList">{{credlis.value}}</option>
							</select>
						</div>
					</div>
					
					<!-- <div class="col-md-3 col-sm-3 paddingLeft0" style="padding-right: 0px;" ng-show="!isSuperAdmin"> -->
					<div class="col-md-2 paddingLeft0" style="padding-right: 0px;" ng-show="!isSuperAdmin">
						<div style="text-align: center; font-size: 14px; font-weight: bold;">
							 <select class="form-control" ng-model="credit_Type"  ng-init="duration='current'" style="cursor:pointer">
								<option value="" selected><%=lbl.get("CREDITEXPIRY").get("SELECT_TYPE")%></option>
								<option value="{{credlis.code}}" ng-repeat="credlis in creditTypesList">{{credlis.value}}</option>
							</select>
						</div>
					</div>
					
				</div>
				
				<div>&nbsp;&nbsp;</div>
				
				<!-- <div  ng-show="isSuperAdmin" class="row rowLR" style="padding-bottom: 20px;"> -->
				<div class="row rowLR" style="padding-bottom: 20px;">
					<div class="col-md-6 col-sm-12 paddingLeft0" ng-show="isSuperAdmin">
					<!-- <div class="col-md-6 col-sm-12 paddingLeft0"> -->
						<button class="btn btn-successcustom" ng-click="addCredit()" class="btn btn-default" ng-show="isSuperAdmin"><%=lbl.get("CREDITEXPIRY").get("ADD_CREDIT_BTN")%></button>						
						<!-- <button class="btn btn-successcustom" ng-click="addCredit()" class="btn btn-default" ng-show="!isSuperAdmin">Top-up</button> -->						
					</div>
					<div class="col-md-6 col-sm-12"  style="padding-right: 0px;" ng-show="isSuperAdmin">
						<button ng-show="isActive" style="float: right;" class="btn btn-successcustom" ng-click="ActiveOrExpiryBtn('E')" class="btn btn-default" ><%=lbl.get("CREDITEXPIRY").get("EXPIRED_CREDITS")%></button>						
						<button ng-show="!(isActive)" style="float: right;" class="btn btn-successcustom" ng-click="ActiveOrExpiryBtn('A')" class="btn btn-default" ><%=lbl.get("CREDITEXPIRY").get("ACTIVE_CREDITS")%></button>

						<button ng-show="showbtn && isActive && activeRecords.length" style="float: right; margin-right:10px;" class="btn btn-successcustom" ng-click="updateNewShuffeledArray()" class="btn btn-default" ><%=lbl.get("CREDITEXPIRY").get("SAVE_LIST")%></button>
						
					</div>
					
					<div class="col-md-3 col-sm-3 paddingLeft0" ng-show="!isSuperAdmin">
						<!-- <button class="btn btn-successcustom" ng-click="addCredit()" class="btn btn-default" ng-show="isSuperAdmin">Add Credit</button>						 -->
						<button class="btn btn-successcustom" ng-click="sendTopUpMail()" class="btn btn-default" ng-show="!isSuperAdmin">Top-up</button>					
					</div>
					
					
					
					<!-- <div class="col-md-4 col-sm-4 paddingLeft0" ng-show="!isSuperAdmin">
						&nbsp;
					</div> -->
					
					
					
					<%-- <div class="col-md-3 col-sm-3 paddingLeft0" ng-show="!isSuperAdmin">
						<button class="btn btn-successcustom" ng-click="addCredit()" class="btn btn-default" ng-show="isSuperAdmin"><%=lbl.get("CREDITEXPIRY").get("ADD_CREDIT_BTN")%></button>						
						<!-- <button class="btn btn-successcustom" ng-click="addCredit()" class="btn btn-default" ng-show="!isSuperAdmin">Top-up</button> -->						
					</div> --%>
					<div class="col-md-2 col-sm-2"  style="padding-right: 0px;float:right;" ng-show="!isSuperAdmin">
						<button ng-show="isActive" style="float: right;" class="btn btn-successcustom" ng-click="ActiveOrExpiryBtn('E')" class="btn btn-default" ><%=lbl.get("CREDITEXPIRY").get("EXPIRED_CREDITS")%></button>						
						<button ng-show="!(isActive)" style="float: right;" class="btn btn-successcustom" ng-click="ActiveOrExpiryBtn('A')" class="btn btn-default" ><%=lbl.get("CREDITEXPIRY").get("ACTIVE_CREDITS")%></button>

						<button ng-show="showbtn && isActive" style="float: right; margin-right:10px;" class="btn btn-successcustom" ng-click="updateNewShuffeledArray()" class="btn btn-default" ><%=lbl.get("CREDITEXPIRY").get("SAVE_LIST")%></button>
						
					</div>
					
					
					
					
					<!-- <div class="col-md-6 col-sm-12" style="font-weight: bold;text-align-last: right;border: 1px solid #A4BD99;width: auto;float: right;border-radius: 5px;height: 36px;padding-top: 7px;">
						<p>Account Balance : 100.00</p>
					</div> -->
					
				</div>
			
				<div class="row rowLR table-responsive border-box-table table-bottom">
					<table class="table table-hover table-striped ">
						<thead class="theadBG">
						<tr ng->
							<th><%=lbl.get("CREDITEXPIRY").get("TAB_CREDIT_TYPE")%></th>
							<th><%=lbl.get("CREDITEXPIRY").get("TAB_DESCRIPTION")%></th>
							<th style="padding-right: 20px;"><%=lbl.get("CREDITEXPIRY").get("TAB_EXP_DATE")%></th>
							<th>
						        <button ng-click="" style="background: none; border: none; cursor: pointer;"><%=lbl.get("CREDITEXPIRY").get("TAB_CREDIT")%></button>
						        <span></span>
					      	</th>
					      	<th>
						        <button ng-click="" style="background: none; border: none; cursor: pointer;"><%=lbl.get("CREDITEXPIRY").get("TAB_BAL_CREDIT")%></button>
						        <span></span>
					      	</th>
							<th ng-show="isSuperAdmin"><%=lbl.get("CREDITEXPIRY").get("TAB_PRIORITY")%></th>
							
						</tr>
					</thead>  
						<tbody id="dragDrop" ng-show="isActive && isSuperAdmin"> 
							<tr ng-repeat="actRecs in activeRecords | filter:credit_Type"  >
								<td nowrap ng-show="actRecs.creditType=='ADD_CRE_MARK_CRED'"><%=lbl.get("CREDITEXPIRY").get("MARKETING_CREDIT")%></td>
								<td nowrap ng-show="actRecs.creditType=='ADD_CRE_CRED_TOP'"><%=lbl.get("CREDITEXPIRY").get("CREDIT_TOP_UP")%></td>
								<td nowrap>{{actRecs.description}}</td>
								<!-- DATE UPDATE BUTTON -->
								<td style="padding-right: 20px;" value="{{actRecs.expiryDate}}">
									<span ng-show="actRecs.expiryDate.length && isSuperAdmin && actRecs.creditType != 'ADD_CRE_CRED_TOP'" ng-click="updateDateMthd(actRecs)" style="cursor: pointer;"><i class="fa fa-calendar" aria-hidden="true"></i> {{actRecs.expiryDate}}</span>
									<span ng-show="!(actRecs.expiryDate.length) && isSuperAdmin && actRecs.creditType != 'ADD_CRE_CRED_TOP'" class="fa fa-calendar" ng-click="updateDateMthd(actRecs)" style="cursor: pointer;"></span>
									<span ng-show="!(actRecs.expiryDate.length)" style="color: #a4a29f;padding-right: 10px;"><%=lbl.get("CREDITEXPIRY").get("NO_EXPIRY")%></span>
									<!-- <span ng-show="" class="fa fa-calendar" ng-click="updateDateMthd(actRecs)"></span> {{actRecs.expiryDate}} -->
								</td>
								<td nowrap>{{actRecs.credit | number:0}}</td>
								<td nowrap>{{actRecs.reCredit | number:0}}</td>
								<td ng-show="isSuperAdmin">{{$index+1}}</td>							
								<!-- <td>{{actRecs.priority}}</td> -->							
								
							</tr>
							<tr >
								<td ng-show="!(activeRecords.length)" colspan="6" style="text-align: center; color: #333; font-weight: bold;"><%=lbl.get("CREDITEXPIRY").get("NOT_FOUND")%></td>
							</tr>
						</tbody>
						
						<tbody ng-show="isActive && !isSuperAdmin"> 
							<tr ng-repeat="actRecs in activeRecords | filter:credit_Type"  >
								<td nowrap ng-show="actRecs.creditType=='ADD_CRE_MARK_CRED'"><%=lbl.get("CREDITEXPIRY").get("MARKETING_CREDIT")%></td>
								<td nowrap ng-show="actRecs.creditType=='ADD_CRE_CRED_TOP'"><%=lbl.get("CREDITEXPIRY").get("CREDIT_TOP_UP")%></td>
								<td nowrap>{{actRecs.description}}</td>
								<!-- DATE UPDATE BUTTON -->
								<td style="padding-right: 20px;" value="{{actRecs.expiryDate}}">
									<span ng-show="actRecs.expiryDate.length && isSuperAdmin && actRecs.creditType != 'ADD_CRE_CRED_TOP'" class="fa fa-calendar" ng-click="updateDateMthd(actRecs)" style="cursor: pointer;"></span> {{actRecs.expiryDate}}
									<span ng-show="!(actRecs.expiryDate.length) && isSuperAdmin && actRecs.creditType != 'ADD_CRE_CRED_TOP'" class="fa fa-calendar" ng-click="updateDateMthd(actRecs)" style="cursor: pointer;"></span>
									<span ng-show="!(actRecs.expiryDate.length)" style="color: #a4a29f;padding-right: 10px;"><%=lbl.get("CREDITEXPIRY").get("NO_EXPIRY")%></span>
									<!-- <span ng-show="" class="fa fa-calendar" ng-click="updateDateMthd(actRecs)"></span> {{actRecs.expiryDate}} -->
								</td>
								<td nowrap>{{actRecs.credit | number:0}}</td>
								<td nowrap>{{actRecs.reCredit | number:0}}</td>
								<td ng-show="isSuperAdmin">{{$index+1}}</td>							
								<!-- <td>{{actRecs.priority}}</td> -->							
								
							</tr>
							<tr >
								<td ng-show="!(activeRecords.length)" colspan="5" style="text-align: center; color: #333; font-weight: bold;"><%=lbl.get("CREDITEXPIRY").get("NOT_FOUND")%></td>
							</tr>
						</tbody>
						<tbody ng-show="!isActive" >
							<tr ng-repeat="expRecs in expiryRecords | filter:credit_Type" style="cursor:pointer;">
								<td nowrap ng-show="expRecs.creditType=='ADD_CRE_MARK_CRED'"><%=lbl.get("CREDITEXPIRY").get("MARKETING_CREDIT")%></td>
								<td nowrap ng-show="expRecs.creditType=='ADD_CRE_CRED_TOP'"><%=lbl.get("CREDITEXPIRY").get("CREDIT_TOP_UP")%></td>
								<td nowrap>{{expRecs.description}}</td>
								<td style="padding-right: 20px;">{{expRecs.expiryDate}}</td>
								<td nowrap>{{expRecs.credit | number:0}}</td>
								<td nowrap>{{expRecs.reCredit | number:0}}</td>
								<!-- <td>{{expRecs.priority}}</td> -->							
								<td ng-show="isSuperAdmin">{{$index+1}}</td>							
							</tr>
							<tr >
								<td ng-show="!(expiryRecords.length)" colspan="6" style="text-align: center; color: #333; font-weight: bold;"><%=lbl.get("CREDITEXPIRY").get("NOT_FOUND")%></td>
							</tr>
						</tbody>
						<!-- <tr style="text-align: center; font-weight: bold; padding-top:20px" ng-show="!(activeRecords.length || expirycredits.length)">Not Found</tr> -->
					</table>
				</div>
				</div>
				</div>
		
		<!-- </div>					
		</div> -->
		
		
		<!-- ADD CREDIT MODAL -- START-->
		<div class="modal fade center-modal" id="addCreditModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
		<div class="modal-dialog thanksModal" role="document">
		  <div class="modal-content">
		    <div class="modal-header">
		      <h4 class="font-weight-bold" ><%=lbl.get("CREDITEXPIRY").get("MDL_ACC_BAL")%></h4>
		      <div class="modelContent">
		      
		      
		      <div class="form-group">
               	  <label style="color: #000000"><%=lbl.get("CREDITEXPIRY").get("MDL_ITEMS")%><span style="color:red">*</span></label>
               	  <span style="color:red" ng-show="formValidation && !creditExpirySettings.creditType"><%=lbl.get("CREDITEXPIRY").get("MDL_CRED_TYP_REQ")%></span>
                  <select class="form-control" ng-model="creditExpirySettings.creditType" style="cursor:pointer">
					<option ng-repeat="itm in itemsCreditExp" value="{{itm.code}}" >{{itm.value}}</option>
				</select>
              </div>
		      
		      <div class="form-group">
                  <label style="color: #000000"><%=lbl.get("CREDITEXPIRY").get("MDL_CREDIT_TXT")%><span style="color:red">*</span></label>
                  <span style="color:red" ng-show="formValidation && !creditExpirySettings.credit"><%=lbl.get("CREDITEXPIRY").get("MDL_CREDIT_DATE_REQ")%></span>
                  <input type="text" class="form-control float" id="creditAmount" onkeyup="return checkPrice()" ng-model="creditExpirySettings.credit" placeholder="0.00" />
               </div>
		      
		      <div class="form-group" ng-show="creditExpirySettings.creditType=='ADD_CRE_MARK_CRED'">
	              <label class="font-weight-bold"><%=lbl.get("CREDITEXPIRY").get("MDL_EXP_DATE_TXT")%> </label>
	              <div class="input-group border-button" id="expiryFocus">
	                <input type="text" id="expiryDateId" ng-model="creditExpirySettings.expiryDate" ng-init="creditExpirySettings.expiryDate=''"   class="form-control" placeholder="Select Expiry Date" style="background:white;"/>
              	    <span class="input-group-addon" >
                        <span class="fa fa-calendar" style="cursor: pointer;"></span>
					</span>
				</div>
	          </div>
               
               <div class="form-group">
                  <label style="color: #000000"><%=lbl.get("CREDITEXPIRY").get("MDL_DESP_TXT")%></label>
                  <textarea class="form-control" rows="3" ng-model="creditExpirySettings.description" ></textarea>
               </div>
               <br/>		    
			    <div style="text-align:right;">
			    	<button type="button" class="btn btn-default uButton" style="margin-right:5px;" ng-click="clearFileds()" data-dismiss="modal"><%=lbl.get("CREDITEXPIRY").get("MDL_CLS_TXT")%></button>
			      	<button type="button" class="btn btn-successcustom"  ng-click="updateCreditExpiry()"><%=lbl.get("CREDITEXPIRY").get("MDL_ADD_TXT")%></button>
			    </div>
			    </div>
		    </div>
		    
		  </div>
		</div> 
		</div>
		<!-- ADD CREDIT MODAL -- END-->
		
		
		<!-- UPDATE CREDIT MODAL -- START-->
		
		<div class="modal fade center-modal" id="updateCreditModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
		<div class="modal-dialog thanksModal" role="document">
		  <div class="modal-content">
		    <div class="modal-header">
		      <h4 class="font-weight-bold" ><%=lbl.get("CREDITEXPIRY").get("UP_MDL_EXP_TXT")%></h4>
		      <div class="modelContent">
		      <div class="form-group" ng-show="indexRecords.creditType=='ADD_CRE_MARK_CRED'" >
		      <!-- <div class="form-group"> -->
	              <label class="font-weight-bold"><%=lbl.get("CREDITEXPIRY").get("UP_MDL_EXPDATE_TXT")%> </label>
	              <div class="input-group border-button" id="expiryFocus1">
	                <input type="text" id="expiryDateId1" ng-model="expdate" ng-init="expdate=''"  class="form-control datepicker" placeholder="Select Expiry Date" style="background:white;" clear-on-backspace/>
              	    <span class="input-group-addon" >
                        <span class="fa fa-calendar" style="cursor: pointer;"></span>
					</span>
				</div>
	          </div>
             
               <br/>		    
			    <div style="text-align:right;" ng-show="indexRecords.creditType=='ADD_CRE_MARK_CRED'">
			    	<button type="button" class="btn btn-default uButton" style="margin-right:5px;" data-dismiss="modal"  ng-click="clearDataItself()"><%=lbl.get("CREDITEXPIRY").get("UP_MDL_CLS_TXT")%></button>
			      	<button type="button" class="btn btn-successcustom"  ng-click="updateExpiryDateMthd(expdate)" data-dismiss="modal"><%=lbl.get("CREDITEXPIRY").get("UP_MDL_UPDATE_TXT")%></button>
			    </div>
			    <div style="text-align:right;" ng-show="!(indexRecords.creditType=='ADD_CRE_MARK_CRED')">
			    	<button type="button" class="btn btn-successcustom" data-dismiss="modal"><%=lbl.get("CREDITEXPIRY").get("UP_MDL_CLS_TXT")%></button>
			      	<!-- <button type="button" class="btn btn-successcustom"  ng-click="updateExpiryDateMthd(expdate)" data-dismiss="modal">Update</button> -->
			    </div>
			    </div>
		    </div>
		    
		  </div>
		</div> 
		</div>
		<!-- UPDATE CREDIT MODAL -- END-->
		
		
		<div class="modal fade center-modal" id="topUpBtnMdl" tabindex="-1" role="dialog" aria-labelledby="topUpBtnMdl" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content" style="padding:20px!important;">
				<div class="modal-body" style="text-align: left;"> 
					<div class="">
						 <p class="para-text margintop20">Your request has been sent to the client service team, we will contact you shortly.</p>
					 </div>
					 </div>
					 
				<div class="modal-footer padding0">
					<div class="margintop20">
					<button type="button" class="btn btn-successcustom"style=" width: 13rem;height:auto; background-color: #424143; border-color:#424143; color: white;" data-dismiss="modal">
						Ok
				  </button>
				</div>	 		
			  </div>
			</div>
		  </div>
		</div> 
		
		
		<script src="resources/js/jquery.js"></script>
				
		<!-- <script src="resources/js/jquery.js"></script> -->
	  	<script src="resources/js/bootstrap.js"></script>	  
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/daterangepicker.min.js"></script>
		<script src="resources/js/datafedApp.js"></script>
		<script src="resources/controller/creditExpiryController.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		
</body>
<script>
	
	$(function(){
		$('#datafedmenu').addClass('active');
	})
	
	
	function replacePonto(){
        var input = document.getElementById('creditAmount');
        var ponto = input.value.split('.').length;
        var slash = input.value.split('-').length;
        if (ponto > 2)
                input.value=input.value.substr(0,(input.value.length)-1);

        if(slash > 2)
                input.value=input.value.substr(0,(input.value.length)-1);

        input.value=input.value.replace(/[^0-9.-]/,'');

        if (ponto ==2)
	input.value=input.value.substr(0,(input.value.indexOf('.')+3));
	
	if(input.value == '.')
		input.value = "";
	
	}


	function checkPrice(){
        var input = document.getElementById('creditAmount');
        var ponto = input.value.split('.').length;
        if (ponto > 2)
                input.value=input.value.substr(0,(input.value.length)-1);
        
        input.value=input.value.replace(/[^0-9.-]/,'');

        if (ponto ==2)
	input.value=input.value.substr(0,(input.value.indexOf('.')+3));
	
	if(input.value == '.')
		input.value = "";
	
	}

	var dateToday = new Date(); 
	
	$(function() {
		  $('#expiryDateId').daterangepicker({
		    singleDatePicker: true,
		    localToday: dateToday,
		    showDropdowns: true,
		    autoUpdateInput: false,
		    minYear: 1901,
		    minDate: dateToday,
		    locale: {
		           format: 'YYYY-MM-DD'
		          }
		  
		  }, function (chosen_date) {        
			    $(this.element[0]).val(chosen_date.format('YYYY-MM-DD'));
		  
		  });
		  
	});


	$(document).on('click','#expiryFocus',function() {
		$("#expiryDateId").focus();
	});


	$(document).on('click','#expiryFocus1',function() {
		$("#expiryDateId1").focus();
	});
	

	$(function() {
		
		  $('#expiryDateId1').daterangepicker({
		    singleDatePicker: true,
		    showDropdowns: true,
		    autoUpdateInput: false,
		    minYear: 1901,
		    minDate: dateToday,
		    locale: {
		           format: 'YYYY-MM-DD'
		          }
		  
		  }, function (chosen_date) {        
			    $(this.element[0]).val(chosen_date.format('YYYY-MM-DD'));
		  
		  });
		  	
	});


	/*  DRAG & DROP */
	
	$('#dragDrop').sortable({
		start: function(event, ui) {
			angular.element(document.querySelector('[ng-controller="creditExpiryCtrl"]')).scope().itemTableSort();
		},
		stop: function(event, ui) {
			angular.element(document.querySelector('[ng-controller="creditExpiryCtrl"]')).scope().itemTableSort();
		}
	});

	
	$("#menuiconDA").hide();
	$(".tpMenu").addClass("menuShadow");
</script>
</html>
