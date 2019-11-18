<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%@include file="session.jsp"%>

<%

Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("FNDETAIL"));

String MICRO_CATLOG_URL = APIUtil.MICRO_CATLOG_URL;
String MICRO_SER_INFO_URL = APIUtil.MICRO_SER_INFO_URL;

String MICRO_SER_LIST_URL = APIUtil.MICRO_SER_LIST_URL;
String ORG_FUN_INFO_URL = APIUtil.ORG_FUN_INFO_URL;
String ORG_INFO = APIUtil.ORG_INFO;
String ORG_CHECK_USER_ACCESS = APIUtil.ORG_CHECK_USER_ACCESS;

String ORG_SUBSCRIPTION = APIUtil.ORG_SUBSCRIPTION;

String API_CATALOG_MICRO_DETAIL = APIUtil.API_CATALOG_MICRO_DETAIL;

String API_DA_GETEMAILID = APIUtil.API_DA_GETEMAILID;

String API_ZENDESK_TICKET = APIUtil.API_ZENDESK_TICKET;

String loginUserId = session.getAttribute("id").toString();

String loginUserName = session.getAttribute("userName").toString();

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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
  <!-- <link rel="stylesheet" href="resources/css/imggallery.css"> -->
  
  <script>

var MICRO_CATLOG_URL = "<%=MICRO_CATLOG_URL%>";
var MICRO_SER_INFO_URL = "<%=MICRO_SER_INFO_URL%>";
var MICRO_SER_LIST_URL = "<%=MICRO_SER_LIST_URL%>";
var ORG_FUN_INFO_URL = "<%=ORG_FUN_INFO_URL%>";
var ORG_INFO = "<%=ORG_INFO%>";
var ORG_CHECK_USER_ACCESS = "<%=ORG_CHECK_USER_ACCESS%>";
var LOGIN_USER_ID = "<%=loginUserId%>";
var ORG_SUBSCRIPTION = "<%=ORG_SUBSCRIPTION%>";
var API_CATALOG_MICRO_DETAIL = "<%=API_CATALOG_MICRO_DETAIL%>";
var API_DA_GETEMAILID = "<%=API_DA_GETEMAILID%>";
var API_ZENDESK_TICKET = "<%=API_ZENDESK_TICKET%>";
var USER_NAME = "<%=loginUserName%>";
</script>  
<style type="text/css">
.tooltip-inner{
	text-align: center!important;
}
	.customPre{
	background-color: #fff;
	border: none;
	padding: 0px;
	word-break:break-all;
}
.copyClipboard{
	    /* font-size: 17px !important;
		color: #777; */
		text-align: center;
    border-left: 1px solid gray;
    float: right;
    /* margin-top: -18px; */
    padding: 0 7px;
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
  /* width: 60%; */
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
    height: 95px;
    border-radius: 10px;
    -webkit-box-shadow: 0px 3px 3px 0px rgba(250,229,229,1);
    -moz-box-shadow: 0px 3px 3px 0px rgba(250,229,229,1);
    box-shadow: 0px 3px 3px 0px rgb(232, 189, 189);
	padding: 10px;
	margin: 0px;
	overflow: hidden;
}
.dollar-sign{
		font-size:12px !important;
		background: #cbab80;
		color: #fbe96a;
		border: 2px solid #fbe96a;
		border-radius: 50%;
		
		text-align: center;
		
		padding: 2px 6px 2px 6px;  
	}

	.labelFont{
		color:#ccc;
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
	.catagory{
	background-color: #f6f6f6;
    padding: 8px 10px 8px 10px;
    border-radius: 5px;
	margin: 5px 5px 5px 0;
	display: inline-block;
		}
		a:focus{
    font-size: 16px;
}
.sub{
	background-color: #292929!important;
	color:#fff!important;
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
	margin-top: 71px !important;
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

.microServBox .sub-menu li .current-active{
	background: white;
    border-left: 2px solid #a90000;
}
mark {
  background: #fbe96a !important;
  color: black;
}

/* .scroll-API::-webkit-scrollbar{
	width: 0px!important;
	height: 1px;	
		}
		.scroll-API-track::-webkit-scrollbar-track{
			background-color: black;
		} */

</style>
</head>
	<body ng-app="sentiCatalog" ng-controller="msDetailCtrl" ng-cloak>
		<jsp:include page="header.jsp"></jsp:include>

		<section class="wrapper" >
				<div class="top-ribbon">
						<span id="solution" type="button" ng-click="setMenu('S')"><a href="catalog"><%=lbl.get("FNDETAIL").get("SOLUTION_BTN")%></a></span>
						<span id="micro-service" type="button" ng-click="setMenu('M')"><a href="catalog"><%=lbl.get("FNDETAIL").get("MICRO_BTN")%></a></span>
					</div>
				
							<div class="hide-btn"><i class="fa fa-caret-left"></i></div>
							
					<div class="leftPans">
							<div class="microServBox">
									<div class="side-menu">
										<ul class="list-unstyled micro-service-menu">
											<li class="servCetags ai" onclick="expandMenu(this)">
												<div><%=lbl.get("FNDETAIL").get("AI_TEXT")%></div>
												<i class="list-in-arrow fa fa-angle-left"></i>
												<ul class="list-unstyled sub-menu" onclick="stopExpand(event)">
													<li ng-repeat="ainame in msAiNames">
							                            <div ng-click="msInfo(ainame.id)" ng-class="{'current-active':ainame.id==funcutionId}">{{ainame.name}}</div>
							                        </li>
												</ul>
											</li>

											<li class="servCetags util" onclick="expandMenu(this)">
													<div><%=lbl.get("FNDETAIL").get("UTILITY")%></div>
													<i class="list-in-arrow fa fa-angle-left"></i>
													<ul class="list-unstyled sub-menu" onclick="stopExpand(event)">
														<li ng-repeat="utname in msUtNames">
								                            <div ng-click="msInfo(utname.id)" ng-class="{'current-active':utname.id==funcutionId}">{{utname.name}}</div>
								                        </li>
													</ul>
												</li>
												<li class="servCetags data" onclick="expandMenu(this)">
														<div><%=lbl.get("FNDETAIL").get("DATA")%></div>
														<i class="list-in-arrow fa fa-angle-left"></i>
														<ul class="list-unstyled sub-menu" onclick="stopExpand(event)">
															<li ng-repeat="daname in msDaNames">
									                            <div ng-click="msInfo(daname.id)" ng-class="{'current-active':daname.id==funcutionId}">{{daname.name}}</div>
									                        </li>
														</ul>
													</li>
										</ul>
										</div>
							</div>
						</div>
					
					
		<!-- <div class="loadr" ng-show="loadeer"></div>	 -->
		<div class="loading-container" ng-show="loadeer">
				<div class="loading">
				  <span>Loading...</span>
				</div>	
			  </div>
			<div class="rightPans right-pans-micro-service" id="context">	
					<div class="fnNavTop ">
							<!-- <a class="fa fa-angle-left" href="dashboard" data-toggle="tooltip" data-placement="bottom" title="back"></a> -->
					<div class="row right-pans-row">
						<div class="col-xs-6 col-sm-8">
							<span class="detsPageTitl">{{details.funName}}</span>
						</div>
						<div class="col-xs-6 col-sm-4">
							<button class="btn-subs sub" ng-click="subscribe()" ng-if="!userHaveAPIAccess && details.clas_code !='CLASS_INTERNALSALES' && details.pricing.length>0"><%=lbl.get("FNDETAIL").get("SUB")%></button>
							<button class="btn-subs" ng-click="unsubscribe()" ng-if="userHaveAPIAccess && details.clas_code !='CLASS_INTERNALSALES' && details.pricing.length>0"><%=lbl.get("FNDETAIL").get("UNSUB")%></button>
							<button class="btn-subs sub" ng-if="details.clas_code =='CLASS_INTERNALSALES' || details.pricing.length<1" ng-click="microserviceEnquiryMtd(details)" ><%=lbl.get("FNDETAIL").get("CONT_SALE")%></button>
							
						</div>
					</div>	
					</div>
					<div class="row right-pans-row">
						<div class="col-xs-12 col-sm-8" style="padding:5px 40px 10px 40px;">
							<div class="col-md-12 padding0">
							<!-- <p style="margin-bottom: 25px;">{{details.funDesc}}</p> -->
							<p compile="details.funDesc2"></p>
							</div>
						
						<div  ng-show="details.datacollection">
							<h4 style="padding-top: 10px;font-weight:bold"><%=lbl.get("FNDETAIL").get("DATA_METHOD")%></h4>
								<div class="col-md-12 padding0">
								<p compile="details.datacollection"></p>
						</div>
						</div>
						
						<div class="feature-card" ng-show="details.feature.length>0">
							<h4 style="padding-top: 10px;font-weight:bold"><%=lbl.get("FNDETAIL").get("FEATURE")%></h4>
							<div>
								<div class="col-xs-12 feature-body">
									<div class="col-xs-12 col-sm-6 col-md-4 inner-card" ng-repeat="feat in details.feature">
										<p class="feature-para">{{feat.title}}</p>
									</div>
								</div>
							</div>
						</div>

						<div class="PricingPlan col-md-12 table-responsive" style="padding: 0 0 0 5px!important;">
						<h4 style="padding-top: 10px;font-weight:bold" ng-show="details.pricing.length>0"><%=lbl.get("FNDETAIL").get("PRICE_PLAN")%></h4>
						<p>{{details.pricing[0].desc}}</p>
							<div class="tableFn" ng-show="details.pricing.length>0">
								<table class="table table-condensed" style="border:1px solid #e2dede!important; margin-bottom:0px;">
									
									<tbody  ng-repeat="pric in details.pricing" ng-click="selectMe($index)">
										<tr>
											<td class="pricing-plan-table" style="font-weight:bold;">
												{{pric.plan}}
											</td>
											<td class="pricing-plan-table">{{pric.feature}}</td>
											<td class="pricing-plan-table"> <img style="width: 21px; margin-bottom: 1px;" src="resources/images/dollar-img.png"><span aria-hidden="true"> {{pric.price}} </span></td>
											
										</tr>
									</tbody>
								</table>
							</div>
							</div>
							
						<div class="PricingPlan col-md-12 table-responsive" style="padding: 0 0 0 5px!important;">
						<h4 style="padding-top: 10px;font-weight:bold" ng-show="details.dataschema.length>0">Data schema</h4>
						
							<div class="tableFn" ng-show="details.dataschema.length>0">
								<table class="table table-condensed" style="border:1px solid #e2dede!important; margin-bottom:0px;">
									
									<tbody>
										<tr style="border-bottom:1px solid #e2dede!important;">
											<td style="line-height: 1.5;max-width:200px !important;vertical-align: middle;font-weight:bold; word-wrap: break-word;overflow: hidden;text-align: left;padding-left:20px;">
												Name
											</td>
											<td style="line-height: 1.5;max-width:200px !important;font-weight:bold;word-wrap:  break-word; vertical-align: middle; overflow: hidden;text-align: left;padding-left:20px;">Type</td>
											<td style="line-height: 1.5;max-width:200px !important;font-weight:bold;word-wrap:  break-word; vertical-align: middle; overflow: hidden;text-align: left;padding-left:20px;">Size</td>
											<td style="line-height: 1.5;text-align: left; font-weight:bold;padding-left: 20px; vertical-align: middle;">Description</td>
											
										</tr>
										<tr ng-repeat="schema in details.dataschema" style="border-bottom:1px solid #e2dede!important;">
											<td style="line-height: 1.5;max-width:200px !important;vertical-align: middle; word-wrap: break-word;overflow: hidden;text-align: left;padding-left:20px;">
												{{schema.name}}
											</td>
											<td style="line-height: 1.5;max-width:200px !important;word-wrap:  break-word; vertical-align: middle; overflow: hidden;text-align: left;padding-left:20px;">{{schema.type}}<span ng-if="schema.type==''">N/A</span></td>
											<td style="line-height: 1.5;max-width:200px !important;word-wrap:  break-word; vertical-align: middle; overflow: hidden;text-align: left;padding-left:20px;">{{schema.datalength}}<span ng-if="schema.datalength==''">N/A</span></td>
											<td style="line-height: 1.5;  text-align: left; padding-left: 20px; vertical-align: middle;">{{schema.description}}<span ng-if="schema.description==''">N/A</span></td>
											
										</tr>
									</tbody>
								</table>
							</div>
							</div>
					</div>
					

					<div class="col-xs-12 col-sm-4  col-md-4 fnDets_2">
						<div class="col-xs-12 col-sm-12  col-md-11">
						<div class="col-xs-12" ng-if="details.source && details.clas_code=='CLASS_DATA'">
					        <h4 style="font-weight: bold;">Source</h4>
					        <p style="text-decoration: underline;cursor: pointer;"><a ng-if="details.sourcelink" style="color: #333" href="{{details.sourcelink}}" target="_blank">{{details.source}}</a></p>
				        </div>
				       
					    <div class="col-xs-6">
					        <h4 style="font-weight: bold;">API </h4>
				        </div>
					    <div class="col-xs-6">
					        <ul class="refLinks list-unstyled" style="text-align: right;">
					            <li ng-if="details.docUrl">
					                <h4> <a style="color: #a90000;" target="_blank" class="uLine" href="{{details.docUrl}}">API Docs</a></h4> </li>
					            <li ng-if="details.termUrl">
					                <h4><a target="_blank" class="uLine bold marginLeft10" href="{{details.termUrl}}">Terms</a></h4></li>
					        </ul>
					        <!-- <div class="badge" style="margin-right: 10px;margin-bottom: 10px" ng-repeat="arr in details.sourceArr">{{arr}}</div> -->
					        <div class="col-sm-2" style="text-align: right">
					
					        </div>
						</div>
				
					
					    <div class="col-xs-12 feature-body">
					        <div class=""> <span ng-show="details.apiendpoint !=undefined && details.apiendpoint !=''">
								<p style="color: #8a8a8b;">Endpoint </p>
									<!-- <i ng-show="newBoardend" class="fa fa-copy marginLeft10 copyClipboard" ng-click="copytoclipboard('a')" ng-click-copy="{{details.apiendpoint}}" data-toggle="tooltip" title="Copy" id="titlemsgend"></i> -->
									</h4>
								<div class="col-sm-12 col-md-12 col-xs-12" style="height: 50px; background-color: #ffffff;margin-bottom: 20px; border-radius:5px; padding-left: 10px;">
									<div class="col-sm-10 col-md-10 col-xs-10" style="line-height: 3.5; overflow-x: scroll; cursor: grab; white-space: nowrap;word-break: normal;"  ng-mouseover="showClipboardend()" >{{details.apiendpoint}}</div>
									<div class="col-sm-2 col-md-2 col-xs-2 fa fa-copy copyClipboard clipboard-icon" style="padding: 14px; height: 50px; border-left: 1px solid #ddd;" ng-click="copytoclipboard('a')" ng-click-copy="{{details.apiendpoint}}" data-toggle="tooltip" title="Copy" id="titlemsgend"></i>
									</div>
								</div>
											</div>
									<br>
											<div ng-if="userHaveAPIAccess" >
												<p style="color: #8a8a8b;"  >Credentials</p>
										<div class="col-sm-12 col-md-12 col-xs-12" style="height: 50px; background-color: #ffffff; border-radius: 5px; padding-left: 10px;">
											<div class="col-sm-10 col-md-10 col-xs-10" ng-if="userHaveAPIAccess" style="line-height: 3.5; overflow-x: scroll; cursor: grab; white-space: nowrap;word-break: normal;" ng-mouseover="showClipboard()">{{userAPIKeyText}}</div>
											<div class="col-sm-2 col-md-2 col-xs-2 fa fa-copy fa copyClipboard clipboard-icon" style="padding:14px; height: 50px; border-left: 1px solid #ddd;" ng-click="copytoclipboard('b')" ng-click-copy="{{userAPIKeyText}}" data-toggle="tooltip" title="Copy" id="titlemsg"></div>
											
										</div>
					        </div>
					
						</div>
					</div>
					
					    <div class="col-xs-12"  style="margin-top: 25px; margin-left: 15px;">
					        <h4 style="font-weight: bold;" ng-if="details.clas">Tags</h4>
					        <div class="col-xs-4 labelFont padding0 marginTop10" ng-if="details.clas">Class:</div>
					        <div class="col-xs-8 marginTop10" ng-if="details.clas">{{details.clas}}</div>
					        
					        <div ng-if="details.fnType" class="col-xs-4 labelFont padding0 marginTop10">Type:</div>
					        <div ng-if="details.fnType" class="col-xs-8 marginTop10 red-tooltip"
							data-toggle="tooltip"
							data-html="true"
							title="<div style='padding: 10px; border-radius: 5px;'>
								<div style='text-decoration: underline;'>Standalone</div>
								<p>	Microservice doesn't require other microservices to work</p>
								<div style='text-decoration: underline;'>Pipeline</div>
								<p>Consists of a combination of microservices</p>
							</div>">{{details.fnType}} <div class="question">?</div>
							
						</div>
						<div ng-repeat="tag in details.tags">
							<div class="col-xs-4 labelFont padding0 marginTop10">{{tag.key}} :</div>
					        <div class="col-xs-8 marginTop10">{{tag.value}}</div>
						</div>
					
					        <div class="marginTop20" style="display:inline-block" ng-if="details.keywords">
					            <div class="catagory" ng-repeat="key in details.keywords.split(',')">{{key}}</div>
					        </div>
					    </div>
					    <div>
					
					    </div>
					    <h3 ng-if="details.images.length>0" ng-class="{true : 'marginHedding',false : ''}[details.funDesc2 == '' && details.feature.length<1]">Images</h3>
					    <p ng-if="details.images.length>0">Click an image to enlarge and view screen captures, slides, or videos. Screen caps show the user interface for the service after it has been provisioned.</p>
					
					    <!-- <ul class="list-unstyled fnImagSc marginTop10">
													<li ng-repeat="img in details.images">
														<a rel="fnImages" href="{{img.imgUrl}}">
															<img src="{{img.imgUrl}}" alt=""/>
														</a>
													</li>
												</ul> -->
					
					    <div ng-if="details.images.length>0" class="row" style="padding-bottom: 30px">
					        <div class="col-md-3" ng-repeat="img in details.images" style="height: 150px">
					            <div class="thumbnail">
					
					                <img src="{{img.imgUrl}}" alt="Lights" style="width:100%" ng-click="openModal();currentSlide($index)" class="hover-shadow cursor">
					
					            </div>
					        </div>
					    </div>
					
					    <div id="myModal" class="modal">
					        <span class="closex cursor" ng-click="closeModal()">&times;</span>
					        <div class="modal-content">
					            <div class="mySlides" ng-repeat="img in details.images" style="text-align: center;padding: 20px">
					                <img src="{{img.imgUrl}}" style="width: auto !important;" width="100%" height="400px">
					            </div>
					
					            <a class="prev" ng-click="plusSlides(-1)">&#10094;</a>
					            <a class="next" ng-click="plusSlides(1)">&#10095;</a>
					        </div>
					    </div>
					</div>						
					</div>
			
		
			</div>
		</section>
		
	
		 
<!-- ******************SUBSCRIBE SUCCESS POPUP	***********************	 --> 
	<div class="modal fade center-modal" id="Success2">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 30px!important;">
            <div class="thanksModal" style="border: none;">
            </div>
            <div class="modal-body">
                <div>
                    <span class="checkSuccess"> <i class="fas fa-check-circle"> </i></span>
                    <span style="font-size:3rem;vertical-align: middle;font-weight: 600;">&nbsp; Success </span>
                    <p></p>
                    <p style="color: gray; font-size:20px;">You are now subscribed to <span style="color: #a90000;  font-weight: bold;">{{details.funName}}</span></p>
                </div>
                <div class="container-progress">
                    <div class="row" style="margin-bottom:2">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ******************UN-SUBSCRIBE SUCCESS POPUP	***********************	 --> 
<div class="modal fade center-modal" id="Success1">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 30px!important;">
            <div class="thanksModal" style="border: none;">
            </div>
            <div class="modal-body">
                <div>
                    <span style="font-size:20px;vertical-align: middle;font-weight: 600;">&nbsp;Are you sure you want to unsubscribe <span style="color: #a90000; font-weight: bold;">{{details.funName}}</span>
                    </span>
                    <p></p>
                </div>
                <div class="container-progress">
                    <div class="row" style="margin-bottom:2">
                    </div>
                </div>

            </div>
            <div class="modal-footer margintop30" style="border-top:none;">
                <span type="button" style=" padding: 10px 30px 10px 10px; color: gray;" data-dismiss="modal">Cancel</span>
                <button ng-click="subscribe()" type="button" class="btn btn-successcustom" style=" padding: 10px; width: 25rem; background-color: #a90000; border-color:#a90000; color: white;" data-dismiss="modal">
                    Yes
                </button>

            </div>
        </div>
    </div>
</div>	  


<div class="modal fade center-modal" id="contactsales">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 30px!important;">
            <div class="thanksModal" style="border: none;">
            </div>
            <div class="modal-body">
                <div>
                    <span class="checkSuccess"> <i class="fas fa-check-circle"> </i></span>
                    <span style="font-size:3rem;vertical-align: middle;font-weight: 600;">&nbsp; <%=lbl.get("FNDETAIL").get("SUCCESS")%> </span>
                    <p></p>
                    <p style="color: gray; font-size:17px;"><%=lbl.get("FNDETAIL").get("CONT_SALE_MDL")%></p>
                </div>
                <div class="container-progress">
                    <div class="row" style="margin-bottom:2">
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
	  	<script src="resources/js/catalog.js"></script>
	  	<script src="resources/js/ngClickCopy.js"></script>

	  	<script src="resources/js/factory.js"></script>
	  	<script src="resources/controller/msDetailController.js"></script>
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

                                    $("#micro-service").addClass("active");
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

                                // $(".list-in-arrow").click(function() {
                                //     $(this).toggle(".down");
                                // })

                                function toggleSubmenu(e) {
                                    $('.menu-sm').removeClass('open-sub')
                                    $(e).addClass("open-sub");
                                }

		</script>
		
	
		
	</body>
</html>
