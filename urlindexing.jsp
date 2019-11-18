<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>



<%
Map<String, Map<String, String>> labelMap = ((Map<String, Map<String, String>>) session.getAttribute("DOC_LST"));
Map<String, Map<String, String>> labelEMap = ((Map<String, Map<String, String>>) session.getAttribute("E_DOC_LST"));
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lblTxt = ((Map<String, Map<String, String>>) session.getAttribute("PAGE_PROFILE"));

Map<String, Map<String, String>> lblError = ((Map<String, Map<String, String>>) session.getAttribute("PAGE_PROFILE_ERR"));

String URL_INDEXING_URL = APIUtil.URL_INDEXING_URL;


%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var Node_Weight_not_fount = "<%=lblError.get("PAGE_PROFILE_ERR").get("NODE_WEIGHT_NOT")%>";
var valid_URL = "<%=lblError.get("PAGE_PROFILE_ERR").get("VALID_URL")%>";
var Connection_timeout = "<%=lblError.get("PAGE_PROFILE_ERR").get("CON_TIME_OUT")%>";
var URL_INDEXING_URL = "<%=URL_INDEXING_URL%>";

</script>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sentient</title>
  <meta charset="utf-8">
  <link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
	rel="stylesheet" />
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
  </style>
</head>
	<body ng-app="sentiCatalog" ng-controller="pageProfiler">
		<jsp:include page="new_header.jsp"></jsp:include>
		
		<section class="wrapper searhcLis" >
			<!-- <div class="loadr" ng-if="loader"></div>	 -->
			<div class="loading-container" ng-if="loader">
					<div class="loading">
					  <span>Loading...</span>
					</div>
				  </div>
			<div class="container all-pageTopMargin">				
				<div class="sear_res">
					<h4 class="resul_Cnt"><b><%=lblTxt.get("PAGE_PROFILE").get("ENTER_URL")%></b></h4>
					<form class="search_inpt pageSearchBx">
						<input type="text" placeholder="URL" ng-model="searchKey">
						<button type="submit" ng-click="setPageProfile()"><i class="fa fa-arrow-right"></i></button>
						<div ng-show="errorMessage != '' ">
							<br/>
							<p class="resul_Cnt ng-scope" >{{errorMessage}}</p>
						</div>
					</form>
				</div>
				
				
				<br>
								
				
				<div class="col-sm-8 col-sm-offset-2">
					<table class="table table-condensed table-bordered listTable kBaseTable pageProf" ng-if="outputData.length > 0">
						<thead>
							<th><%=lblTxt.get("PAGE_PROFILE").get("COL_NAME")%></th>
							<th><%=lblTxt.get("PAGE_PROFILE").get("NODE_WEIGHT")%></th>
						</thead>
						
						<tbody ng-init="datalimit = 3">
							<tr ng-repeat="row in outputData | limitTo : datalimit">
								<td>{{row.name}}</td>
								<td width="200px">{{row.node_weight}}</td>
							</tr>
							<tr>
								<td colspan="2" class="pColor" ng-show="dataExpand && outputData.length > 3" ng-click="dataExpand = !dataExpand;datalimit = 3">Collapse</td>
							</tr>
							<tr>
								<td colspan="2" class="pColor" ng-show="!dataExpand && outputData.length > 3"  ng-click="dataExpand = !dataExpand;datalimit = 1500">Expand</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="col-sm-8 col-sm-offset-2 marginTop20 marginBottomt20">
					<table class="table table-condensed table-bordered listTable kBaseTable pageProf" ng-if="ngramsData.list.length > 0">
						<thead>
							<th>N-grams</th>
							<th>Score</th>
						</thead>
						
						<tbody ng-init="ngramlimit = 3">
							<tr ng-repeat="ngram in ngramsData.list |orderObjectBy : 'score'| limitTo : ngramlimit">
								<td>{{ngram.name}}</td>
								<td width="200px">{{ngram.score.substr(0, 4)}}</td>
							</tr>
							<tr>
								<td colspan="2" class="alignCenter pColor" ng-show="ngramExpand && ngramsData.list.length > 3" ng-click="ngramExpand = !ngramExpand;ngramlimit = 3">Collapse</td>
							</tr>
							<tr>
								<td colspan="2" class="alignCenter pColor" ng-show="!ngramExpand && ngramsData.list.length > 3"  ng-click="ngramExpand = !ngramExpand;ngramlimit = 1500">Expand</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
		</section>

		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/catalog.js"></script>
		<script src="resources/controller/pageprofile.js"></script>
		<script src="resources/js/ngClickCopy.js"></script>
		
		<script>
			$(function(){
				$('#pageprofile').addClass('active');
			})
		</script>
		
		
	</body>
</html>