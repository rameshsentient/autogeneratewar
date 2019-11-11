<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("CONTRACT_LIST"));

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
	  <style>
		  .fa-exclamation-circle{
	font-size: 35px!important;
    color: #d02f30!important;
    vertical-align: middle!important;
}
		  .alert-icon{
	/* padding: 21px 10px 24px 10px!important; */
	padding: 8px 5px 14px 7px!important;
	/* padding: 9px 8px 12px 9px!important; */
    /* border: 1px solid gray; */
    border-radius: 50%;
    vertical-align: middle;
	background: #f9e4e4;
}
	  textarea{
		background-color: #fff!important;
	} 
	.checkSuccess1{
		border-radius: 50px;
    /* height: 64px; */
    vertical-align: middle;
    display: inline-block;
    padding:6px;
    background: #e7eecb;
		}
		.check-circle{
			font-size: 32px!important;
		}
		.para-text{
			font-size: 18px!important;			
		}
			textarea{
			  background-color: #fff!important;
		  } </style>
</head>
	<body ng-app="datafedApp" ng-controller="decodeController" style="font-family: avenir roman; font-size: 14px; color: #4f5671" >
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
		            <h4 class="btn_bg lable">Decrypt Text</h4>
		            <div class="box padding20" >
		            
		             <label>Decode your text by using RSA Private Key</label> 
		            <div class="row">
					 <div class="col-md-6">
				
                <div class="marginTop20">
					<label>Encoded Text </label></div>
        		
					  <textarea ng-model = "encodedtext" class="form-control animated" rows="10" name="publickeyparam" id="publickeyparam">
       					
       					 </textarea>
					  </div>
					  <div class="col-md-6">
					
					  <div class="marginTop20"><label>Private Key </label></div>
					 
					    <textarea ng-model="privatekey" class="form-control animated" rows="10" name="privatekeyparam" id="privatekeyparam">
    					
				        </textarea>
				       </div>
				      </div>
				      <br>
				       
				    <div align="right"><button type="button" ng-show="isloading" class="btn btn-successcustom" data-toggle="modal" data-target="#decode-text" ng-click="decodetext()">Decode Text</button>
				     <button type="button" ng-hide="isloading" class="btn btn-successcustom">Decode Text <i class="fas fa-spinner fa-spin"></i></button>
					</div>
					
					  <div ng-if="decryptedtext.length>0"> <label>Decrypted Text </label>
						<i class="fa fa-copy" id="txtpubkey1" ng-click="myCopy2()" class="btn btn-primary btn-xs" data-toggle="tooltip" title="copy"></i>		
					  	<!-- <span ng-click="myCopy2()" class="btn btn-primary btn-xs">
					  		<i class="fas fa-copy"></i>
					  	</span> -->
					  	</br>
						<div wraptext > 
								<div style= "word-wrap: break-word";>
									<textarea class="form-control animated" rows="4" ng-model="decryptedtext" id="origtext" style="background-color: #eee;">
    									{{decryptedtext}}
    								</textarea>
								</div> 
							</div>
					  
					  </div>
		            
		            </div> 
		       </div>	
		       
		    </div>
		</div>
		





		<div class="modal fade"  id="decode-text" role="dialog">
				<div class="modal-dialog">
				
				  <!-- Modal content-->
				  <div class="modal-content" style="padding: 20px;">
					<div class="modal-header" style="border-bottom:none;">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					   <h4 class="modal-title">
						<p ng-if="statusMessage=='failure'"> <span class="alert-icon"><i class="fa fa-exclamation-circle"></i></span> <span style="font-size: 35px; font-weight: bold; vertical-align: middle;  color: #333;">{{ statusMessage }}</span></p>					
						<p ng-if="statusMessage!='failure'"><span class="checkSuccess1"><i class="fas fa-check-circle check-circle"></i></span> <span style="font-size: 35px; font-weight: bold; vertical-align: middle;  color: #333;">{{ statusMessage }}</span></p>	
				</h4>
			
					</div>
					<div class="modal-body">
					<p class="para-text">{{ errorMessage }}</p>
					</div>
					<div class="modal-footer" style="border: none;">
					<div class="col-md-12 padding0" style="justify-content: right!important; text-align:right!important;">
					  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
		<script src="resources/controller/decodeController.js"></script>
	</body>
		<script>
	$(function(){
		$('#datafedmenu').addClass('menu-active');
		$("body").tooltip({ selector: '[data-toggle=tooltip]' });
		$('[data-toggle="tooltip"]').tooltip(); 
	})
$("#tools").addClass("active");
</script>

</html>