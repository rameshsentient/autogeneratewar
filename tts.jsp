<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

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
	<body ng-app="asrApp" ng-controller="ttsController">
		<jsp:include page="new_header.jsp"></jsp:include>
		
		<div class="container all-pageTopMargin">
			<div class ="titleInfo marginTop10" align="center">
				<h4 class="resul_Cnt" >Text to Speech</h4>
			</div>	
				<br/><br/>
				<div align="center">
					<div style="border: 1px solid #a4c158;height:160px;width:390px" align="center">
						<textarea ng-model="text" placeholder="Enter a text for speech" rows="7" cols="46" style="border: 0px; resize: none;"></textarea>
					</div>
					<br/>
					<button type="button" class="btn btn-successcustom" ng-click="getSpeech()">Get Speech</button>
					<br/><br/>
					<div align="center">
					<audio controls id="myAudio">
					  <source id="mySource" src="#" type="audio/mpeg">
					Your browser does not support the audio element.
					</audio>
					</div>
				</div>
													
		</div>		
		
		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/asrApp.js"></script>
		<script src="resources/controller/ttsController.js"></script>
	</body>
		<script>
	$(function(){
		$('#pageprofile').addClass('active');
	})
</script>
