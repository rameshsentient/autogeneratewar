<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>
<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

String TTS = APIUtil.TTS;
%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var TTS = "<%=TTS%>";

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
  <style type="text/css">
  	.marginBottomt20{
  		margin-bottom: 20px;
  	}
  	
	
	.base64 { 
		background: red !important;
		background: -webkit-radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%) !important; 
		background: -moz-radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%) !important; 
		background: radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%) !important; 
	}
	.outputText{
		font-size:15px;
		padding:10px;
	}
	
	#disableRecord{ 
  background: gray;
  background: -webkit-radial-gradient(center, ellipse cover, #363030 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
  background: -moz-radial-gradient(center, ellipse cover, #363030 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
  background: radial-gradient(center, ellipse cover, #363030 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
 }  	
  </style>
  	
  	<link rel="stylesheet" href="resources/js/asr/style.css">
	<script src="resources/js/asr/recorder.js"></script>
	<script src="resources/js/asr/Fr.voice.js"></script>
	<script src="resources/js/asr/jquery.js"></script>
	<script src="resources/js/asr/app.js"></script>  
</head>
	<body ng-app="asrApp" ng-controller="directorysearchCtrl">
		<jsp:include page="new_header.jsp"></jsp:include>
		
		<div >
			<!-- <div class="loadr" ng-if="loader"></div> -->
			<div class="loading-container" ng-if="loader">
				<div class="loading">
				</div>
			  </div>
			<section class="wrapper searchPage" ng-show="searchMain">
				<div class="container-fluid all-pageTopMargin">
					<div class="col-sm-6 searcBx col-sm-offset-3">
						<br>
						<div class="search_panel">
							<form class="search_inpt" novalidate>
								<input type="text" ng-model="searchKey" placeholder="Search" required> 
								<button type="submit" ng-click="getDirectorySearchData()"><i class="fa fa-search"></i></button>
							</form>
						</div>
					</div>
					<div class="col-sm-2 searcBxQuery">
						<span><a href="https://peristera.atlassian.net/wiki/spaces/SEN/pages/268369921/Search+Query+Language" target="_blank"><i class="fa fa-info-circle"></i><span class="queryHelp">Query Help</span></a></span>
					</div>
				</div>
			</section>
			
			<section class="wrapper searhcLis" ng-show="searchResult">
				<div class="container">				
					<div class="sear_res">
						     	<form novalidate class="search_inpt pageSearchBx pull-left">
						     	 	<input type="text" placeholder="search" ng-model="searchKey" style="text-align: left;" required>
						      		<button type="submit" ng-click="getDirectorySearchData()"><i class="fa fa-search"></i></button>
						     	</form>
						     	<div class="col-sm-2" style="margin-top: 15px;margin-left: 15px">						 
									<span><a href="https://peristera.atlassian.net/wiki/spaces/SEN/pages/268369921/Search+Query+Language" target="_blank"><i class="fa fa-info-circle"></i><span class="queryHelp">Query Help</span></a></span>
						
								</div>
						<div class="clearfix"></div>
						<br>
						<p class="resul_Cnt" ng-if="resultData.length>0">About <span  ng-if="resultData.length==20">top </span> <span>{{resultData.length}} results</span> for your searched content</p>
						
						<p class="resul_Cnt" ng-if="resultData.length<1">searching result not found</p>
						
						<div class="resul_bx" ng-repeat="row in resultData" style="word-wrap:break-word;">
							<p style="font-weight: bold;">{{row._source.name}}</p>
							<p>{{getShotDesc(row)}}</p>
							<p ng-show="viewPreview">{{row._source}}</p>
							<p class="pColor" style="cursor: pointer;" ng-show="viewPreview" ng-click="viewPreview=!viewPreview" >Collapse</p>
							<p class="pColor" style="cursor: pointer;"  ng-hide="viewPreview" ng-click="viewPreview=!viewPreview" >Expand</p>
						</div>
						
					</div>
				</div>
			</section>
		</div>
			
		
		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/asrApp.js"></script>
		<script src="resources/controller/directorysearchCtrl.js"></script>
	</body>
		<script>
	$(function(){
		$('#pageprofile').addClass('active');
	})
</script>
