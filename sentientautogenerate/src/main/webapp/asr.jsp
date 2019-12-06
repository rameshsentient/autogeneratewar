<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

String ASR_DEMO = APIUtil.ASR_DEMO;
%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var ASR_DEMO = "<%=ASR_DEMO%>";

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
	<body ng-app="asrApp" ng-controller="asrController">
		<jsp:include page="new_header.jsp"></jsp:include>
		
		<div class="container all-pageTopMargin">
			<div class ="titleInfo marginTop10" align="center">
				<h4 class="resul_Cnt" >ASR-SG</h4>
			</div>
				<div align="center">
				<div class="">
					<div class="btn-alignn">
						<div id="recordDiv" style="display: inline-block;" align="center">
							<button id="record" class="btn btn-micRec startRec" >
							<i class="fa fa-microphone" class="recordButtonStyle"></i></button>
						</div>
						<div style="font-size:12px;">Press and hold until your request end</div>
						<!-- <img id="imgLoa"  src="ang-res/loading_spinner.gif" style="width :80px;"/> -->
						<!-- <div id="getTextDiv" style="display:none;">
							<button  class="btn btn-micRec startRec" id="base64" onclick="setLoder()">
							<i class="fa fa-microphone" class="recordButtonStyle"></i>&nbsp;stop</button>							
						</div> -->
						
					<!--   <div id="disableDiv" style="display:none;">
					   <button  class="btn btn-micDiasble startRec" id="disableRecord" style="margin-left:100px;">
					   <i class="fa fa-microphone" class="recordButtonStyle"></i></button>
					  </div> -->						
					</div>
				
				</div>
				</div>	
				<br/><br/>
				<div align="center">
					<div style="border: 1px solid #a4c158;height:160px;width:420px" align="left">
						<p class="outputText" style="display: inline;"><b>Output:</b></p>
						<p id="callTimeasr" class="outputText" style="display: inline;float:right"></p>
						<div id="outputText"></div>
					</div>
				</div>						
		</div>		
		
		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/asrApp.js"></script>
		<script src="resources/controller/asrController.js"></script>
	</body>
		<script>
	$(function(){
		$('#pageprofile').addClass('menu-active');
	})
</script>
</html>