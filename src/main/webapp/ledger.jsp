<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("TRANSACTIONS"));

String ASR_DEMO = APIUtil.ASR_DEMO;
String API_ENDPOINT_LEDGER = APIUtil.API_ENDPOINT_LEDGER;
String API_ENDPOINT_ADD_LEDGER = APIUtil.API_ENDPOINT_ADD_LEDGER;
String API_ENDPOINT_ORG_ACCOUNT_LIST = APIUtil.API_ENDPOINT_ORG_ACCOUNT_LIST;
String API_ENDPOINT_ORG_ALL_ACCOUNT_LIST = APIUtil.API_ENDPOINT_ORG_ALL_ACCOUNT_LIST;
String API_DWN_LEDGER = APIUtil.API_DWN_LEDGER;
String API_DA_GETEMAILID = APIUtil.API_DA_GETEMAILID;

int loginUsrId = (int) session.getAttribute("id");

%>
<script>
var API_ENDPOINT_LEDGER = "<%=API_ENDPOINT_LEDGER%>";
var API_ENDPOINT_ADD_LEDGER = "<%=API_ENDPOINT_ADD_LEDGER%>";
var API_ENDPOINT_ORG_ACCOUNT_LIST = "<%=API_ENDPOINT_ORG_ACCOUNT_LIST%>";
var API_ENDPOINT_ORG_ALL_ACCOUNT_LIST = "<%=API_ENDPOINT_ORG_ALL_ACCOUNT_LIST%>";
var API_DWN_LEDGER = "<%=API_DWN_LEDGER%>";
var API_DA_GETEMAILID = "<%=API_DA_GETEMAILID%>";

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
  
  
  <style type="text/css">
  
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

  	
</head>
	<body ng-app="datafedApp" ng-controller="ledgerController" ng-cloak>
		<jsp:include page="new_header.jsp"></jsp:include>
		
		<!-- <div class="loadr" ng-show="loadeer"></div> -->
		<div class="loading-container" ng-show="loadeer">
				<div class="loading">
				  <span>Loading...</span>
				</div>
			  </div>
		
		<div class="container-fluid paddingLR30  padding0" style="margin-top: 50px">
				<h4 class="btn_bg lable"><%=lbl.get("TRANSACTIONS").get("TITLE")%></h4>
			<div class="padding20 box">
				<div  class="row rowLR">
				<div class="col-md-3 paddingLeft0" ng-show="isSuperAdmin">
					<div style="text-align: center; padding-top: 8px !important; font-size: 14px; font-weight: bold;">
					 <select class="form-control" ng-model="organisationId" ng-change="setAccountData(organisationId)" style="cursor:pointer;">
						<option ng-repeat="org in orgList" value="{{org.orgId}}" >{{org.orgName}}</option>
					</select>
					</div>
				</div>
				<div class="col-md-3 paddingLeft0" >
					<div style="text-align: center; padding-top: 8px !important; font-size: 14px; font-weight: bold;">
					 <select class="form-control" ng-model="acId" ng-change="getLedgerTransaction()" style="cursor:pointer">
						<option ng-repeat="ac in accountData" value="{{ac.id}}" >{{ac.acNumber}} {{ac.orgName}} {{ac.acType}} <%=lbl.get("TRANSACTIONS").get("ACCOUNT")%></option>
					</select>
					</div>
				</div>
				<div class="col-md-3 paddingLeft0">
					<div style="text-align: center; padding-top: 8px !important; font-size: 14px; font-weight: bold;">
					 <select class="form-control" ng-model="duration"  ng-init="duration='current'" ng-change="getLedgerTransaction()" style="cursor:pointer">
						<option value="current" ><%=lbl.get("TRANSACTIONS").get("CUR_MONTH")%></option>
						<option value="last_month" ><%=lbl.get("TRANSACTIONS").get("PREV_MONTH")%></option>
						<option value="third_month" ><%=lbl.get("TRANSACTIONS").get("LAST_3_MONTH")%></option>
					</select>
					</div>
				</div>
				
				<div class="col-md-3 paddingLeft0" ng-show="!isSuperAdmin">
				</div>
				
				<div class="col-md-3 padding0">
					<div class="col-md-6 col-sm-12 " style="font-weight: bold;text-align-last: right;border: 1px solid #A4BD99;width: auto;float: right;border-radius: 5px;height: 36px;padding-top: 7px;margin-top:6px;">
						<p><%=lbl.get("TRANSACTIONS").get("ACC_BALANCE")%> : {{acBalance | number : 2}}</p>
					</div>
					
					<div ng-show="ledgerData.length > 0" class="col-md-6 col-sm-12" ng-click="getLedgerTransactionDownload()" style="cursor: pointer;font-weight: bold;text-align-last: right;border: 1px solid #A4BD99;width: auto;float: right;border-radius: 5px;height: 36px;padding-top: 7px; margin-right: 10px; margin-top:6px;">
						<i class="fa fa-download" style="padding-top: 5px;"></i>
					</div>
					
					<%-- <div ng-show="!isSuperAdmin" class="col-md-8 col-sm-12" style="font-weight: bold;text-align-last: right;border: 1px solid #A4BD99;width: auto;float: right;border-radius: 5px;margin-top: 7px;height: 36px;padding-top: 7px;margin-top:6px;">
						<p><%=lbl.get("TRANSACTIONS").get("ACC_BALANCE")%> : {{acBalance | number : 2}}</p>
					</div> --%>
					
				</div>
				
				<%-- <div ng-hide="isSuperAdmin" class="col-md-8 col-sm-12 btn btn-successcustom" style="font-weight: bold;text-align-last: right;margin-top: 7px;height: 35px; width: auto;float: right;background-color: #A4BD99;border-color:#A4BD99;">
					<p><%=lbl.get("TRANSACTIONS").get("ACC_BALANCE")%> : {{acBalance | number : 2}}</p>
				</div> --%>
				
				
				
				</div>
				<div>&nbsp;&nbsp;</div>
				
				<div  ng-show="isSuperAdmin" class="row rowLR" style="padding-bottom: 20px;">
					<!-- <div class="col-md-6 col-sm-12 paddingLeft0"> -->
					<div class="paddingLeft0" style="float:right;">
						<button class="btn btn-successcustom" ng-show="isSuperAdmin" ng-click="addCreditToAccount()" class="btn btn-default"><%=lbl.get("TRANSACTIONS").get("ADD_TRANS")%></button>						
					</div>
					
				</div>
				
				<!--  && =='Earning' && acBalance> 0 -->
				<div ng-show="!isSuperAdmin && acntType =='Earning' && acBalance> 10" class="row rowLR" style="padding-bottom: 20px;">
					<div class="paddingLeft0" style="float:left;">
						<button class="btn btn-successcustom" ng-click="payOutRequest()" class="btn btn-default">Payout Request</button>						
					</div>
				</div>
				
			
				<div class="row rowLR table-responsive border-box-table table-bottom">
					<table class="table table-hover table-striped ">
						<thead class="theadBG">
						<tr>
							<th>
						        <span ng-show="propertyName === 'dateTime'"></span>
					      	</th>
					      	<th>
						        <button ng-click="sortBy('item')" style="background: none; border: none; cursor: pointer;"><%=lbl.get("TRANSACTIONS").get("ITEM")%></button>
						        <span ng-show="propertyName === 'item'"></span>
					      	</th>
							<th><%=lbl.get("TRANSACTIONS").get("DESCRIPTION")%></th>
							<th style="text-align: right; padding-right: 20px;"><%=lbl.get("TRANSACTIONS").get("CREDIT")%></th>
						</tr>
					</thead>
						<tr ng-repeat="led in ledgerData | orderBy:propertyName:reverse" style="cursor:pointer;">
							<td nowrap>{{customDateFormat(led.dateTime) | date:'yyyy-MM-dd HH:mm'}}</td>
							<td nowrap ng-show="led.item=='ADD_BAL_MEMB_FEE'"><%=lbl.get("TRANSACTIONS").get("MEMBERSHIP_FEE")%></td>
							<td nowrap ng-show="led.item=='ADD_BAL_ADJUS'"><%=lbl.get("TRANSACTIONS").get("ADJUSTMENT")%></td>
							<td nowrap ng-show="led.item!='ADD_BAL_ADJUS' && led.item!='ADD_BAL_MEMB_FEE'">{{led.item}}</td>
							<td>{{led.description}}</td>
							<td style="text-align: right; padding-right: 20px;">{{led.credit | number : 0}}</td>							
						</tr>
						<tr ng-if = "!(ledgerData.length > 0)" >
							<td colspan="4" style="text-align: center; color: #333; font-weight: bold;"><%=lbl.get("TRANSACTIONS").get("NOT_FOUND")%></td>
						</tr>
						<!-- <tr style="text-align: center; font-weight: bold; padding-top:20px" ng-show="!(ledgerData.length)">Not Found</tr> -->
					</table>
				</div>
				</div>
				</div>
		
		</div>					
		</div>
		
		<div class="modal fade center-modal" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
		<div class="modal-dialog thanksModal" role="document">
		  <div class="modal-content">
		    <div class="modal-header">
		      <h4 class="font-weight-bold" ><%=lbl.get("TRANSACTIONS").get("ADD_ACC_BALANCE")%></h4>
		      <div class="modelContent">
		      <div class="form-group">
                <label ng-show="itemRequired" style="color: #000000"><%=lbl.get("TRANSACTIONS").get("ITEM")%><span style="color:red">*</span></label>
                <label ng-hide="itemRequired" style="color: #000000"><%=lbl.get("TRANSACTIONS").get("ITEM")%><span style="color:red">*</span><span style="color:Red; font-weight: normal; font-size: 14px;"><%=lbl.get("TRANSACTIONS").get("REQ")%></span></label>
               	<select class="form-control" ng-model="item" ng-click="getItems()" style="cursor:pointer">
					<option ng-repeat="itm in items" value="{{itm.code}}" >{{itm.value}}</option>
				</select>	
               </div>
		       <div class="form-group">
                  <label ng-show="creditRequired" style="color: #000000"><%=lbl.get("TRANSACTIONS").get("CREDIT_AMOUNT")%><span style="color:red">*</span></label>
                  <label ng-hide="creditRequired" style="color: #000000"><%=lbl.get("TRANSACTIONS").get("CREDIT_AMOUNT")%><span style="color:red">*</span><span style="color:Red; font-weight: normal; font-size: 14px;"> <%=lbl.get("TRANSACTIONS").get("REQ")%></span></label>
                  <input type="text" class="form-control float" id="creditAmount" onkeyup="return replacePonto()" ng-model="creditAmount" placeholder="0.00" />
               </div>
               <div class="form-group">
                  <label ng-show="descriptionRequired" style="color: #000000"><%=lbl.get("TRANSACTIONS").get("DESCRIPTION")%><span style="color:red">*</span></label>
                  <label ng-hide="descriptionRequired" style="color: #000000"><%=lbl.get("TRANSACTIONS").get("DESCRIPTION")%><span style="color:red">*</span><span style="color:Red; font-weight: normal; font-size: 14px; "> <%=lbl.get("TRANSACTIONS").get("REQ")%></span></label>
                  <textarea class="form-control" rows="3" ng-model="creditDescription" ></textarea>
               </div>
               <br/>		    
			    <div style="text-align:right;">
			    	<button type="button" class="btn btn-default uButton" style="margin-right:5px;" data-dismiss="modal" ng-show="addTransaction"><%=lbl.get("TRANSACTIONS").get("CLOSE")%></button>
			      	<button type="button" class="btn btn-successcustom" ng-show="addTransaction" ng-click="addLedgerTrans()"><%=lbl.get("TRANSACTIONS").get("ADD")%></button>
			      	<button type="button" class="btn btn-successcustom .btn-successcustom" ng-hide="addTransaction" ng-click=""><%=lbl.get("TRANSACTIONS").get("ADD")%> <i class="fas fa-spinner fa-spin"></i></button>
			    </div>
			    </div>
		    </div>
		    
		  </div>
		</div> 
		</div>		
		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/datafedApp.js"></script>
		<script src="resources/controller/ledgerController.js"></script>
		
		
		<div class="modal fade center-modal" id="topUpBtnMdl" tabindex="-1" role="dialog" aria-labelledby="topUpBtnMdl" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content" style="padding:20px!important;">
				<div class="modal-body" style="text-align: left;"> 
					<div class="">
						 <p class="para-text margintop20">Your request is been sent to the client service team, we will contact you shortly.</p>
					 </div>
					 </div>
					 
				<div class="modal-footer padding0">
					<div class="margintop20">
					<button type="button" class="btn btn-successcustom"style=" width: 20rem; background-color: #424143; border-color:#424143; color: white;" data-dismiss="modal">
						Cancel
				  </button>
				</div>	 		
			  </div>
			</div>
		  </div>
		</div> 
		
		
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

	$("#menuiconDA").hide();
	$(".tpMenu").addClass("menuShadow");
</script>

</html>
