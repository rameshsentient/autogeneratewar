<%@page import="java.util.*"%>
<%@page import="com.util.APIUtil"%>
<%
String DOC_LIST_URL = APIUtil.DOCLISTURL;
String DOC_ADD_UPDATE_URL = APIUtil.DOC_ADD_UPDATE_URL;

String DOC_INFO_URL = APIUtil.DOC_INFO_URL;

String DOC_DEL_URL = APIUtil.DOC_DEL_URL;
String DOC_KC_SEARCH_URL=APIUtil.DOC_KC_SEARCH_URL;
String ACCESS_INFO=APIUtil.ACCESS_INFO;


%>
<!DOCTYPE html>
<html>

<head>
	<!-- Start of sentientio Zendesk Widget script -->
	<script>/*<![CDATA[*/window.zE || (function (e, t, s) { var n = window.zE = window.zEmbed = function () { n._.push(arguments) }, a = n.s = e.createElement(t), r = e.getElementsByTagName(t)[0]; n.set = function (e) { n.set._.push(e) }, n._ = [], n.set._ = [], a.async = true, a.setAttribute("charset", "utf-8"), a.src = "https://static.zdassets.com/ekr/asset_composer.js?key=" + s, n.t = +new Date, a.type = "text/javascript", r.parentNode.insertBefore(a, r) })(document, "script", "35efafaf-9bd0-4f75-8c65-0dffd8aa28eb");/*]]>*/</script>
	<!-- End of sentientio Zendesk Widget script -->
	<title>Sentient IO</title>
	<meta charset="utf-8">
	<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/tableScroll.css">
	<link rel="stylesheet" href="resources/css/style.css">
	<style>
		body {
			/* background: #edeff1; */
			background-color: rgb(55, 53, 59);
			/* font-family: "Poppins", sans-serif; */
			color: #5b626b;
			font-size: 13px;
			font-weight: 400 !important;
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
	</script>
</head>

<body class="ng-scope" ng-app="loginApp" ng-controller="longCtrl" id="particles-js" id="submitLogin" >
	<div class="logContainr ng-scope">
		<div class="loginbox">
			<div class="dashLogo">
				<img src="resources/images/logo.png" alt="" style="width:200px;">
				<br/><br/>
			</div>
			<!-- <div class="welcome">
				<h4>Welcome!</h4>
				<span>Sign in to continue to Sentient</span>	
				<hr>	
			</div> -->
			<p class="warning" id="errorMsg" style="display:none">Invalid Client Id/ User name / Password.</p>
			<form class="ng-pristine ng-valid login-form-class form-group">
				<input name="" value="" type="hidden" class="form-control">
				<div>
					<label for="usr">Client ID</label>
					<input id="clientid" class="form-control" name="clientid" placeholder="Client ID" type="text" required>
				</div>
				<div>
					<label for="usr">User Name</label>
					<input id="username" class="form-control" name="username" placeholder="User name" type="text" required>
				</div>
				<div>
					<label for="usr">Password</label>
					<input id="password" class="form-control" name="password" placeholder="Password" type="password" required>
				</div>
				<div class="row">
					<!-- <div class="col-md-6">
						<input type="checkbox" class="custom-control-input" id="customControlInline">
						Remember me
					</div> -->

					<div class="col-md-12 form-sbmit logMargin-top">
						<button class="btn btn-primary1 btn-successcustom btnShow" id="submitLogin" onclick="validateForm()" >Login</button>
						<button class="btn btn-primary1 btn-successcustom btnHide" id="submitLogin" onclick="" >Login <i class="fa fa-spinner fa-spin"></i></button>
					</div>
				</div>
			</form>
			<div style="text-align: center;">
			<span>Don't have an account? <span style="color: #bc0000;cursor: pointer; text-align: center;" onclick="gotoRegister()">Sign up</span></span>
		</div>
		</div>
	</div>
</body>
<script src="resources/particles.js-master/particles.js"></script>
<script src="resources/particles.js-master/demo/js/app.js"></script>
<script src="resources/js/jquery.js"></script>


<script>

	$(".btnShow").show();
	$(".btnHide").hide();
	
	function gotoRegister() {
		location.href = "signup";
	}
	
	function test() {
		
		$(".btnShow").hide();
		$(".btnHide").show();
		
		var data = {
			username: document.getElementById("username").value,
			password: document.getElementById("password").value,
			clientid: document.getElementById("clientid").value
		}

		//alert(JSON.stringify(data));

		$.ajax({
			type: 'POST',
			url: "loginAuth",
			data: JSON.stringify(data),
			dataType: 'json',
			contentType: "application/json",
			success: function (resultData) {
				if (resultData == 0) {
					$('#errorMsg').show();
					$(".btnShow").show();
					$(".btnHide").hide();
				}
				else {
					location.href = "dashboard";
				}
			}
		})
	}

	function validateForm(){
		var usrName = document.getElementById("username").value;
		var paswd = document.getElementById("password").value;
		var clntId = document.getElementById("clientid").value;
		
		if (usrName && paswd && clntId){
			test();	
		}
	}
	
	$('#submitLogin').onEnterKey(function(){
		validateForm();
    });

</script>

<!-- Angular Material requires Angular.js Libraries -->

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.js"></script>
<script src="resources/org/js/ngStroge.min.js"></script>
<script src="resources/controller/loginController.js"></script>


</body>

</html>
