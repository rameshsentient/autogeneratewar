<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> labelMap = ((Map<String, Map<String, String>>) session.getAttribute("DOC_LST"));
Map<String, Map<String, String>> labelEMap = ((Map<String, Map<String, String>>) session.getAttribute("E_DOC_LST"));
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lblTxt = ((Map<String, Map<String, String>>) session.getAttribute("DOC_CONVERSATION"));

String WEB_SCRAPING_URL = APIUtil.WEB_SCRAPING;



%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sentient</title>
  <meta charset="utf-8">
  <link rel="icon" href="http://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="http://sentient.io/img/favicon.ico" type="image/x-icon">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.css">
  <link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/search.css">
  
	<script>
	var orgid="<%=session.getAttribute("loginOrgId")%>";
	var WEB_SCRAPING = "<%=WEB_SCRAPING_URL%>";
	
	</script>  
	<style type="text/css">
		.webBox {
		    width: 100%;
		    min-height: 140px;
		    background-color: #f7f7f7;
		    padding: 10px;
		    border-radius: 4px;
		    border: 1px solid #ddd;
		}
		:disabled {
			cursor: not-allowed !important;
			color: #555;
			background: #ebebe4;
		}
		
		.fa{
			cursor: pointer;
		}
		
		.fa-plus{
			color: #c53c3c;
		}
	
	</style>
</head>
	<body ng-app="sentiApp" ng-controller="webscraping">
		<jsp:include page="new_header.jsp"></jsp:include>
		
		<div class="container all-pageTopMargin">
				<div class ="titleInfo marginTop10" align="center">
					<h4 class="resul_Cnt">Web Scraping</h4>
				</div>
				<div class="clearfix"></div>

				<section class="tablData">
					<!-- <div class="loadr" ng-show="loadr"></div> -->
					<div class="loading-container" ng-show="loadr">
							<div class="loading">
							  <span>Loading...</span>
							</div>
						  </div>
						<form class="webBox marginTop10">
							<div class="formGrp">
								<div class="formLabel col-sm-2">
									<h3>Web URL</h3>
								</div>
								<div class="formField col-sm-10">
									<input type="text"  ng-model="url">
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="formGrp" ng-show="url">
								<div class="formLabel col-sm-2">
									<h3>Query List</h3>
								</div>
								<div class="formField col-sm-2">
									<input type="text"  ng-model="title" placeholder="title">
								</div>
								<div class="formField col-sm-2">
								<select class="dropBoxed" ng-model="findType">
									<option value="find">find</option>
									<option value="find_all">find_all</option>
									<option value="select">select</option>
								</select>
								</div>
								<div class="formField col-sm-2">
									<input type="text"  ng-model="tag" placeholder="tag">
								</div>
								<div class="formField col-sm-1">
								<select class="dropBoxed" ng-model="atribute">
									<option value="class_">class</option>
									<option value="id">id</option>
								</select>
								</div>
								<div class="formField col-sm-2">
									<input type="text"  ng-model="idorclass" placeholder="{{atribute}}">
								</div>
								
								<div class="formField col-sm-1">
								<i class="fa fa-plus marginTop10"  ng-click="addQueryList()"></i>
								</div>
								
								<div class="clearfix"></div>
							</div>
							<div class="formGrp" ng-repeat="list in queryList">
								<div class="formLabel col-sm-2">
									
								</div>
								<div class="formField col-sm-2">
									<input type="text"  ng-model="list.title" ng-disabled="true">
								</div>
								<div class="formField col-sm-2">
								<select class="dropBoxed" ng-model="list.findType" disabled="true">
									<option value="find">find</option>
									<option value="find_all">find_all</option>
									<option value="select">select</option>
								</select>
								</div>
								<div class="formField col-sm-2">
									<input type="text"  ng-model="list.tag" ng-disabled="true">
								</div>
								<div class="formField col-sm-1">
								<select class="dropBoxed" ng-model="list.atribute" disabled="true">
									<option value="class_">class</option>
									<option value="id">id</option>
								</select>
								</div>
								<div class="formField col-sm-2">
									<input type="text"  ng-model="list.idorclass" ng-disabled="true">
								</div>
								
								<div class="formField col-sm-1">
								<i class="fa fa-close marginTop10"  ng-click="removeQueryList($index)"></i>
								</div>
								
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>
							<div class="formGrp">
								<div class="formBtn  marginTop20">
									<button class="btn btn-default uButton" id="hideForm" ng-click="cancelFor()">Clear</button>
									<button type="button" class="btn btn-successcustom marginRight20" ng-click="createScraping()">Submit</button>	
								</div>
							</div>
							<div class="clearfix"></div>
						</form>
						<div class="clearfix"></div>
				</section>	
				
				<div class="col-sm-12 marginTop20 marginBottomt20" ng-if="results.length>0 || resultStatus=='failure'" style="padding: 0px !important;margin-bottom: 20px">
					<table class="table table-condensed table-bordered listTable kBaseTable pageProf">
						<thead>
							<th>Results</th>
						</thead>
						
						<tbody>
							<tr ng-repeat="data in results">
								<td ng-repeat="(key, value) in data">{{key}} : {{value}} </td>
							</tr>
							<tr ng-if="resultStatus=='failure'">
								<td>{{errMsg}}</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				
				
									<!-- BOOTSTRAP ERROR MODAL -->
				<div id="errorModal" class="customPop modal fade" role="dialog">
				  <div class="modal-dialog">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">Error !!</h4>
				      </div>
				      <div class="modal-body">
				        <p>{{popUpMsg}}</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-successcustom" data-dismiss="modal">Ok</button>
				      </div>
				    </div>
	
				  </div>
				</div>
			</div>

		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="resources/js/app.js"></script>
	  	<script src="resources/controller/webscraping.js"></script>
	  	<script src="resources/js/directive.js"></script>
	  	<script src="resources/js/factory.js"></script>

	  	<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	  	<script src="resources/js/angular-datatables.min.js"></script>
	  	<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.colVis.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
		<script src="resources/js/angular-datatables.buttons.js"></script>
		
		<script src="https://cdn.datatables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js"></script>
		<script src="resources/js/angular-datatables.tabletools.min.js"></script>
	  	
	  	<script src="resources/js/ng-file-upload-shim.js"></script>
	  	<script src="resources/js/ng-file-upload.js"></script>
	  	<script src="resources/js/custom.js"></script>
	  	<script src="resources/js/ng-tags.js"></script>
	  	<script src="resources/js/ngstorage.min.js"></script>
		
	</body>
		<script>
	$(function(){
		$('#pageprofile').addClass('active');
	})
</script>
</html>