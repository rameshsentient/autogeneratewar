<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> labelMap = ((Map<String, Map<String, String>>) session.getAttribute("API_DASH"));



String ASR_DEMO = APIUtil.ASR_DEMO;
String API_METTERING_DASHBOARD = APIUtil.API_METTERING_DASHBOARD;
String API_ENDPOINT_STATUS = APIUtil.API_ENDPOINT_STATUS;

String ORG_INFO = APIUtil.ORG_INFO; 
String ACCESS_INFO=APIUtil.ACCESS_INFO;
String ACCESS_INFO_ORG_DA=APIUtil.ACCESS_INFO_ORG_DA;

%>
<script>

var orgid=<%= session.getAttribute("loginOrgId")%>;
var ASR_DEMO = "<%=ASR_DEMO%>";
var API_METTERING_DASHBOARD = "<%=API_METTERING_DASHBOARD%>";
var API_ENDPOINT_STATUS = "<%=API_ENDPOINT_STATUS%>";
var ORG_INFO = "<%=ORG_INFO%>";
var ACCESS_INFO = "<%=ACCESS_INFO%>";
var ACCESS_INFO_ORG_DA = "<%=ACCESS_INFO_ORG_DA%>";


</script>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sentient</title>
  <meta charset="utf-8">
  <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
	rel="stylesheet" />
  <link rel="stylesheet" href="resources/css/bootstrap.css">
  <link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="resources/css/search.css">
	<link rel="stylesheet" href="resources/css/datafed_style.css">
	<link rel="stylesheet" href="resources/css/mob-res.css">
	
  <style type="text/css">
  	.marginBottomt20{
  		margin-bottom: 20px;
  	}
  	.chart-box{
			height: 350px; 
			color:white;
			background-color: white;
			border-radius: 5px;
			box-shadow: 0px 0px 11px -2px rgba(114,123,158,1);
			overflow: auto;
		}
		.chart-box-in{
			background-color: #54565f;
		 text-align: left; 
			font-weight: bold;
			padding:20px;
		}
	.outer-box{
		padding: 15px;
    border: 1px;
    border-color: #F4F7F6;
    border-style: solid;
    display: block;
    border-radius: 5px;
		background-color: #F4F7F6;
		box-shadow: 0px 0px 11px -2px rgba(114,123,158,1);
	}
/* ====================== DASHBOARD DESIGN=================================== */
.btn100{
width:100%;
}
.dashboard-panel>.panel-heading {
	padding: 15px 15px!important;
	border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}
.panel-body{
	padding:15px 60px!important;
}
.dashboard-panel>.panel-body{
	height: 150px;
}
.panel-body-red{
    background-color: #fae5e5;
}
.panel-body-green{
	background-color:#e8efcc;
}
.panel-body-almond{
	background-color:#f4eee5;
}

.panel-logo{
	text-align: center;
	text-align: center;
    height: 190px;
    /* vertical-align: middle; */
	background: white;
}
.panel-logo-almond {
	text-align: center;
	text-align: center;
    height: 190px;
    /* vertical-align: middle; */
	background: white;
}
/* --------------BG------------------- */
.panel-red{
	background-color: #d40000;
}
.panel-green{
	background-color:#abc445;
}
.panel-almond{
	background-color:#c7a980;
}
/* --------------BTN------------------- */
.panel-red-btn{
	background-color: #a90000;
	border:1px solid #a90000;
	color: #ffffff;
}
.panel-red-btn:hover{
	background-color: #e04c4c;
	border:1px solid #e04c4c;
	color: #ffffff;
}
.panel-green-btn{
	border:1px solid  #6e7f28;
	background-color: #6e7f28;
	color: #ffffff;
}
.panel-green-btn:hover{
	border:1px solid  #c4d683;
	background-color: #c4d683;
	color: #ffffff;
}
.panel-almond-btn{
	background-color: #a28868;
	border:1px solid  #a28868;
	color: #ffffff;
}
.panel-almond-btn:hover{
	background-color: #d3bb9b;
	border:1px solid  #d3bb9b;
	color: #ffffff;
}
/* --------------Info BTN------------------- */
.info-btn-almond{
	border: 2px solid #a28868;
	color: #a28868;
}
.info-btn-red{
	border: 2px solid #d40000;
	color: #d40000;
}
.info-btn-green{
	border: 2px solid #abc445;
	color: #abc445;
}
/* --------------------------------- */
.panel-desc{
	font-size: 17px;
    padding-left: 40px;
    padding-right: 40px;
    color: gray;
    line-height: 1;
    padding-top: 10px;
    height: 60px;
}
.panel{
	margin-bottom: 0!important;
}
.more-info{
	font-size: 12px;
    color: #d52128;
    position: absolute;
    top: 28px;
    padding: 20px;
	right: 12px;
	cursor: pointer;
}
.more-info-green{
	font-size: 12px;
    color: #999966;
    position: absolute;
    top: 28px;
    padding: 20px;
	right: 12px;
	cursor: pointer;
}
.more-info-almond{
	font-size: 12px;
    color: #a28868;
    position: absolute;
    top: 28px;
    padding: 20px;
	right: 12px;
	cursor: pointer;
}
.btn-lg-custom{
	padding: 16px 16px;
	font-size: 17px!important;
	}
.logo-img{
padding-top:37px;
}
.plan-type{
	color:#999999;
}
.plan-name-green{
	color: #abc445;
	font-size: 25px;
}
.plan-name-red{
	color: #d40000;
	font-size: 25px;
}
.plan-name-almond{
	color: #a28868;
	font-size: 25px;
}
@media screen and (min-width:768px) and (max-width:1024px){
	.plan-name-almond{
	color: #a28868;
	font-size: 250px!important;
}
}
.btn_bg {
text-align: left;
}
/* ====================== END=================================== */

	
  </style>
  	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.min.css" />	      	 
</head>


	<body ng-app="asrApp" ng-controller="apiDashController" ng-cloak style=" background-color: #f6f6f6;">
	
		
		<jsp:include page="new_header.jsp"></jsp:include>
		
	<div class="loading-container" ng-show="loadeer">
		<div class="loading">
		<span>Loading...</span>
		</div>
	</div>
	<div class="container-fluid paddingLR30  paddingTop0 padding0" style="margin-top:40px;" >
	<div style="margin-top: 20px;" ng-app="asrApp" ng-controller="apiDashController" ng-cloak>	
		<div class="loading-container" ng-show="loadeer">
			<div class="loading">
			<span>Loading...</span>
			</div>
		</div>		
		<div class="box no-padding" style="border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
			<div class ="titleInfo marginTop10">
				<h4 class="btn_bg textLeft"><%=labelMap.get("API_DASH").get("AD_HEADING")%></h4>
			</div>
			
			<div class="row pad-15" style="margin-top:30px;">
				<div class="col-sm-6 col-md-5" style="padding: 0px 30px 0px 30px;">
					<div id="reportrange" class="form-control select-form-control border-class" style="text-align: left; border: 1px solid #ede7e7; border-radius: 5px;	border-top-left-radius: 0px; border-bottom-left-radius: 0px; cursor: pointer;">
							<i class="fa fa-calendar"></i>&nbsp;
							<span class="dateElm"></span> 
							<!-- <i class="fa fa-caret-down"></i> -->
					</div>
				</div>
				<!-- <div class="col-sm-2 "><label> Start Date </label><input type="text" class="form-control" id="fromDate"  ng-model="fromDate"> <span class="fa fa-calendar" onclick="document.getElementById('fromDate').focus()" style="position: absolute;top: 35px; right: 25px;"></span></div>
				<div class="col-sm-2 "> <label> End Date</label> <input type="text" class="form-control" id="toDate" ng-model="toDate"><span class="fa fa-calendar" onclick="document.getElementById('toDate').focus()" style="position: absolute;top: 35px; right: 25px;"></span></div> -->
				<div class="col-sm-2 date-btn"><button type="button" class="btn btn-successcustom" style="background-color: #54565f;border-color: #54565f;" ng-click="setDefaultData()">Show</button></div>
				
			</div>
			
		
			<div id="mainDiv" style="padding: 20px 30px 0px 30px;">
				<div>				
				<h4 class="btn_bg textLeft"><%=labelMap.get("API_DASH").get("AD_CHART_TITLE1")%></h4>			
				<div id="barchart_material"class="chart-box pad-15" style="width: 100%; height: 300px"></div>
				</div>
				<br/>
			</div>	
					<div style="border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 20px 30px 0px 30px;">
						<div>
								<h4 class="btn_bg textLeft"><%=labelMap.get("API_DASH").get("AD_CHART_TITLE2")%></h4>
							<div ng-show="apiEndpointStatusData.length > 0" id="donutchart" class="chart-box" style="width: 100%; height: 300px; overflow:auto;"></div>
							<div ng-hide="apiEndpointStatusData.length > 0"  class="chart-box"  style="width: 100%;height:40px !important; padding:10px; text-align:center; color: #050505; overflow:auto;">No data found</div>
						</div>
					</div>
					<br/>
					
					<div style="border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 20px 30px 20px 30px;">					
							<h4 class="btn_bg textLeft"><%=labelMap.get("API_DASH").get("AD_CHART_TITLE3")%></h4>
							<div ng-show="apiEndpointStatusData.length > 0" class="chart-box pad-15"  style="width: 100%; height: 300px;">
							<table class="table table-striped">
								<thead>
									<tr>
										<th><%=labelMap.get("API_DASH").get("AD_PATH")%></th>
										<th><%=labelMap.get("API_DASH").get("AD_CALL")%></th>
									</tr>
								</thead>
								<tbody>
							      <tr ng-repeat="aedata in apiEndpointStatusData">
							        <td>{{aedata.endpoint}}</td>
							        <td>{{aedata.count}}</td>
							      </tr>	
								</tbody>
							</table>
							</div>
							<div ng-hide="apiEndpointStatusData.length > 0" class="chart-box pad-15"  style="width: 100%;height:40px !important; padding:10px; text-align:center; color: #050505; overflow:auto;">No data found</div>
							
						</div>
					
				
					</div>
			</div>
		</div>
	<!-- <div class="container-fluid paddingLR30  paddingTop0 padding0" style="margin-top: 75px;" >
		<div style="margin-top: 20px;">			
		<div class="box no-padding" style="border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
			<div class ="titleInfo marginTop10" align="left">
				<h4 class="btn_bg lable"><%=labelMap.get("API_DASH").get("AD_HEADING")%></h4>
			</div>
			
			<div class="row pad-15" style="margin-top:30px;">
				<div class="col-sm-2 "><label> Start Date </label><input type="text" class="form-control" id="fromDate"  ng-model="fromDate"> <span class="fa fa-calendar" onclick="document.getElementById('fromDate').focus()" style="position: absolute;top: 35px; right: 25px;"></span></div>
				<div class="col-sm-2 "> <label> End Date</label> <input type="text" class="form-control" id="toDate" ng-model="toDate"><span class="fa fa-calendar" onclick="document.getElementById('toDate').focus()" style="position: absolute;top: 35px; right: 25px;"></span></div>
				<div class="col-sm-2" style="padding-top: 25px;"><button type="button" class="btn btn-successcustom" style="background-color: #54565f;border-color: #54565f;" ng-click="setDefaultData()">Show</button></div>
				
			</div>
			<br/>
			<br/>
		</div>
			<div id="mainDiv">
				<div>				
				<h4 class="btn_bg"><%=labelMap.get("API_DASH").get("AD_CHART_TITLE1")%></h4>			
				<div id="barchart_material"class="chart-box pad-15" style="width: 100%; height: 300px"></div>
				</div>
				<br/>
</div>	
					<div class="box no-padding" style="border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
						<div>
								<h4 class="btn_bg"><%=labelMap.get("API_DASH").get("AD_CHART_TITLE2")%></h4>
							<div id="donutchart" class="chart-box" style="width: 100%; height: 300px; overflow:auto;"></div>
						</div>
					</div>
					<br/>
					
					<div class="box no-padding" style="border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">					
							<h4 class="btn_bg"><%=labelMap.get("API_DASH").get("AD_CHART_TITLE3")%></h4>
							<div  class="chart-box pad-15"  style="width: 100%; height: 300px;">
							<table class="table table-striped">
								<thead>
									<tr>
										<th><%=labelMap.get("API_DASH").get("AD_PATH")%></th>
										<th><%=labelMap.get("API_DASH").get("AD_CALL")%></th>
									</tr>
								</thead>
								<tbody>
							      <tr ng-repeat="aedata in apiEndpointStatusData">
							        <td>{{aedata.endpoint}}</td>
							        <td>{{aedata.count}}</td>
							      </tr>	
								</tbody>
							</table>
							</div>
							
						</div>
					
				
			
			</div>
		</div>	 -->
			<div id="nodataDiv" style="display: none;" align="center">
			<br/><br/><br/>	
			<%=labelMap.get("API_DASH").get("AD_NO_DATA_FOUND")%>
			</div>
		<br/><br/><br/>
	
		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>
	  	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>	  
		<script src="resources/js/daterangepicker.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/asrApp.js"></script>
		<script src="resources/controller/apiDashController.js"></script>
		<script src="resources/js/1.11.4-jquery-ui.js"></script>
		
		
	</body>
	<script>
		$(function(){
			$('#pageprofile1').addClass('active');
			
			$('#fromDate').datepicker({dateFormat: 'yy-mm-dd'});
			/*  $("#fromDate").datepicker("setDate", "-0d");*/
			$('#toDate').datepicker({dateFormat: 'yy-mm-dd'});
			$("#toDate").datepicker("setDate", "-0d");

			$(".tpMenu").addClass("menuShadow");
		})
		
		
	</script>
</html>