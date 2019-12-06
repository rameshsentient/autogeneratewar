<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>
<%@include file="session.jsp"%>

<%

String MICRO_CATLOG_URL = APIUtil.MICRO_CATLOG_URL;
String MICRO_SER_INFO_URL = APIUtil.MICRO_SER_INFO_URL;

String MICRO_SER_LIST_URL = APIUtil.MICRO_SER_LIST_URL;
String ORG_FUN_INFO_URL = APIUtil.ORG_FUN_INFO_URL;
String ORG_INFO = APIUtil.ORG_INFO;
String ORG_CHECK_USER_ACCESS = APIUtil.ORG_CHECK_USER_ACCESS;

String ORG_SUBSCRIPTION = APIUtil.ORG_SUBSCRIPTION;
String API_CATALOG_SOLUTIONS_DETAIL = APIUtil.API_CATALOG_SOLUTIONS_DETAIL;

String loginUserId = session.getAttribute("id").toString();

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sentient Catalog</title>
  <meta charset="utf-8">
  <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.css">
  <link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/catalog.css">
  <link rel="stylesheet" href="resources/css/media.css">
  <link rel="stylesheet" href="resources/css/mob-res.css">
  <script>

var MICRO_CATLOG_URL = "<%=MICRO_CATLOG_URL%>";
var MICRO_SER_INFO_URL = "<%=MICRO_SER_INFO_URL%>";
var MICRO_SER_LIST_URL = "<%=MICRO_SER_LIST_URL%>";
var ORG_FUN_INFO_URL = "<%=ORG_FUN_INFO_URL%>";
var ORG_INFO = "<%=ORG_INFO%>";
var ORG_CHECK_USER_ACCESS = "<%=ORG_CHECK_USER_ACCESS%>";
var LOGIN_USER_ID = "<%=loginUserId%>";
var ORG_SUBSCRIPTION = "<%=ORG_SUBSCRIPTION%>";
var API_CATALOG_SOLUTIONS_DETAIL = "<%=API_CATALOG_SOLUTIONS_DETAIL%>";
</script>  
<style type="text/css">
	.customPre{
	background-color: #fff;
	border: none;
	padding: 0px;
	word-break:break-all;
}
.copyClipboard{
	    font-size: 17px !important;
		color: #777;
		/* text-align: center;
    border-left: 1px solid gray;
    float: right;
    margin-top: -18px;
    padding: 0 7px; */
	}
	
.copy-data{
	overflow: hidden;
    margin-right: 33px;
}
	
/* The Modal (background) */
.modal {
  padding-top: 40px;	
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  overflow: auto;  
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding-top: 20px;
  padding-bottom: 20px;
  width: 60%;
  max-width: 1200px;
  height: 80%
}

/* The Close Button */
.closex {
  color: #555 !important;
  position: absolute;
 /*  top: 35px; */
  right: 279px;
  font-size: 29px !important;
  font-weight: bold !important;
  z-index: 90000;
}

.closex:hover,
.closex:focus {
  color: #555;
  text-decoration: none;
  cursor: pointer;
}

.mySlides {
  display: none;
}

.cursor {
  cursor: pointer
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
  background-color: rgba(0, 0, 0, 0.2);
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

img {
  margin-bottom: -4px;
}

.caption-container {
  text-align: center;
  background-color: black;
  padding: 2px 16px;
  color: white;
}

.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

img.hover-shadow {
  transition: 0.3s
}

.hover-shadow:hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)
}	

table thead tr th{
	text-align:left!important;
padding-left:20px!important;;
}
.fa-copy{
	font-size: large!important;
    color: #848684!important;
}
.table>thead>tr>th{
border:none!important;
}
.modal-dialog thead tr{
	color: #ffffff!important;
}
.feature-body{
	background-color: #fae5e5;
	padding: 20px;
	border-radius: 10px;
}
.feature-para{	
	font-weight: bold;
	background-color: white;
    height: 73px;
    border-radius: 10px;
    -webkit-box-shadow: 0px 3px 3px 0px rgba(250,229,229,1);
    -moz-box-shadow: 0px 3px 3px 0px rgba(250,229,229,1);
    box-shadow: 0px 3px 3px 0px rgb(232, 189, 189);
	padding: 10px;
	margin: 0px;
}
.dollar-sign{
		font-size:12px !important;
		background: #cbab80;
		color: #fbe96a;
		border: 2px solid #fbe96a;
		border-radius: 25px;
		/* width: 20px; */
		/* padding: 3px; */
		/* height: 20px; */
		text-align: center;
		/* line-height: 22px !important; */
		/* text-align: center; */
		padding: 2px 6px 2px 6px;  
	}

	.btn-subs{
		background-color: #424143;
		 padding: 7px 20px 7px 20px;
		 color: white; 
		 border-radius: 5px;
		 border: none;
	}
	.view-demo{
		background-color: #070707;
		 padding: 7px 20px 7px 20px;
		 color: white; 
		 border-radius: 5px;
		 border: none;
	}
	.MS{
	border-radius: 10px;
    border:1px solid #e2e2e2;
    padding-top: 10px;
    padding-bottom: 10px;
	}
	.MS-required{
		background-color: #424143;
		padding: 7px 8px 7px 9px;
		 color: white; 
		 border-radius: 5px;
		 border: none;
	min-width:125px;
	border: 1px solid #424143;
	}
.MS-Not-required{
	padding: 7px 8px 7px 9px;
    /* color: white; */
    border-radius: 5px;
    border: 1px solid gray;
    background: white;
    /* vertical-align: middle; */
	font-weight: bold;
	min-width:125px;
	}
		.MS-Not-required>span{
			color: #838383!important;
		}
	.labelFont{
		color:#cccccc;
	}
	.marginTop10{
		margin-top: 10px;
	}
		.question{
	
    font-size: 14px;
    border: 1px solid #cacaca;
    border-radius: 50%;
	color: #cacaca;
	cursor:progress;
	width: 22px;
	display: inline-block;
	text-align: center;
		}	
		.tool-tipMsg{
			display: none;
		}
		.tool-tipMsg::after{
			content: ' \22C0';
			position: absolute;
    top: 16px;
    left: 38px;
		}

/* .question:hover.tool-tipMsg{
display:block!important;
color: red;
		}  */
		.margintop30{
margin-top: 30px;
		}
		.MS p{
			min-height:30px;
			overflow: hidden;
		}
	.catagory{
	background-color: #f6f6f6;
    padding: 5px 10px 5px 10px;
    border-radius: 5px;
	margin: 5px 5px 5px 0;
	display: inline-block;
		}
		a:focus{
    font-size: 16px;
}
	@media screen and (max-width: 767px) {
		.btn-subs {
			float: right;
		}	
		.inner-card{
			margin-bottom: 10px;
		}
	}
	
.right-pans-micro-service{
	padding-left: 0 !important;
	padding-right: 0 !important;
	margin-top: 91px !important;
}	
.right-pans-row{
margin-left: 0 !important;
margin-right: 0 !important;
}
.red-tooltip + .tooltip{
	opacity: 1 !important;
}
.red-tooltip + .tooltip > .tooltip-arrow{
	border-top-color: #cacaca !important;
} 
.red-tooltip + .tooltip > .tooltip-inner {
	background-color: rgba(255,255,255,1) !important;
color:#333;
border: 1px solid #cacaca;}

.solution-menu .current-active{
      background: white;
      border-left: 2px solid #a90000 !important;
    }

button.disabled:hover {
  cursor: not-allowed;
}

button.disabled {
  opacity: 0.4 !important;
}
mark {
  background: #fbe96a !important;
  color: black;
}
/* 
.hide-btn{
    top: 125px;
	left:0px!important;
	transform: rotate(180deg)!important;
	background-color:#54565f!important;
   }
   .hide-btn.close-btn{
	left:270px!important; 
	transform: rotate(-180deg)!important;
	background: #a90000!important;	
   }
   .hide-btn.close-btn:hover{
	background: #ee4b4b!important;
   }
   .hide-btn:hover{
	background-color:#a9abb1!important;   
   }
   .rightPans{
	margin-left: 0px!important;
   }
   .rightPans.close-tab{
	margin-left: 300px!important;
    transition: 0.5s;
   }
   .leftPans.close-tab{
	left:0px!important;
    transition: 0.5s;
   }
   .leftPans{
	left: -350px!important;
    transition: 0.5s
   } */
</style>
</head>
	<body ng-app="sentiCatalog" ng-controller="solutionDetailCtrl" ng-cloak>
		<jsp:include page="header.jsp"></jsp:include>

		<section class="wrapper" >
				<div class="top-ribbon">
						<span id="solution" class="active" type="button" ng-click="setMenu('S')"><a href="catalog">Solutions</a></span>
						<span id="micro-service" type="button" ng-click="setMenu('M')"><a href="catalog">Microservices</a></span>
					</div>
				
							<div class="hide-btn"><i class="fa fa-caret-left"></i></div>
							
					<div class="leftPans">
							<div class="microServBox">
									<div class="side-menu">
											<ul class="list-unstyled solution-menu" onclick="stopExpand(event)">
													<li ng-repeat="sname in solutionNames" ng-class="{'current-active':sname.id==funcutionId}">
									                    <div ng-click="solutionInfo(sname.id)">{{sname.name}}</div> 
									                </li>
												</ul> 
										</div>
							</div>
						</div>
					
					
		<!-- <div class="loadr" ng-show="loadeer"></div>	 -->
		<div class="loading-container" ng-show="loadeer">
				<div class="loading">
				</div>	
			  </div>
			<div class="rightPans right-pans-micro-service" id="context">	
				
					<div class="fnNavTop ">
							<!-- <a class="fa fa-angle-left" href="dashboard" data-toggle="tooltip" data-placement="bottom" title="back"></a> -->
					<div class="row right-pans-row">
						<div class="col-xs-12 col-sm-12">
							<span class="detsPageTitl" style="padding-left:10px;">{{details.name}}</span>
						</div>						
					</div>	
					</div>
									<div class="row right-pans-row">
										<div class="col-xs-12 col-sm-8" style="padding-left: 40px; padding-top: 5px; padding-right: 40px;">
											<p style="margin-bottom: 10px;" compile="details.desc2"></p>
											<div>
												<a href="{{details.demolink}}" target="_blank" ng-if="details.demolink!=''"><button class="view-demo">View Demo </button></a>
												<a ng-if="details.demolink==''" class=""><button class="view-demo disabled">View Demo</button></a>
												<span ng-show="details.codelink" style="margin-left: 20px; text-decoration: underline; color:#5390c6; "><a href="{{details.codelink}}" target="_blank">Demo Code</a></span>
											</div>

										<div class="PricingPlan col-md-12 padding0" style="margin-top: 25px">
											<div><h4 style="font-weight: bold;">Microservices required:</h4></div>
										<div class="MS col-md-12 col-sm-12">
									<div class="col-md-12" ng-repeat="fn in details.functions">
										<div class="col-md-9" ng-click="gotoMic(fn.fId,details.id)"><h4 style="font-weight:bold;cursor: pointer;margin-bottom:0px !important" >{{fn.fName}}</h4>
										<p style="cursor: pointer;">{{fn.desc1}}</p>
										</div>
										<div style="margin-top: 11px;cursor: none !important;" class="col-md-3 text-right" ng-show="fn.isSubscribed && fn.class !='CLASS_INTERNALSALES'"><button class="MS-required" style="cursor: none !important;"><i class="fa fa-check" aria-hidden="true"></i><span> Subscribed</span></button></div>
										<div style="margin-top: 11px;cursor: none !important;" class="col-md-3 text-right" ng-show="fn.class =='CLASS_INTERNALSALES'"><button class="MS-required" style="cursor: none !important;"><span> Contact sales</span></button></div>
										<div style="margin-top: 11px;cursor: none !important;;" class="col-md-3 text-right" ng-show="!fn.isSubscribed && fn.class !='CLASS_INTERNALSALES'"><button class="MS-Not-required" style="cursor: none !important;"><span>Not subscribed</span></button></div>
									</div>
									</div>
										</div>
										
									</div>
									
									<div class="col-xs-12 col-sm-4  col-md-4 fnDets_2" style="padding-top: 5px;">									
										<div class="col-xs-12"ng-if="details.tags.length>0">
											<h4 style="font-weight: bold; margin: 0;">Tags</h4>
											<div ng-repeat="tag in details.tags">
												<div class="col-xs-4 col-sm-4 col-md-4 labelFont padding0 marginTop10">{{tag.key}} :</div>
												<div class="col-xs-8 col-sm-8 col-md-8 marginTop10">{{tag.value}}</div>
											</div>
											<div class="marginTop20" style="display:inline-block" ng-if="details.keywords">
												<div class="catagory" ng-repeat="key in details.keywords.split(',')">{{key}}</div>
											</div>
										</div>

									</div>						
									</div>
								</div>
						
		</section>
	

		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>	 
	  	<script src="resources/js/ngstorage.min.js"></script>
	  	<script src="resources/js/catalog.js"></script>
	  	<script src="resources/js/ngClickCopy.js"></script>

	  	<script src="resources/js/factory.js"></script>
	  	<script src="resources/controller/solutionsDetailController.js"></script>
	  	<script src="resources/js/word_highlighter.js"></script>	
		
		<script>
			$(function(){
				$('#dashboard').addClass('menu-active');
				$('[data-toggle="tooltip"]').tooltip();   
			})
			$(function() {
                                    $("#dashboard").addClass("menu-active");
                                    $(".hide-btn").click(function() {
                                        $(".leftPans, .rightPans").toggleClass("close-tab");
                                        $(".hide-btn").toggleClass("close-btn");
                                        // $('.rightPans').toggleClass('close-tab');
                                    });
                                    $('.ham-icon').click(function() {
                                        $('.overlay').toggleClass('show-overlay');
                                    })

                                    $("#solution").addClass("active");                                
								});
								$(function(){
									$(".question").hover(function(){
											$(".tool-tipMsg").show();
											})
								});

								
                                function expandMenu(e) {
                                    $(e).toggleClass("open-menu");
                                }

                                function stopExpand(e) {
                                    e.stopPropagation();
                                }
                                window.onresize = function(event) {
                                    if (screen.width < 768) {
                                        if (!$(".leftPans").hasClass("close-tab")) {
                                            $(".leftPans").addClass("close-tab");
                                        }
                                        if (!$(".hide-btn").hasClass("close-btn")) {
                                            $(".hide-btn").addClass("close-btn");
                                        }
                                    } else {
                                        if ($(".leftPans").hasClass("close-tab")) {
                                            $(".leftPans").removeClass("close-tab");
                                        }
                                        if ($(".hide-btn").hasClass("close-btn")) {
                                            $(".hide-btn").removeClass("close-btn");
                                        }
                                    }
                                };

                                $(".list-in-arrow").click(function() {
                                    $(this).toggle(".down");
                                })

                                function toggleSubmenu(e) {
                                    $('.menu-sm').removeClass('open-sub')
                                    $(e).addClass("open-sub");
                                }
		</script>
		
	
		
	</body>
</html>
