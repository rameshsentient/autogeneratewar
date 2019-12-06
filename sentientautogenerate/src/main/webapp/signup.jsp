<%@page import="java.util.*"%>
<%@page import="com.util.APIUtil"%>

<%

String ORG_REGISTRATION = APIUtil.ORG_REGISTRATION;
String API_ZENDESK_TICKET = APIUtil.API_ZENDESK_TICKET;

%>

<!DOCTYPE html>
<html>
<head>
  <title>Sentient.io</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1, user-scalable=no">
  <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="resources/signup/css/bootstrap.css">
  <link rel="stylesheet" href="resources/signup/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/signup/css/style.css"> 
  <link rel="stylesheet" href="resources/css/style.css"> 
    <style>
			
@media (max-width: 864px){
	.btn{
		width: 100%!important;
	}
	.subBtn{
		width: 100%!important;
	}
}
body {
			background: #fff;
			/* background-color: rgb(55, 53, 59); */
			/* font-family: "Poppins", sans-serif; */
		}

		canvas{
				position: fixed;
    		top: 0;
    		bottom: 0;
    		left: 0;
    		right: 0;
			}
    </style>
    <script type="text/javascript">
    var ORG_REGISTRATION = "<%=ORG_REGISTRATION%>";
    var API_ZENDESK_TICKET = "<%=API_ZENDESK_TICKET%>";
    </script>
    
                    <!-- Start of sentientio Zendesk Widget script -->
                <script>
                    /*<![CDATA[*/
                    window.zE || (function(e, t, s) {
                        var n = window.zE = window.zEmbed = function() {
                                n._.push(arguments)
                            },
                            a = n.s = e.createElement(t),
                            r = e.getElementsByTagName(t)[0];
                        n.set = function(e) {
                            n.set._.push(e)
                        }, n._ = [], n.set._ = [], a.async = true, a.setAttribute("charset", "utf-8"), a.src = "https://static.zdassets.com/ekr/asset_composer.js?key=" + s, n.t = +new Date, a.type = "text/javascript", r.parentNode.insertBefore(a, r)
                    })(document, "script", "35efafaf-9bd0-4f75-8c65-0dffd8aa28eb"); /*]]>*/
                </script>
                <!-- End of sentientio Zendesk Widget script -->
</head>
<body class="ng-scope" ng-cloak ng-app="test" ng-controller="myCtrl" id="signup-particles-js" style="zoom: 1;">
        <div class="loading-container" ng-show="loadeer">
         <div class="loading">
           <!-- <span>Loading...</span> -->
         </div>
       </div>
	   <div class="main-container">
		   	<div class="col-lg-12">
				   <div class="row">
					   <section>
						   <div class="sign-up-container">
							   <div class="sign-up-header box">
								   <a class="header-logo">sentient</a>
								   <span class="login-text" style="text-transform: none !important;">
										   <a href="login">Login</a>									   
								   </span>
							   </div>
							  
							   <div class="sign-up-right-pan">
								   <div class="bg-logo"></div>
								   <!-- <div class="sign-up-form-logo"></div> -->
								   <h3 class="sign-up-h3">Sign up</h3>
									<form>
											<div class="form-group">
											  <input type="text" ng-model='fname' class="form-control" id="fname" placeholder="First name">
											  <span ng-show="fnameerror && !fname" class="small errormsg"  >Please enter the first name</span>
											</div>
											<div class="form-group ">
											  <input type="text" ng-model='lname' class="form-control" id="lname" placeholder="Last name">
											  <span ng-show="lnameerror && !lname" class="small errormsg" >Please enter the last name</span>
											</div>
											<div class="form-group ">
											  <input type="text" ng-model='uname' class="form-control" id="uname" placeholder="Root user name">
											  <span ng-show="unameerror && !uname" class="small errormsg" >Please enter the user name</span>
											  <span ng-show="unamelengtherror && uname.length<5" class="small errormsg" >Value is too short. Min length is 5 characters</span>
											</div>
											<div class="form-group">
											  <input type="text" ng-model='email' ng-keyup="mailvalidation(email)" class="form-control" id="email" placeholder="Email">
											  <span ng-show="emailerrormsg && !email" class="small errormsg" >Please enter the email</span>
											  <span ng-show="emailerrormsg && emailValiderror" class="small errormsg" >Please enter valid email</span>
											</div>
											<div>
											<table style="margin-bottom:20px;">
												<tbody>
													<tr>
														<td>
															<label for="chec-box">Interested in:</label><br>
															<!-- <input type="checkbox" name="orgtype"  ng-model="int_ai" ng-init="int_ai=true" ng-change="setValue(int_ai,'AI')" style="height: 20px; width: 20px;vertical-align: middle;margin-top:0;"/> -->
															<input type="radio" name="orgtype"  ng-model="int_data" ng-click="setValue('AD')" style="height: 19px; width: 19px;vertical-align: middle; margin-top:0;"/>
															<span style="display: inline;vertical-align: middle;"> AI and Data Platform + Data Alliance&nbsp;&nbsp;  
															</span><br>															
															<!-- <input type="checkbox" name="orgtype"  ng-model="int_data" ng-init="int_data=true" ng-change="setValue(int_data,'DA')" style="height: 20px; width: 20px;vertical-align: middle;margin-top:0;"/> -->
															<input type="radio" name="orgtype"  ng-model="int_ai"  ng-click="setValue('DA')" style="height: 19px; width: 19px;vertical-align: middle;margin-top:15px;"/>
															<span style="display: inline;vertical-align: bottom;"> AI and Data Platform only</span>
														</td>
													</tr>
												</tbody>
											</table>
											<span  ng-show="interstederrormsg && !int_data" class="small errormsg" >Please select interested in</span>
											</div>
											
											<div class="form-group">
											  <input type="text" ng-model="companyname" class="form-control" id="company_name" placeholder="Company name">
											  <span ng-show="companynameerrormsg && !companyname" class="small errormsg" >Please enter the company name</span>	
											</div>
											<div class="form-group">
											  <input type="text" ng-model="companysite" class="form-control" id="companysite" placeholder="Company website">
											  <span ng-show="companysiteerrormsg && !companysite" class="small errormsg" >Please enter the company website</span>
											  
											</div>
											<div class="form-group">
											  <input type="text" ng-model="job" class="form-control" id="job" placeholder="Job title">
											  <span ng-show="joberrormsg && !job" class="small errormsg" >Please enter the job title</span>
											</div>
											<div class="form-group">
											  <input type="text" ng-model="couponcode" class="form-control" id="coupon_code" placeholder="Promo code (If available)">
											</div>
<!-- 											<div class="form-group">
											  <input type="text" ng-model="addressone" class="form-control" id="addressone" placeholder="Address line 1">
											  <span ng-show="addressoneerrormsg && !addressone" class="small errormsg">Please enter the Address 1</span>
											</div>
											<div class="form-group">
											  <input type="text" ng-model="addresstwo" class="form-control" id="addresstwo" placeholder="Address line 2">
											  <span ng-show="addresstwoerrormsg && !addresstwo" class="small errormsg" >Please enter the Address 2</span>
											</div> -->
						
											<div class="form-group m-t-20 button_div">
												<!-- <button type="submit" class="btn signBtn" style="background-color: #bc0000 !important;" onclick="gotoRegister()">Sign In</button> -->
												<button ng-hide="isSubmit" type="submit" ng-click="submit()" class="btn signBtn" style="background-color: #424143 !important;border-radius: 6px !important">Submit</button>
												<button ng-show="isSubmit" type="button" class="btn signBtn" style="background-color: #424143 !important;border-radius: 6px !important">Submit <i class="fa fa-spinner fa-spin"></i></button>
											</div>		  
										  </form>
							   </div>
							   <div class="sign-up-left-pan">
								    <div id="myCarousel" class="carousel slide" data-ride="carousel">
											<ol class="carousel-indicators">
													<li data-target="#myCarousel" class="active" data-slide-to="0"></li>
													<li data-target="#myCarousel" data-slide-to="1"></li>
													<li data-target="#myCarousel" data-slide-to="2"></li>
												  </ol>
												  <div class="carousel-inner">
														<div class="item active">
																<div class="left-content">
																		<span>
																			<img src="resources/signup/images/ai-data.jpg">
																		</span>
																		<h3>Sentient AI and Data Platform</h3>
																		<p>"A platform to manage, deploy and expose AI algorithms as APIs"</p>
																		<p></p>
																	</div>																
																</div>
												  
														<div class="item">
																<div class="left-content">
																		<span>
																			<img src="resources/signup/images/data-alliance.jpg">
																		</span>
																		<h3>Sentient Data Alliance</h3>
																		<p>"An exclusive, secured blockchain network for data producers and data consumers"</p>
																	<p></p>
																	</div>
														</div>
													  
														<div class="item">
																<div class="left-content">
																		<span>
																			<img src="resources/signup/images/ai-co-lab.jpg">
																		</span>
																		<h3>Sentient AI CoLab Programme</h3>
																		<p>"A systematic programme to discover, define, trial and scale AI solutions for your business"</p>
																		<!-- <p class="custom-detail">WENDY BALDWIN OF ER4 LOVE.</p> -->
																	</div>																
														</div>
													  </div>
													  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
															<span class="fa fa-angle-left"></span>
															<span class="sr-only">Previous</span>
														  </a>
														  <a class="right carousel-control" href="#myCarousel" data-slide="next">
															<span class="fa fa-angle-right"></span>
															<span class="sr-only">Next</span>
														  </a>
								</div>
								</div>
						   </div>
					   </section>
				   </div>
			   </div>
	   </div>
	
			<div id="tcpopup" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialogtc">			  	
			    <!-- Modal content-->
			    	<div class="modal-content"  style="margin-top: 60px;margin-left:20px;margin-right:20px; margin-botton:60px;height:45%;">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1" align="left" style="background-color: #54565f;color: #FFFFFF">Terms and Conditions</h1>
			    		<!-- <p>I agree and consent for <a href="https://www.sentient.io/" target="newTab" style="width: auto !important; display: inline;">Sentient.io</a> Pte Ltd collect, use and disclose and/or retain my Personal Data as disclosed for the sole purpose of managing, processing and terminating my Account in order to render necessary services. This includes contacting me from time to time via email during the beta trial period.</p> -->
						<iframe src="terms&conditions.html" style="width: 100%;border: none;height:63%"></iframe>
						<div class="col-md-12 col-sm-12 col-xs-12">
			    		<div class="col-md-6 col-sm-6 col-xs-12 text-right"><button  type="submit" class="btn subBtn" data-dismiss="modal" style="background-color: #bc0000 !important;margin-top:40px; height: 40px; ">Decline</button></div>
						<div class="col-md-6 col-sm-6 col-xs-12 text-left"><button  type="submit" ng-click="submitform()" class="btn subBtn" style="background-color: #a4c158 !important; margin-top:40px; height: 40px; overflow-x: hidden; width: fit-content; word-break: break-word;">I agree with Terms & Conditions</button></div>
					</div>
					</div>
				</div>
			</div>		
			
			<div id="alertmodel" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1" style="background-color: #54565f;color: #FFFFFF">Thank you for registering.</h1>
			    		<p>Our client services team will contact you shortly.</p>
					<div class="modal-footer">
			          <button type="button" class="btn uButton" data-dismiss="modal" ng-click="gotoLogin()">Visit Sentient.io</button>
			        </div>
					</div>
					
					
				</div>
			</div>			  
    </body>
	    <script src="resources/particles.js-master/particles.js"></script>
		<script src="resources/particles.js-master/demo/js/signup.js"></script>
		<script src="resources/js/jquery.js"></script>
    <!-- Angular Material requires Angular.js Libraries -->
        <script src="resources/signup/js/jquery.js"></script>
        <script src="resources/signup/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
         
		<script>
	$(document).ready(function() {
		$('#myCarousel').carousel();
		$('#tcpopup').on('shown.bs.modal', function () {
  $('body').css('overflow','hidden');
  $('html').css('overflow','hidden');
}).on('hidden.bs.modal', function() {
  $('html').css('overflow','auto');
  $('body').css('overflow','auto');
});
  });
			function gotoRegister(){
				location.href="login";
			}
			
			var app = angular.module('test', []);
			app.controller('myCtrl', function($scope,$http,$timeout) { 
				$scope.int_ai=true;
				$scope.isSubmit = false;
				var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);

				$scope.email = "";
				$scope.couponcode="";
				
				$scope.mailvalidation = function(mail){
					var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
					if(pattern.test($scope.email)){
						$scope.emailValiderror=false;
					}
				}
				
				
				$scope.submit=function(){

					console.log($scope.interested);
					if($scope.fname==undefined || $scope.fname==""){
						$scope.fnameerror=true;
					}else if($scope.lname==undefined || $scope.lname==""){
						$scope.lnameerror=true;
					}else if($scope.uname==undefined || $scope.uname==""){
						$scope.unameerror=true;
					}else if(($scope.uname!=undefined || $scope.uname!="") && $scope.uname.length<5){
						$scope.unamelengtherror=true;
					}else if($scope.email==undefined || $scope.email==""){
						$scope.emailerrormsg=true;
					}else if(!pattern.test($scope.email)){
						$scope.emailerrormsg=true;
						$scope.emailValiderror=true;
					}/* else if($scope.int_data==undefined || $scope.int_data==false){
						$scope.interstederrormsg=true;
					} */else if($scope.companyname==undefined || $scope.companyname==""){
						$scope.companynameerrormsg=true;
					}else if($scope.companysite==undefined || $scope.companysite==""){
						$scope.companysiteerrormsg=true;
					}else if($scope.job==undefined || $scope.job==""){
						$scope.joberrormsg=true;
					}


					/* else if($scope.addressone==undefined || $scope.addressone==""){
						$scope.addressoneerrormsg=true;
					}else if($scope.addresstwo==undefined || $scope.addresstwo==""){
						$scope.addresstwoerrormsg=true;
					} 
					else if(!$scope.agree){
						$scope.agreeerrormsg=true;
					}*/else{
						jQuery('#tcpopup').modal("show");
					}
				}
				
				$scope.submitform=function(){
						jQuery('#tcpopup').modal("hide");
						var data={
								fname:$scope.fname,
								lname:$scope.lname,
								uname:$scope.uname,
								email:$scope.email,
								companyname:$scope.companyname,
								addressone:$scope.addressone,
								addresstwo:$scope.addresstwo,
								companysite:$scope.companysite,
								job:$scope.job,
								interested:$scope.interested,
								trail:$scope.int_trail,
								coupon:$scope.couponcode
						}
						
						console.log(data);
						$scope.isSubmit = true;
						
						  $http({
							url: API_ZENDESK_TICKET,
							//url: 'https://api.sentient.io/zendesk/uat/createticket',
							method: "POST",
							data:JSON.stringify(data),
							processData: false,
							contentType: false,
							cache: false,
						}).then(function(response) {
							console.log(response);
							$scope.clear();
							$timeout( function(){
								jQuery('#alertmodel').modal("show");
								//location.reload(true);
							},2000);
						});  
					}
				
				
				$scope.clear=function(){
					$scope.isSubmit=false;
					$scope.fname="";
					$scope.lname="";
					$scope.uname="";
					$scope.email="";
					$scope.companyname="";
					$scope.addressone="";
					$scope.addresstwo="";
					$scope.companysite="";
					$scope.job="";
					$scope.interested=['data_alliance','ai'];
					$scope.int_trail="";
					$scope.couponcode="";

					$scope.int_ai=true;
					$scope.unamelengtherror = false;
					$scope.companynameerrormsg = false;
					$scope.companysiteerrormsg = false;
					$scope.joberrormsg = false;
					
				}

				$scope.gotoLogin=function(){
					location.href="login";
				}
				
				
				$scope.interested=['data_alliance','ai'];
				$scope.setValue=function(type){
						if(type=='DA'){
							$scope.interested=['ai'];
						}else{
							$scope.interested=['data_alliance','ai'];
							}
				}
				
			});
			</script>
    </body>
</html></html>
