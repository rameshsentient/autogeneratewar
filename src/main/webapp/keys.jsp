<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("RSA_GENERATE_KEYS"));

String API_CONTRACT_LIST = APIUtil.API_CONTRACT_LIST;

String publicKey = session.getAttribute("publicKey").toString();
%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var API_CONTRACT_LIST = "<%=API_CONTRACT_LIST%>";
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
  <link rel="stylesheet" href="resources/css/New-style.css">
  
  <style type="text/css">

  .copyClipboard{
	    font-size: 17px !important; 	
    	color: #777;
	}
	textarea{
		background-color: #fff!important;
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
	<body ng-app="datafedApp" ng-controller="keysController" style="font-family: avenir roman; font-size: 14px; color: #4f5671" >
		<jsp:include page="new_header.jsp"></jsp:include>
		
		<!-- <div class="loadr" ng-show="loadeer"></div> -->
		<div class="loading-container" ng-show="loadeer">
				<div class="loading">
				  <span>Loading...</span>
				</div>
			  </div>
		
		<div class="container-fluid paddingLR30 pageTBMargin80 padding0"> 
		    <div class="col-md-12">
		        <div class="for-market-area"  style="margin-top:30px;">
		            <h4 class="btn_bg lable"><%=lbl.get("RSA_GENERATE_KEYS").get("TITLE")%></h4>
		            <div class="box padding20">
		            
		            <div class="form-horizontal">
				        <label><%=lbl.get("RSA_GENERATE_KEYS").get("SIZE")%></label> 
				        <input  id="keysize1" type="radio" name="keysize" value="512" disabled="disabled"/> <%=lbl.get("RSA_GENERATE_KEYS").get("SIZE_1")%>
				        <input checked id="keysize2" type="radio" name="keysize" value="1024"/> <%=lbl.get("RSA_GENERATE_KEYS").get("SIZE_2")%>
						<br>
						<br>
				    	<button type="button" ng-show ="isloading" class="btn btn-successcustom" ng-click="generatekeys()"><%=lbl.get("RSA_GENERATE_KEYS").get("GENERATE")%> </button>
				    	<button type="button" ng-hide ="isloading" class="btn btn-successcustom" ><%=lbl.get("RSA_GENERATE_KEYS").get("GENERATE")%> <i class="fas fa-spinner fa-spin"></i> </button>
				    
				    </div>
						            
		            
		            <div class="row">
					 <div class="col-md-6">                
                <div class="marginTop20">
                	<label><%=lbl.get("RSA_GENERATE_KEYS").get("PUBLIC_KEY")%></label> 
					<i class="fa fa-copy" id="txtpubkey1" type="button" ng-click="myCopy2('a')" data-toggle="tooltip"  title="copy" ng-click="copytoclipboard()" class="btn btn-primary btn-xs" ng-if="keypairs.publicKey.length>0"></i>				  
				 </div>
				  <textarea ng-model="keypairs.publicKey" class="form-control animated" rows="10" name="publickeyparam" id="publickeyparam" readonly >
  					 {{keypairs.publicKey}}
  				  </textarea>
				  </div>
				  <div class="col-md-6">
				  <div class="marginTop20">
				  	<label><%=lbl.get("RSA_GENERATE_KEYS").get("PRIVATE_KEY")%></label> 
				  	<i class="fa fa-copy" id="txtpubkey2" type="button" ng-click="myCopy2('b')" class="btn btn-primary btn-xs" data-toggle="tooltip"  title="copy" ng-if="keypairs.privateKey.length>0"> </i>
				  </div>
				    <textarea ng-model="keypairs.privateKey" class="form-control animated" rows="10" name="privatekeyparam" id="privatekeyparam" readonly>
   					{{keypairs.privateKey}}
			        </textarea>
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
		<script src="resources/js/ngClickCopy.js"></script>
		<script src="resources/controller/keysController.js"></script>
	</body>
		<script>
	$(function(){
		$('#datafedmenu').addClass('menu-active');
		$("body").tooltip({ selector: '[data-toggle=tooltip]' });
	})
	
	$("#tools").addClass("active");
</script>

</html>