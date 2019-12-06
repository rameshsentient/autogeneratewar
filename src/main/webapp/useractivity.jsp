<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("USERACTIVITY"));

String API_LOGIN_HISTORY = APIUtil.API_LOGIN_HISTORY;
String API_DOWNLOAD_LOGIN_CSV = APIUtil.API_DOWNLOAD_LOGIN_CSV;


String publicKey = session.getAttribute("publicKey").toString();
%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var API_LOGIN_HISTORY = "<%=API_LOGIN_HISTORY%>";
var API_DOWNLOAD_LOGIN_CSV = "<%=API_DOWNLOAD_LOGIN_CSV%>";
var publicKey = "<%=publicKey%>";

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
  .downloadHstry{
	  margin-bottom: 20px;
	  text-align: right;
  }
  .fa-download{
	padding: 4px 2px;
    font-size: 20px;
	color: #fff!important;
	  }
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
	<body ng-app="datafedApp" ng-controller="userActivityController" style="font-family: avenir roman; font-size: 14px; color: #4f5671" >
		<jsp:include page="new_header.jsp"></jsp:include>

		<!-- <div class="loadr" ng-show="loadeer"></div> -->
		<div class="loading-container" ng-show="loadeer">
		<div class="loading">
		<!-- <span>Loading...</span> -->
		</div>
		</div>
	
		<div class="container-fluid paddingLR30  padding0" style="margin-top: 50px">
			<h4 class="btn_bg lable"><%=lbl.get("USERACTIVITY").get("USER_ACTIVITY")%></h4>
			<div class="col-md-12 padding20 box">
					<div class="downloadHstry">
							<a ng-click="getFileUrl()"  title="Download History"><button class="btn btn-successcustom"style="cursor:pointer;" >
									<i class="fa fa-download" aria-hidden="true" style="color: #54565f;"></i>									
										</button> 
									</a>
									
				<div class="col-md-3 paddingLeft0">
					<div style="text-align: center; padding-top: 8px !important; font-size: 14px; font-weight: bold;">
						 <select class="form-control" ng-model="duration"  ng-init="duration='current'" ng-change="getUserActivityDetails()" style="cursor:pointer">
							<option value="current" >Current month</option>
							<option value="last_month" >Last month</option>
							<option value="third_month" >Three months</option>
							<option value="six_month" >Six months</option>
						</select>
					</div>
				</div>
									
					</div>
				
					
				<div  class="table-responsive table-hover table-bottom border-box-table">
					<!-- <table class="table table-striped table-hover"> -->
					
					
			
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col"><%=lbl.get("USERACTIVITY").get("USER_NAME")%></th>
								<th scope="col"><%=lbl.get("USERACTIVITY").get("LOGIN_TIME")%></th>
								<th scope="col"><%=lbl.get("USERACTIVITY").get("LOGOUT_TIME")%></th>
							</tr>
						</thead>
						
						<tbody>
							<tr ng-repeat="activity in userActivityDetails" ng-show="userActivityDetails.length > 0">  
								<td>{{activity.userName}}</td>
								<td>{{activity.loginDateTime}}</td>
								<td ng-if="activity.logoutDateTime">{{activity.logoutDateTime}}</td>
								<td ng-if="!(activity.logoutDateTime)"><%=lbl.get("USERACTIVITY").get("SESSION_TIMEOUT")%></td>         
							</tr>
						  
						  	<tr ng-show="userActivityDetails.length < 1">
								<td colspan="3" style="text-align: center; font-weight: bold; padding-top:20px"><%=lbl.get("USERACTIVITY").get("NO_DATA_FOUND")%></td>
						  	</tr>
						  
						</tbody>
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
	<script src="resources/controller/userActivityController.js"></script>
	<script>
	$(".tpMenu").addClass("menuShadow");
	$("#menuiconDA").hide();
	</script>
</body>

</html>