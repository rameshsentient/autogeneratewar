<%@page import="java.util.*"%>
<%@page import="com.util.APIUtil"%>
<%
String DOC_LIST_URL = APIUtil.DOCLISTURL;
String DOC_ADD_UPDATE_URL = APIUtil.DOC_ADD_UPDATE_URL;

String DOC_INFO_URL = APIUtil.DOC_INFO_URL;

String DOC_DEL_URL = APIUtil.DOC_DEL_URL;
String DOC_KC_SEARCH_URL=APIUtil.DOC_KC_SEARCH_URL;
String ACCESS_INFO=APIUtil.ACCESS_INFO;
String RESET_PASSWORD_EMAIL = APIUtil.RESET_PASSWORD_EMAIL;


%>
<!DOCTYPE html>
<html>

<head>
	<!-- Start of sentientio Zendesk Widget script -->
	<script>/*<![CDATA[*/window.zE || (function (e, t, s) { var n = window.zE = window.zEmbed = function () { n._.push(arguments) }, a = n.s = e.createElement(t), r = e.getElementsByTagName(t)[0]; n.set = function (e) { n.set._.push(e) }, n._ = [], n.set._ = [], a.async = true, a.setAttribute("charset", "utf-8"), a.src = "https://static.zdassets.com/ekr/asset_composer.js?key=" + s, n.t = +new Date, a.type = "text/javascript", r.parentNode.insertBefore(a, r) })(document, "script", "35efafaf-9bd0-4f75-8c65-0dffd8aa28eb");/*]]>*/</script>
	<!-- End of sentientio Zendesk Widget script -->
	<title>Sentient.io (login page)</title>
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
		.marginTop20{
			margin-top:20px;
		}
		.marginTop15{
		margin-top: 15px;
		}
		
    label:focus-within{
        color:rgb(38, 38, 39);
	}
	
#login{
	display:block;
}
#admin-Qstn{
	display: none;
}
#if-yes{
	 display:none;
 }
 #email-send{
	display:none;
}
 #if-No{
	 display:none;
 }


.marginLeft15{
	margin-left:15px;
}

.container-radio {
    display: inline-block;
    position: relative;
    padding-left: 23px;
    margin-bottom: 12px;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }
  .BTS:hover{
text-decoration: underline;
color: #5b626b;
  }
  .BTS{
	color: #b9b9b9;
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
		var RESET_PASSWORD_EMAIL = "<%=RESET_PASSWORD_EMAIL%>";
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
			<div class="login-form" id="login">
			<p class="warning" id="errorMsg" style="display:none">Invalid Client Id/ User name / Password.</p>
			<form class="ng-pristine ng-valid login-form-class form-group" autocomplete="off" >
				<input name="" value="" type="hidden" class="form-control">
				<div>
					<label for="usr">Client ID</label>
					<input id="clientid" class="form-control" name="clientid" placeholder="Client ID" autocomplete="off"  type="text" required style="background: #FFFFFF;" readonly onfocus="this.removeAttribute('readonly');">
				</div>
				<div class="marginTop15"> 
					<label for="usr">User Name</label>
					<input id="username" class="form-control" name="username" placeholder="User name"  autocomplete="off"  type="text" required style="background: #FFFFFF;" readonly onfocus="this.removeAttribute('readonly');">
				</div>
				<div class="marginTop15">
					<label for="usr">Password</label>
					<input id="passwordd" class="form-control" name="passwordd" placeholder="Password" autocomplete="off"  type="password" required style="background: #FFFFFF;" readonly onfocus="this.removeAttribute('readonly');">
				</div>
				<div class="row marginTop15">
					<!-- <div class="col-md-6">
						<input type="checkbox" class="custom-control-input" id="customControlInline">
						Remember me
					</div> -->

					<div class="col-md-12 form-sbmit">
						<button class="btn btn-primary1 btn-successcustom btnShow" id="submitLogin" onclick="validateForm()" style="width:100%;" >Login</button>
						<button class="btn btn-primary1 btn-successcustom btnHide" id="submitLogin" onclick="" style="width:100%;" >Login <i class="fa fa-spinner fa-spin"></i></button>
					</div>
				</div>
			</form>
			<div class="col-md-7  col-sm-7 col-xs-7 padding0" style="text-align: left;">
			<span>Don't have an account? <span style="color: #bc0000;cursor: pointer; text-decoration: underline;" onclick="gotoRegister()">Sign up</span></span>
		</div>
		<div class="col-md-5 col-sm-5 col-xs-5 padding0" style="text-align: right;">
		 <span id="forgottext" style="color: #bc0000;cursor: pointer; text-align: right; text-decoration: underline;" ng-click="changeCssprop('login', 'forgot')">
		 Forgot password</span>
		</div>
		</div>
	<div class="forgot-psw" id="admin-Qstn"> 
		<form class="ng-pristine ng-valid login-form-class form-group">
				<input name="" value="" type="hidden" class="form-control">
				<p><h4 style="color: #bc0000; font-weight: bold;">Forgot password</h4></p> 
				<div class="marginTop20">
					<label for="usr">Are you the administrator of your organization?</label>
				</div>
				<label class="container-radio">Yes
					<input type="radio" ng-model="checkadmin" name="radio" value="Yes" ><span class="checkmark"></span>
				</label>
			  	<span style="padding-left:30px"></span>
			    <label class="container-radio">No
					<input type="radio" ng-model="checkadmin" name="radio" value="No" ><span class="checkmark"></span>
			    </label>
	
				<div class="schema_btns col-md-12 col-sm-12" style="margin-top: 20px; text-align: right; padding:0;">
					<button class=" BTS" style="border: none; padding: 0; background: none; padding: 20px 0px 20px 0;" data-dismiss="modal" ng-click="changeCssprop('admin-Qstn', 'gologin')">Back to sign in page</button>
					<button ng-show="!checkadmin" class="btn btn-successcustom marginLeft15" ng-disabled="!checkadmin" >Next</button>
					<!-- <button ng-show="checkadmin" class="btn btn-successcustom marginLeft15" ng-click="checkAdminStatus(checkadmin)">Next</button> -->
					
					
					<button ng-show="checkadmin" class="btn btn-successcustom marginLeft15" ng-click="changeCssprop('admin-Qstn', checkadmin)">Next</button>
		    	</div>
		</form>
		</div>

		<div class="forgot-psw" id="if-yes"> 
				<form class="ng-pristine ng-valid login-form-class form-group">
						<input name="" value="" type="hidden" class="form-control">
		
						<p><h4 style="color: #bc0000; font-weight: bold;">Forgot password</h4></p>
						
						<p ng-show="showErrorMsg" style="color: #bc0000; cursor: pointer;">{{errorMsg}}</p> 
						<p ng-show="!showErrorMsg"></p> 
							 
						<!-- <div class="marginTop20">
							<label for="usr">Are you the administrator of your organization?</label>
							</div>

							<label class="container-radio">Yes
								<input type="radio" name="radio" ng-model="isAdmin" value="YES" ng-change="adminorNot(isAdmin)"><span class="checkmark"></span>
    						</label>
						  	
						  	<span style="padding-left:30px"></span>
						  	<label class="container-radio">No
								<input type="radio" name="radio" ng-model="isAdmin" value="NO" ng-change="adminorNot(isAdmin)"><span class="checkmark"></span>
						  	</label> -->
			
					<div class="marginTop15">
						<label for="usr">Enter your Client ID</label>
						<input id="username" class="form-control" ng-model="clientId" name="username" placeholder="Client id" type="text" required>
					</div>
					<div class="marginTop15">
						<label for="usr">Enter your User Name/ Email ID</label>
						<input id="username" class="form-control" ng-model="email" name="username" placeholder="User name" type="text" required>
					</div>
					<div class="schema_btns col-md-12 col-sm-12" style="margin-top: 20px; text-align: right; padding:0;">
						<button class="BTS" style="border: none; padding: 0; background: none; padding: 20px 0px 20px 0;" data-dismiss="modal" ng-click="changeCssprop('if-yes', 'gologin')">Back to sign in page</button>
						<!-- <button ng-show="isAdmin && clientId && email" class="btn btn-successcustom marginLeft15" ng-click="sendEmailtoRestPass()">Send password reset link via email</button>
						<button ng-show="!isAdmin || !clientId || !email" class="btn btn-successcustom marginLeft15" ng-disabled="!isAdmin || !clientId || !email">Send password reset link via email</button> -->
						
						<button ng-show="clientId && email" class="btn btn-successcustom marginLeft15" ng-click="changeCssprop('if-yes', '')">Send password reset link via email</button>
						<button ng-show="!clientId || !email" class="btn btn-successcustom marginLeft15" ng-disabled="!clientId || !email">Send password reset link via email</button>
				    </div>
					</form>
				</div>
				<div class="forgot-psw" id="if-No"> 
						<form class="ng-pristine ng-valid login-form-class form-group">
								<input name="" value="" type="hidden" class="form-control">
				
								<p><h4 style="color: #bc0000; font-weight: bold;">Forgot password</h4></p> 
								<!-- <div class="marginTop20" ng-show="disableRad">
									<label for="usr">Are you the administrator of your organization?</label>
								</div>
								<label ng-show="disableRad" class="container-radio">	Yes
									<input type="radio" name="radio" ><span class="checkmark"></span>
							  	</label>
						  		<span style="padding-left:30px"></span>
								  <label ng-show="disableRad" class="container-radio">No
									<input type="radio" checked="checked" name="radio" ><span class="checkmark"></span>
								  </label> -->

<!-- 								
					<div class="radio-inline">
					  <label>
						  <input type="radio" name="optradio">Yes</label>
					</div>
					<div class="radio-inline">
					  <label>
						  <input type="radio" name="optradio">No</label>
					</div> -->
				<div class="marginTop20"> 
					<p>Kindly contact your administrator to reset your password. Your administrator is the person that provided you with your user name and password</p>
				</div>
					<div class="schema_btns col-md-12 col-sm-12" style="margin-top: 20px; text-align:right; padding:0;">
							<button class="btn btn-successcustom marginLeft5" ng-click="changeCssprop('if-No', 'tologin')">Back to sign in page</button>
						  </div>
							</form>
						</div>
				<div class="forgot-psw" id="email-send"> 
						<form class="ng-pristine ng-valid login-form-class form-group">
								<input name="" value="" type="hidden" class="form-control">
				
								<p><h4 style="color: #bc0000; font-weight: bold;">Recover Password</h4></p> 
								<div class="marginTop20">
									<label for="usr">An email with the password recovery link has been sent to your registered email account.
										</label>					
					<div class="schema_btns col-md-12 col-sm-12" style="margin-top: 20px; text-align: right; padding:0;">
							<button class="btn btn-successcustom marginLeft15" ng-click="changeCssprop('email-send', 'gologin')">Back to sign in page</button>
						  </div>
							</form>
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
	
	function loginAuth() {
		
		$(".btnShow").hide();
		$(".btnHide").show();
		
		
		var data = {
			username: document.getElementById("username").value,
			password: document.getElementById("passwordd").value,
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
				console.log(resultData);
				//alert(resultData);
				//resultData = JSON.parse(resultData)
				var retId = parseInt(resultData['id']);
				if (retId == 0) {
					$('#errorMsg').text("Invalid Client Id/ User name / Password");
					$('#errorMsg').show();
					$(".btnShow").show();
					$(".btnHide").hide();
				} else if(retId == -100) {
					location.href = "updatepassword";
					
				}else if(retId < 0) {
					if (retId > -5) {
						var remCount = 5 + retId;
						$('#errorMsg').text("Authentication Failed. After "+remCount+" attempts the account will be locked.");
					}else {
						var remMins = resultData['remMins'];
						
						if(remMins === 0) {
							remMins = 30;
						}
						
						$('#errorMsg').text("Your account is blocked. Try after "+remMins+" mins");
					}
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
		var paswd = document.getElementById("passwordd").value;
		var clntId = document.getElementById("clientid").value;

		localStorage.setItem("clientid", clntId);
		localStorage.setItem("username", usrName);
		
		if (usrName && paswd && clntId){
			loginAuth();	
		}
	}
	
	$('#submitLogin').onEnterKey(function(){
		validateForm();
    });
	
	 $(document).ready(function () {
	        $("input").removeAttr("readonly");
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
