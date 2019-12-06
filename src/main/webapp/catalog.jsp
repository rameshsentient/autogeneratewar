<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>
<%@include file="session.jsp"%>
<% 
Map<String, Map<String, String>> labelMap = ((Map<String, Map<String, String>>) session.getAttribute("MENU")); 
Map<String, Map<String, String>> catalogLbl = ((Map<String, Map<String, String>>) session.getAttribute("CATALOG")); 
String API_CATALOG_SOLUTIONS_LIST = APIUtil.API_CATALOG_SOLUTIONS_LIST; 
String API_CATALOG_MICRO_LIST = APIUtil.API_CATALOG_MICRO_LIST;
String MICRO_SER_LIST_URL = APIUtil.MICRO_SER_LIST_URL; 
String ORG_FUN_INFO_URL = APIUtil.ORG_FUN_INFO_URL; 
String ORG_INFO = APIUtil.ORG_INFO; 
String ACCESS_INFO=APIUtil.ACCESS_INFO; 
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Sentient Catalog</title>
<meta charset="utf-8" />
<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css" />
<link rel="stylesheet" href="resources/css/style.css" />
<!-- <link rel="stylesheet" href="resources/css/catalog.css"> -->
<link rel="stylesheet" href="resources/css/media.css" />
<link rel="stylesheet" href="resources/css/New-style.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" /> -->

<style type="text/css">
.body{
	color:#3b3b3b;
}
header.topHeader {
    position: fixed;
    width: 100%;
}
                                
.micro-service-menu{
    display: none;
}

@media screen and (max-width: 767px) {
    .well{
        padding: 30px 0px;
    }
    .main{
        width: 100%;
    }
}
span.disabled:hover {
  cursor: not-allowed;
}
.form-control:focus{
	border: 1px solid #a90000c2;
	-webkit-box-shadow: 0px 0px 35px -9px rgba(169, 0, 0, 0.11);
	-moz-box-shadow: 0px 0px 35px -9px rgba(169, 0, 0, 0.11);
}
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
   }

</style>
<script>
	var orgId = <%=(int)session.getAttribute("loginOrgId") %>
	var API_CATALOG_SOLUTIONS_LIST = "<%=API_CATALOG_SOLUTIONS_LIST%>";
	var API_CATALOG_MICRO_LIST = "<%=API_CATALOG_MICRO_LIST%>";
	var MICRO_SER_LIST_URL = "<%=MICRO_SER_LIST_URL%>";
	var ORG_FUN_INFO_URL = "<%=ORG_FUN_INFO_URL%>";
	var ORG_INFO = "<%=ORG_INFO%>";
	var ACCESS_INFO = "<%=ACCESS_INFO%>";
</script>
</head>

<body ng-app="sentiCatalog" ng-controller="dashCtrl" ng-cloak>
    <jsp:include page="new_header.jsp"></jsp:include>

    <section class="wrapper">
        <div class="top-ribbon">
            <span id="solution" type="button" ng-click="setMenu('S')"><%=catalogLbl.get("CATALOG").get("TAB_ONE")%></span>
            <span id="micro-service" type="button" ng-click="setMenu('M')"><%=catalogLbl.get("CATALOG").get("TAB_TWO")%></span>
        </div>
        <!-- <div class="loadr" ng-show="loadeer"></div> -->
        <div class="loading-container" ng-show="loadeer">
            <div class="loading">
              <span>Loading...</span>
            </div>
          </div>
        <div class="container-fluid padding-none" ng-show="showTitle">
            <div class="hide-btn"><i class="fa fa-caret-left"></i></div>
            <div class="leftPans">
			    <div class="microServBox">
			        <div class="side-menu">
			            <!-- SOLUTIONS LEFT SIDE MENU START-->
			            <ul class="list-unstyled solution-menu" onclick="stopExpand(event)">
			                <li ng-repeat="sname in solutionNames" >
			                    <div ng-click="solutionInfo(sname.id)">{{sname.name}}</div>
			                </li>
			            </ul>
			            <!-- SOLUTIONS LEFT SIDE MENU END-->
			
			            <!-- MICROSERVICE LEFT SIDE MENU START-->
			            <ul class="list-unstyled micro-service-menu">
			                <li class="servCetags" onclick="expandMenu(this)">
			                    <div><%=catalogLbl.get("CATALOG").get("MIC_TAB_AI")%></div>
			                    <i class="list-in-arrow fa fa-angle-left"></i>
			                    <ul class="list-unstyled sub-menu" onclick="stopExpand(event)">
			                        <li ng-repeat="ainame in msAiNames">
			                            <div ng-click="msInfo(ainame.id)">{{ainame.name}}</div>
			                        </li>
			                    </ul>
			                </li>
			                <li class="servCetags" onclick="expandMenu(this)">
			                    <div><%=catalogLbl.get("CATALOG").get("MIC_TAB_UTILITY")%></div>
			                    <i class="list-in-arrow fa fa-angle-left"></i>
			                    <ul class="list-unstyled sub-menu" onclick="stopExpand(event)">
			                        <li ng-repeat="utname in msUtNames">
			                            <div ng-click="msInfo(utname.id)">{{utname.name}}</div>
			                        </li>
			                    </ul>
			                </li>
			                <li class="servCetags" onclick="expandMenu(this)">
			                    <div><%=catalogLbl.get("CATALOG").get("MIC_TAB_DATA")%></div>
			                    <i class="list-in-arrow fa fa-angle-left"></i>
			                    <ul class="list-unstyled sub-menu" onclick="stopExpand(event)">
			                        <li ng-repeat="daname in msDaNames">
			                            <div ng-click="msInfo(daname.id)">{{daname.name}}</div>
			                        </li>
			                    </ul>
			                </li>
			            </ul>
			            <!-- MICROSERVICE LEFT SIDE MENU START-->
			        </div>
			    </div>
			</div>
			
			<!-- RIGHT SIDE PAN START-->
            <div class="rightPans">
                <div class="well solution-pan">
				    <div class="row">
				        <div class="col-md-8">
				            <div class="font-weight-bold marginBottom20" style="font-weight: bold; font-size: 25px; color: #3b3b3b;  padding-top:30px;"><%=catalogLbl.get("CATALOG").get("SLU_TITLE")%></div>
				            <p class="marginBottom20"><%=catalogLbl.get("CATALOG").get("SLU_DESC")%></p>
				            <div class="main">
				                <!-- Actual search box -->
				                <div class="form-group has-feedback has-search marginBottom20">
				                    <span class="fa fa-search form-control-feedback"></span>
				                    <input type="text" class="form-control" placeholder="Search catalog..." ng-model="searchText">
				                </div>
				            </div>
				        </div>
				
				    </div>
				    <div class="row">
				        <div class="col-md-11">
				            <div class="row" id="context1">
				                <!-- SOLUTIONS VIEW START -->
				                <div class="col-xs-12 col-md-6 col-sm-12 col-lg-6 panel-hover" ng-repeat="slist in solutionList| filter:searchText">
				                    <div class="panel-group">
				                        <div class="panel panel-primary">
				                            <div class="panel-heading" ng-click="solutionInfo(slist.id)">
				                                <div class="font-weight-bold; color: #3b3b3b;" style="font-weight: bold;font-size: 25px;color: #3b3b3b;">{{slist.name}}</div>
				                            </div>
				                            <div class="panel-body">
				                                <p ng-click="solutionInfo(slist.id)">{{slist.description}}</p>
				                                <div class="col-xs-12 col-md-12 col-sm-12 col-lg-12 padding0" style="text-align: center;">
				                                    <div class="col-xs-6 col-md-6 col-sm-6 col-lg-6" style="padding-left: 0;" ng-click="solutionInfo(slist.id)"> <span class="btn buttonOne">More info</span></div>
				                                    <div ng-if="slist.demolink!=''" class="col-xs-6 col-md-6 col-sm-6 col-lg-6" style="padding-right: 0;" ng-click="solutionDemo(slist.demolink)"> <span class="btn buttonTwo">View demo</span></div>
				                                    <div ng-if="slist.demolink==''" class="col-xs-6 col-md-6 col-sm-6 col-lg-6" style="padding-right: 0;"> <span class="btn buttonTwo disabled">View demo</span></div>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				                <div style="margin-left: 15px;color: #6f6f6f;" ng-if="(solutionList| filter:searchText).length<1">We are not getting any results.try another search...</div>
				                <!-- SOLUTIONS VIEW END -->
				            </div>
				        </div>
				    </div>
				</div>

		<!-- MICROSERVICE VIEW START -->
               <div class="well micro-service-pan">
				    <div class="row">
				        <div class="col-md-8">
				            <div class="font-weight-bold marginBottom20" style="font-weight: bold; font-size: 25px;color: #3b3b3b;  padding-top:30px;">
				                <%=catalogLbl.get("CATALOG").get("MIC_TITLE")%>
				            </div>
				            <div class="main">
				
				                <!-- Actual search box -->
				                <div class="form-group has-feedback has-search">
				                    <span class="fa fa-search form-control-feedback"></span>
				                    <input type="text" class="form-control" placeholder="Search catalog ..." ng-model="searchMs">
				                </div>
				            </div>
				        </div>
				        <div class="col-md-12">
				            <!-- Nav tabs -->
				            <ul class="nav nav-tabs" role="tablist">
				                <li role="presentation" class="active">
				                    <a href="#all" aria-controls="all" role="tab" data-toggle="tab">
				                        All ({{msArrayFiltered.length}})
				                    </a>
				                </li>
				                <li role="presentation">
				                    <a href="#ai" aria-controls="ai" role="tab" data-toggle="tab">
				                        <%=catalogLbl.get("CATALOG").get("MIC_TAB_AI")%> ({{msAiArrayFiltered.length}})
				                    </a>
				                </li>
				                <li role="presentation">
				                    <a href="#util" aria-controls="util" role="tab" data-toggle="tab">
				                        <%=catalogLbl.get("CATALOG").get("MIC_TAB_UTILITY")%> ({{msUtArrayFiltered.length}})
				                    </a>
				                </li>
				                <li role="presentation">
				                    <a href="#data" aria-controls="data" role="tab" data-toggle="tab">
				                        <%=catalogLbl.get("CATALOG").get("MIC_TAB_DATA")%> ({{msDaArrayFiltered.length}})
				                    </a>
				                </li>
				            </ul>
				            
				            <!-- MICROSERVICE ALL VIEW START -->
				            <div class="tab-content" style="margin-top: 20px;" id="context2">
				                <div role="tabpanel" class="tab-pane row active" id="all">
				                    <div class="col-xs-6 col-md-6 col-sm-6 col-lg-4 panel-hover" ng-repeat="msall in msArray |filter:searchMs as msArrayFiltered">
				                        <div class="panel-group" ng-click="msInfo(msall.id,'all')">
				                            <div class="panel panel-primary">
				                                <div class="panel-heading"  style="height: 75px;">
				                                    <div style="font-weight: bold;font-size: 16px; color: #3b3b3b;"><p class="text-truncate">{{msall.name}}</p></div>
				                                </div>
				                                <div class="panel-body">
				                                    <p>{{msall.description1}}</p>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                    <div style="margin-left: 15px;color: #6f6f6f;" ng-if="(msArray| filter:searchMs).length<1">We are not getting any results.try another search...</div>
				                </div>
				              <!-- MICROSERVICE ALL VIEW END --> 
				              
				            <!-- MICROSERVICE AI VIEW START -->
				                <div role="tabpanel" class="tab-pane row" id="ai">
				                    <div class="col-xs-6 col-md-6 col-sm-6 col-lg-4 panel-hover" ng-repeat="msai in msAiArray | orderBy:'msai.name' | filter:searchMs as msAiArrayFiltered">
				                        <div class="panel-group" ng-click="msInfo(msai.id,'ai')">
				                            <div class="panel panel-primary">
				                                <div class="panel-heading"  style="height: 75px;">
				                                    <div style="font-weight: bold;font-size: 16px; color: #3b3b3b;"><p class="text-truncate">{{msai.name}}</p></div>
				                                </div>
				                                <div class="panel-body">
				                                    <p>{{msai.description1}}</p>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                    <div style="margin-left: 15px;color: #6f6f6f;" ng-if="(msAiArray| filter:searchMs).length<1">We are not getting any results.try another search...</div>
				                </div>
				              <!-- MICROSERVICE AI VIEW END --> 
				              
			               		<!-- MICROSERVICE UTILITY VIEW START -->  
				                <div role="tabpanel" class="tab-pane row" id="util">
				                    <div class="col-xs-6 col-md-6 col-sm-6 col-lg-4 panel-hover" ng-repeat="msut in msUtArray| filter:searchMs as msUtArrayFiltered">
				                        <div class="panel-group" ng-click="msInfo(msut.id,'util')">
				                            <div class="panel panel-primary">
				                                <div class="panel-heading"  style="height: 75px;">
				                                    <div style="font-weight: bold;font-size: 16px; color: #3b3b3b;"><p class="text-truncate">{{msut.name}}</p></div>
				                                </div>
				                                <div class="panel-body">
				                                    <p>{{msut.description1}}</p>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                    <div style="margin-left: 15px;color: #6f6f6f;" ng-if="(msUtArray| filter:searchMs).length<1">We are not getting any results.try another search...</div>
				                </div>
				                
				                <!-- MICROSERVICE UTILITY VIEW END -->
				                
				                <!-- MICROSERVICE DATA VIEW START -->   
				                <div role="tabpanel" class="tab-pane row" id="data">
				                    <div class="col-xs-6 col-md-6 col-sm-6 col-lg-4 panel-hover" ng-repeat="msda in msDaArray| filter:searchMs as msDaArrayFiltered">
				                        <div class="panel-group" ng-click="msInfo(msda.id,'data')">
				                            <div class="panel panel-primary">
				                                <div class="panel-heading" style="height: 75px;">
				                                    <div class="font-weight-bold;" style="font-weight: bold; font-size: 16px;color: #3b3b3b;"><p class="text-truncate">{{msda.name}}</p></div>
				                                </div>
				                                <div class="panel-body">
				                                    <p>{{msda.description1}}</p>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                    <div style="margin-left: 15px;color: #6f6f6f;" ng-if="(msDaArray| filter:searchMs).length<1">We are not getting any results.try another search...</div>
				                </div>
				                <!-- MICROSERVICE DATA VIEW END -->  
				            </div>
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
<script src="resources/controller/catalogCtrl.js"></script>
<script src="resources/js/word_highlighter.js"></script>
<script>
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

        $(document).ready(function(){
        	  $("input").on("input.highlight", function() {
        	    var searchTerm = $(this).val();
        	    $("#context1").unhighlight().highlight(searchTerm);
        	    $("#context2").unhighlight().highlight(searchTerm);
        	  });

        	  
        	});


    </script>
    
    
</body>

</html>
