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

String DOC_CONVERSION_URL = APIUtil.DOC_CONVERSION;



%>
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
  
	<script>
	var orgid="<%=session.getAttribute("loginOrgId")%>";
	var DOC_CONVERSION = "<%=DOC_CONVERSION_URL%>";
	
	</script>  
</head>
	<body ng-app="sentiApp" ng-controller="docProcessController">
		<jsp:include page="new_header.jsp"></jsp:include>
		
		<section class="wrapper searhcLis" >
				<!-- <div class="loadr" id="loadr" style="display:none;"> -->
						<div class="loading-container" id="loadr" style="display:none;">
								<div class="loading">
								  <span>Loading...</span>
								</div>
							  </div>					
			</div>
			<!-- <div class="loadr" ng-if="loader"></div> -->	
			<div class="container all-pageTopMargin">	
			<br/>	
				<div class="formGrp" align="center">
					<div class="formLabel">
						<h4 class="resul_Cnt"><b><%=lblTxt.get("DOC_CONVERSATION").get("TITLE")%></b></h4>
						<div class="formUpload" style="float :none;">
							<div class="dragDrpBx" ngf-select="uploadFiles($files)" ngf-drop="uploadFiles($files)" ng-model="files">
								<p><a ng-disabled="!docFormat"><%=lblTxt.get("DOC_CONVERSATION").get("DRAG_DROP")%></a></p>
							</div>
						</div>
						
						<div class="clearfix"></div>

					</div>
				</div>
				
				
				<br>
								
				
				<div  id="docTextDiv">
					
				</div>
				
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
			      	<button type="button" class="btn btn-successcustom" data-dismiss="modal">ok</button>
			      </div>
			    </div>

			  </div>
			</div>
		<!-- BOOTSTRAP ERROR MODAL -->			
		</section>

		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="resources/js/app.js"></script>
	  	<script src="resources/controller/docprocess.js"></script>
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