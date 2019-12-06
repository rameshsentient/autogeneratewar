<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

String ASR_DEMO = APIUtil.ASR_DEMO;
String API_INVOICE_LIST = APIUtil.API_INVOICE_LIST;
String API_DWN_INVOICE = APIUtil.API_DWN_INVOICE;
%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var ASR_DEMO = "<%=ASR_DEMO%>";
var API_INVOICE_LIST = "<%=API_INVOICE_LIST%>";
var API_DWN_INVOICE = "<%=API_DWN_INVOICE%>";

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
  		 font-weight: bold; 
  		 font-size: 22px; 
  		 padding: 10px;
  		 box-shadow: 0px 0px 11px -2px rgba(114,123,158,1);
  		}
  		
  	.headDiv {
  		background-color: #676974; 
  		color: #FFFFFF;
  		 border-top-right-radius:5px; 
  		 border-top-left-radius:5px;
  		 font-weight: bold; 
  		 font-size: 18px; 
  		 padding: 10px;
  		 box-shadow: 0px 0px 11px -2px rgba(114,123,158,1);
  		}
  	
  	.contentDiv {
  	
  		border: 1px solid #676974;  
  		border-bottom-right-radius:5px; 
  		border-bottom-left-radius:5px; 
  		padding: 10px; 
  		background-color : #FFFFFF;
  		box-shadow: 0px 0px 11px -2px rgba(114,123,158,1);
  		margin-bottom: 30px;
  		
  	}
  	
  	hr {
    margin-top: 5px !important;
    margin-bottom: 8px !important;
    border: 0;
    border-top: 1px solid #eee;
}
  	

  </style>
  	
</head>
	<body ng-app="datafedApp" ng-controller="invoiceController" ng-cloak>
		<jsp:include page="new_header.jsp"></jsp:include>
		<!-- <div class="loadr" ng-show="loadeer"></div> -->
		<div class="loading-container" ng-show="loadeer">
				<div class="loading">
				</div>
			  </div>		
		<div class="container-fluid paddingLR30  paddingTop0 padding0 box" style="margin-top: 60px">
			<div class ="titleInfo" >
				<h4 class="btn_bg" style="margin-top:0; text-align: left; padding-left: 22px;">Invoice</h4>
				
				<div ng-if="invoiceData.length<1" style="text-align: center;padding: 5px"><b>No data found.</b></div>
		
				<div ng-repeat="invoice in invoiceData" style="padding:20px;">
			      
					<table width="100%" style="color:#FFFFFF;">
						<thead>
                        <tr>
        
                            <td width="30%">
                            	<h4>&nbsp;&nbsp;<span ng-click="expand=!expand;" style="cursor: pointer;">
                            		<i ng-hide="expand || $index==0" class="fa fa-angle-down" aria-hidden="true"></i>
                            		<i ng-show="expand && $index>0" class="fa fa-angle-up" aria-hidden="true"></i>
                            		</span>&nbsp;&nbsp;Statement: {{invoice.INVOICE_DATE}}</h4>
                            </td>
                            <td align="center"> <h4>Invoice Number : {{invoice.ID}}</h4></td>
                            <td width="30%" align="right" style="font-size: 20px;">
                            	<span class="fa fa-download" ng-click="getDownloadURL(invoice.INVOICE_DATE)" style="cursor: pointer" ></span>&nbsp;&nbsp;&nbsp;
                            </td>
						</tr>
					</thead>
                    </table>
                  
                    <div class="table-bottom box table-responsive" ng-show="expand || $index<1">
	                <table width="100%"><tr><td width="100%" style="font-size: 18px;line-height: 2.5;"><b> &nbsp Credit Summary</b></td></tr></table>
					<hr>
                    <table width="100%" >
                   
                   <tr>
                        <td width="70%" align="left"  style="padding: 10px;"><b>Opening Balance</b></td>
                        <td width="30%" align="right"  style="padding: 10px;"><b>{{invoice.LAST_MONTH_BALANCE|number : 2}}</b></td>
                    </tr>
<!--                     <tr>
                        <td width="70%" align="left"  style="padding: 10px;">Positive entry
                        <a ng-hide="switchShow" ng-click="switchShow=!switchShow">Expand</a>
                        <a ng-show="switchShow" ng-click="switchShow=!switchShow">Collapse</a>
                        <ul style="margin-left: 50px;list-style-type: none;" ng-show="switchShow">
                        	<li ng-repeat="etry in invoice.POSITIVEENTRY" style="padding: 5px">
                        		<span>{{etry.ITEM}}</span>
                        		<span style="float: right;">{{etry.CREDIT|number : 2}}</span>
                       		</li>
                        </ul>
                        
                        </td>
                        <td width="30%" align="right"  style="padding: 10px;">{{getPostiveEntryTotal(invoice.POSITIVEENTRY)|number : 2}}</td>
                    </tr> -->
                    <tr>
                        <td width="70%" align="left"  style="padding: 10px;">Marketing Credits</td>
                        <td width="30%" align="right"  style="padding: 10px;">{{invoice.MARKETINGFEE[0].CREDIT|number : 2}}</td>
                    </tr>
                    <tr ng-if="invoice.TOPUPS[0].CREDIT>0">
                        <td width="70%" align="left"  style="padding: 10px;">Credits Top-up</td>
                        <td width="30%" align="right"  style="padding: 10px;">{{invoice.TOPUPS[0].CREDIT|number : 2}}</td>
                    </tr>
                    <tr>
                        <td width="70%" align="left"  style="padding: 10px;">Refunds
                        <a ng-hide="switchShow1 || invoice.REFUNDS.length<1	" ng-click="switchShow1=!switchShow1">Expand</a>
                        <a ng-show="switchShow1" ng-click="switchShow1=!switchShow1">Collapse</a>
                        <ul style="margin-left: 50px;list-style-type: none;" ng-show="switchShow1">
                        	<li ng-repeat="refnd in invoice.REFUNDS" style="padding: 5px">
                        		<span>{{refnd.ITEM}}</span>
                        		<span style="float: right;">{{refnd.CREDIT|number : 2}}</span>
                       		</li>
                        </ul>
                        </td>
                        <td width="30%" align="right"  style="padding: 10px;">{{getRefundTotal(invoice.REFUNDS)|number : 2}}</td>
                    </tr>
                    <tr>
                        <td width="70%" align="left"  style="padding: 10px;">Adjustments</td>
                        <td width="30%" align="right"  style="padding: 10px;">{{invoice.ADJUSTMENTS[0].CREDIT|number : 2}}</td>
                    </tr>
                    <tr>
                        <td width="70%" align="left"  style="padding: 10px;">Spending for the month of {{invoice.INVOICE_DATE}}</td>
                        <td width="30%" align="right"  style="padding: 10px;">{{getSpendingTotal(invoice.NEGATIVEENTRY)|number : 2}}</td>
                    </tr>
                    <tr ng-if="invoice.EXPIRED.length>0">
                        <td width="70%" align="left"  style="padding: 10px;">Expired Credits</td>
                        <td width="30%" align="right"  style="padding: 10px;">{{invoice.EXPIRED[0].CREDIT|number : 2}}</td>
                    </tr>
                    <tr>
                        <td width="70%" align="left"  style="padding: 10px;">Membership Fee</td>
                        <td width="30%" align="right"  style="padding: 10px;">{{invoice.MEMBERSHIPFEE[0].CREDIT|number : 2}}</td>
                    </tr>
                   <!--  <tr ng-if="invoice.ORG_DISCOUNT_AMOUNT>0">
                        <td width="70%" align="left"  style="padding: 10px;">Organization Discount Amount</td>
                        <td width="30%" align="right"  style="padding: 10px;">{{invoice.ORG_DISCOUNT_AMOUNT|number : 2}}</td>
                    </tr> -->
                    <tr>
                        <td width="70%" align="left" style="padding: 10px;"><b>Closing Balance</b></td>
                        <td width="30%" align="right" style="padding: 10px;"><b>{{(getClosingBalance(invoice,getRefundTotal(invoice.REFUNDS),getSpendingTotal(invoice.NEGATIVEENTRY)))|number : 2}}</b></td>
                    </tr>

                    </table>
                    <hr>            

                               
	                <table width="100%"><tr><td width="100%" style="font-size: 18px"><b> &nbsp; Spending Details for the month of {{invoice.INVOICE_DATE}}</b></td></tr></table>
					<hr>  
					<table width="100%" ng-repeat="service in invoice.service">
	                    <tr>
	                        <td ng-if="service.NAME!='DATA_ALLIANCE'" col width="70%" align="left" style="padding-left: 10px;padding-bottom: 8px"><b>{{service.NAME}}</b></td>
	                        <td ng-if="service.NAME=='DATA_ALLIANCE'" width="70%" align="left" style="padding-left: 10px;"><b>Data Alliance</b></td>
	                        <td width="30%" align="right" style="padding-right: 10px;"><b>{{getApiTotal(service.SERVICES)|number : 2}}</b></td>
	                    </tr>
	                    <tr ng-show="service.NAME!='DATA_ALLIANCE'">
	                        <td width="70%" align="left" style="padding-left: 10px;">
								<span ng-repeat="subservice in service.SERVICES" style="margin-top: 10px">
									<span ng-if="subservice.FUNCTION_NAME">{{subservice.FUNCTION_NAME}}</span><br>
									<span style="font-size: 13px">
										<span style="padding-left: 10px;" ng-if="subservice.PLAN_NAME">{{subservice.PLAN_NAME}} </span>
										 {{subservice.PER_API_CALL_COST|number: 2}} credits/request 
										 <span ng-if="subservice.FREE_API_CALL">- first {{subservice.FREE_API_CALL}}/requests free</span>
										 <span style="padding-left: 10px" ng-if="subservice.DISCOUNT_AMOUNT>0">- @discounts ({{subservice.DISCOUNT_AMOUNT}}) credits</span>
										 <span style="float: right">{{subservice.CALL_USED}} Requests</span><br>
									 </span>
								 <br></span>
							 </td>
	                        <td width="30%" align="right" valign="top" style="padding-right: 10px;">
	                        	<span ng-repeat="subservice in service.SERVICES" style="margin-top: 10px">
                        		<br>
	                        	{{subservice.TOAL_API_AMOUNT|number : 2}}
	                        	<br><br></span>
                        	</td>
	                    </tr>
	                    <tr ng-show="service.NAME=='DATA_ALLIANCE'">
	                        <td width="70%" align="left" style="padding-left: 10px;">
							<span ng-repeat="subservice in service.SERVICES" style="margin-top: 10px"><br><span>{{subservice.FUNCTION_NAME}}</span><br></span></td>
	                        <td width="30%" align="right" style="padding-right: 10px;"><span ng-repeat="subservice in service.SERVICES" style="margin-top: 10px"><br>{{subservice.TOAL_API_AMOUNT|number : 2}}<br></span></td>
	                    </tr>  
	                    
	                    <tr>
	                    <td><hr></td>
	                    <td><hr></td>
	                    </tr>
	                                       
	                </table>
	         		
                 	<table width="100%">
	                  	<tr>
	                        <td width="70%" align="left" style="font-size: 16px; padding: 10px;"><b>Total Used Credits</b></td>
	                        <td width="30%" align="right" style="font-size: 16px; padding: 10px;"><b>{{invoice.TOTAL_COST|number: 2}}</b></td>
	                    </tr>
	                   
                    </table> 
                	</div>	
                		        
			         
			    </div>     				
									
		</div>		
		
		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/datafedApp.js"></script>
		<script src="resources/controller/invoiceController.js"></script>
	</body>
		<script>
	$(function(){
		$("#menuiconDA").hide();
		$(".tpMenu").addClass("menuShadow");
		
	})
</script>
</html>