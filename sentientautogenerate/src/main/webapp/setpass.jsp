<%@page import="java.util.*"%>
<%@page import="com.util.APIUtil"%>
<%
String DOC_LIST_URL = APIUtil.DOCLISTURL;
String DOC_ADD_UPDATE_URL = APIUtil.DOC_ADD_UPDATE_URL;

String DOC_INFO_URL = APIUtil.DOC_INFO_URL;

String DOC_DEL_URL = APIUtil.DOC_DEL_URL;
String DOC_KC_SEARCH_URL=APIUtil.DOC_KC_SEARCH_URL;
String ACCESS_INFO=APIUtil.ACCESS_INFO;
String SET_PASSWORD=APIUtil.SET_PASSWORD;


%>
<!DOCTYPE html>
<html>

<head>
	<!-- Start of sentientio Zendesk Widget script -->
	<script>/*<![CDATA[*/window.zE || (function (e, t, s) { var n = window.zE = window.zEmbed = function () { n._.push(arguments) }, a = n.s = e.createElement(t), r = e.getElementsByTagName(t)[0]; n.set = function (e) { n.set._.push(e) }, n._ = [], n.set._ = [], a.async = true, a.setAttribute("charset", "utf-8"), a.src = "https://static.zdassets.com/ekr/asset_composer.js?key=" + s, n.t = +new Date, a.type = "text/javascript", r.parentNode.insertBefore(a, r) })(document, "script", "35efafaf-9bd0-4f75-8c65-0dffd8aa28eb");/*]]>*/</script>
	<!-- End of sentientio Zendesk Widget script -->
	<title>Sentient.io</title>
	<meta charset="utf-8">
	<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/tableScroll.css">
	<link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="resources/css/New-style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<style>
		body {
			/* background: #edeff1; */
			background-color: rgb(55, 53, 59);
			/* font-family: "Poppins", sans-serif; */
			color: #5b626b;
			font-size: 13px;
			font-weight: 400 !important;
		}
		
		.btn-successcustom {
			color: #ffffff;
		}
		.marginTop15{
			margin-top: 15px;
		}
		.loginbox{
			box-shadow: 0px 0px 8px 0px rgb(194, 197, 183);
		}
			.aButton {
    background-color: #414143;
    border: 1px solid #414143;
    color: #fff;
    padding: 6px 15px;
    border-radius: 3px;
    letter-spacing: 0.5px;
}
.aButton:hover,.aButton:focus{
				color: white!important;
	background-color: #707070!important;
	border: 1px solid #707070!important;;
    cursor: pointer;
			}
	</style>
	<script>
		var DOC_LIST_URL = "<%=DOC_LIST_URL%>";
		var DOC_ADD_UPDATE_URL = "<%=DOC_ADD_UPDATE_URL%>";
		var DOC_INFO_URL = "<%=DOC_INFO_URL%>";
		var DOC_DEL_URL = "<%=DOC_DEL_URL%>";
		var API_KEY = "";
		var API_USER_KEY = "";
		var DOC_KC_SEARCH_URL = "<%=DOC_KC_SEARCH_URL%>";
		var ACCESS_INFO = "<%=ACCESS_INFO%>";
		var SET_PASSWORD = "<%=SET_PASSWORD%>";
	</script>
</head>

<body class="ng-scope" ng-app="datafedApp" ng-controller="setPassController" style="background-color: #ffffff">
	<div class="logContainr ng-scope">
		<div class="loginbox">
			<div class="dashLogo">
				<img src="resources/images/logo.png" alt="" style="width:200px;">
				<br/><br/>
			</div>
			
			
			<h4 for="usr" style="color: #bc0000; font-weight: bold;">Create a password for your account</h4><br>
			
			<form class="ng-pristine ng-valid login-form-class form-group">
				<input name="" value="" type="hidden" class="form-control">
				<div>
					<label for="usr">Password <span class="warning" ng-show="passwordRequired && !confirmPasswordRequired">Password is required</span></label>
					<input id="password" class="form-control" ng-model="pwdObj.password" placeholder="New password" type="password">
				</div>
				
				<div class="marginTop15">
					<label for="usr">Confirm password  <span class="warning" ng-show="!passwordRequired && confirmPasswordRequired">Confirm Password is required</span>
					</label>
					<input id="confirmpassword" class="form-control" ng-model="pwdObj.confirmpassword" placeholder="Confirm password" type="password">
				</div>
				
				<br>
				<p class="warning" ng-show="passwordRequired && confirmPasswordRequired">Password and Confirm Password is required</p>
				<p class="warning" ng-show="notMatching && !passwordRequired && !confirmPasswordRequired">Password and Confirm Password is not matching</p>
				<p class="warning" ng-show="patternNotMatch">Password must contain at least 8 characters and mixture of alphanumeric characters with at least one or more special characters, numbers, upper and lower case.</p>
				
				<div class="row">
					<div class="col-md-12 logMargin-top " style="text-align: right;">
						<button style=" font-style: normal;" ng-hide="isclicked" class="btn btn-successcustom btnShow" id="submitLogin" ng-click="resetNewPassword()" >Submit</button>
						<button style=" font-style: normal;" ng-show="isclicked" class="btn btn-successcustom btnShow" id="submitLogin" >Submit <i class="fa fa-spinner fa-spin"></i></button>
					</div>
				</div>
			</form>

			
		</div>
	</div>
	
	
	<div class="modal fade center-modal" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="showmodal" aria-hidden="true">
		<div class="modal-dialog" role="document">
		  <div class="modal-content"  style="padding: 30px!important;">
		    <div class="modal-header resultModal" style="border: none;">
					<div>
							<span class="checkSuccess"> <i class="fas fa-check-circle"> </i></span>
							<span style="font-size:3rem;vertical-align: middle;font-weight:600;">&nbsp; Success </span>
							<p></p>
							<p></p>
						</div>
				<p class="para-text" ng-model="resultMessage">{{resultMessage}}</p>			
		  	</div>
		    <div class="modal-footer model-footerCenter" ng-show="showLoginBtn">
		      <button type="button" class="btn aButton btnShow btn-successcustom" style="width: 25rem;" data-dismiss="modal" ng-click="gotoLogin()" >login</button>
		    </div>
		    
		  </div>
		</div> 
	</div>	
</body>


<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.js"></script>	  
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<script src="resources/js/ngstorage.min.js"></script>
<script src="resources/js/datafedApp.js"></script>
<script src="resources/js/ngClickCopy.js"></script>
<script src="resources/controller/setPassController.js"></script>


</body>

</html>
