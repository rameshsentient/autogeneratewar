<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("CONTRACT_LIST"));

String API_CONTRACT_LIST = APIUtil.API_CONTRACT_LIST;

String publicKey = session.getAttribute("publicKey").toString();
String SUB_LIST_VALPAIR_URL = APIUtil.SUB_LIST_VALPAIR_URL;
%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var API_CONTRACT_LIST = "<%=API_CONTRACT_LIST%>";
var publicKey = "<%=publicKey%>";
var SUB_LIST_VALPAIR_URL = "<%=SUB_LIST_VALPAIR_URL%>";

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
  <link rel="stylesheet" href="resources/css/New-style.css">
  <link rel="stylesheet" href="resources/css/New-table-styls.css">
  
  <style type="text/css">
  </style>
  	
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
    rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    
    <link rel="stylesheet" href="resources/css/datafed_style.css">
  	<link rel="stylesheet" href="resources/css/market.css">
  	<link rel="stylesheet" href="resources/css/contract.css">
  	
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
	<body ng-app="datafedApp" ng-controller="mycontractController" ng-cloak>
		<jsp:include page="new_header.jsp"></jsp:include>
		
    <!-- <div class="loadr" ng-show="loadeer"></div> -->
    <div class="loading-container" ng-show="loadeer">
        <div class="loading">
          <span>Loading...</span>
        </div>
        </div>
		
<div class="container-fluid Da-MS-top" style="margin-bottom: 10px;">
                   
<div class="table-responsive new-table ">
          <table class="table box table-hover table-list">
            <thead class="btn_bg font-weight-bold">
              <tr>
              	<th scope="col"><%=lbl.get("CONTRACT_LIST").get("DATE")%></th>
                <th scope="col"><%=lbl.get("CONTRACT_LIST").get("DATA_SCHEMA")%></th>
                <th scope="col"><%=lbl.get("CONTRACT_LIST").get("DATA_PROVIDER")%></th>
                <!-- <th scope="col">DATA CONSUMER</th> -->
                
                <th scope="col"><%=lbl.get("CONTRACT_LIST").get("PRICE")%></th>
                <th scope="col"><%=lbl.get("CONTRACT_LIST").get("STATUS")%></th>
            
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="contract in contractData" ng-click="goToDetailPage(contract)" style="cursor: pointer;">  
              	<td>{{contract.Record.datecreated| date:'dd MMM yyyy, HH:mm a'}}</td>
                <td>{{contract.Record.dsname}}</td>
                <td>{{contract.Record.dpname}}</td>
                <!-- <td>{{contract.Record.dcname}}</td> -->
                <td >{{contract.Record.finalprice | number:0}}</td>         
                <!-- <td class="fixed-width"><button class=" Negotiation">{{contract.Record.status}}</button></td> -->
                <td ><button> <i class="fas fa-circle fixed-status" ng-class="getStatusClass(contract.Record.status)"></i>{{getStatusChat(contract.Record.transactionstatus)}} <!-- <br>{{getStatusChat(contract.Record.messagedc)}} --></button></td>                
              </tr>
              
              <tr>
          		<td colspan="5" style="text-align: center; font-weight: bold; padding-top:20px" ng-show="!(contractData.length)"><%=lbl.get("CONTRACT_LIST").get("NO_RESULT")%></td>    	
              </tr>
              
            </tbody>
          </table>  
          </div>
          <%-- <div style="text-align: center; font-weight: bold; padding-top:20px" ng-show="!(contractData.length)"><%=lbl.get("CONTRACT_LIST").get("NO_RESULT")%></div> --%>      
        </div>
        
        <div ng-show="showLoadmoretext" style="padding: 20px; padding-left: 45%; color: #80808096"><%=lbl.get("CONTRACT_LIST").get("LOAD_MORE")%></div>
		<div ng-show="showEndPagetext" style="padding: 20px; padding-left: 45%; color: #80808096"><%=lbl.get("CONTRACT_LIST").get("NO_MORE_RESULT")%></div>
		
        
        </div>	
		
		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/datafedApp.js"></script>
		<script src="resources/controller/mycontractController.js"></script>
	</body>
		<script>
	$(function(){
		$('#datafedmenu').addClass('menu-active');
	})
	
	$(window).scroll(function (e){
	    var body = document.body;    
	    var scrollTop = this.pageYOffset || body.scrollTop;
	    if (body.scrollHeight - scrollTop === parseFloat(body.clientHeight)) {
	        angular.element(document.querySelector('[ng-controller="mycontractController"]')).scope().scrollingIsActiveRightNow()
	    }
	});


	$("#buycont").addClass("active");
</script>

</html>
