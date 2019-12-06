<%@ page session="true" %>
<%@page import="java.util.Map"%>
<%@include file="session.jsp"%>



	
			<div class="wrapper" ng-controller="audio" ng-cloak>
<%@include file="header.jsp"%>			
				<div class="loadr" ng-if="loadShow"></div>	
			<form>
				<div class="container all-pageTopMargin">
					<h1 class="pageH1 margin0">audio upload</h1>
					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label>select file</label>
			    		</div>	
			    		<div class="formInput col-sm-6">
			    			<input type="file" ng-model="audio_file" ngf-select="uploadFiles($files)">	
			    		</div>	
			    		<div class="formInput col-sm-3">
			    			<button class="sButton" ng-click="addfile()">ok</button>
			    		</div>	
			    		
			    		<div class="clearfix"></div>
			    	</div>
					
				</div>
				</form>
			</div>
		

	

<%@include file="footer.jsp"%>
		