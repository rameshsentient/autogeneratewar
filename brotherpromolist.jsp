<%@ page session="true" %>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>
<%@include file="session.jsp"%>
<%
Map<String, Map<String, String>> lblOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG"));
Map<String, Map<String, String>> errOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_ERR"));

String ACTIVATE_DELETED_ORG = APIUtil.ACTIVATE_DELETED_ORG;
%>
<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<script type="text/javascript">
var ACTIVATE_DELETED_ORG = "<%=ACTIVATE_DELETED_ORG%>";
</script>
       
  <style>
  	table.listTable tr th{
  		text-indent: 3%;
  	}
  		table.listTable tbody td{
  		text-indent: 3%;
	  }
	  table.listTable{
		  margin: auto;
	  }
	  h4{
		margin-top: 0px!important;
    margin-bottom: 0px!important;
	  }
  </style>     
		<div class="wrapper" ng-controller="brotherlist" ng-cloak>
		<%@include file="header.jsp"%>	
			<div class="container-fluid paddingLR30 pageTBMargin80 box paddingTop0 padding0 box">
				<div>
				<h4 class="pageH1 btn_bg">Promotion List</h4>
				</div>
				<div class="marginTop20 padding20">
				<div>			
					<button  class="pButton" ng-click="gotoAdd()">Add Promotion</button>
				</div>
					<div class="clearfix"></div>
					<div class="marginTop20 table-responsive table-bottom border-box-table  padding0">
				<table class="listTable table table-hover">
					<thead>
						<th class="checkbox" style="text-indent: 0% !important; width: 30px;">
							<input id="checkboxall" type="checkbox" ng-model="isAllSelected" ng-click="toggleAll(isAllSelected)"/>
							<label for="checkboxall"></label>
						</th>
												
						<th>
							<span ng-hide="advSpan">Title</span>
							<a class="advOptn white cursor" ng-show="advSpan" data-toggle="modal" data-target="#deletePromo">
								delete
							</a>							
						</th>
						<th><span ng-hide="advSpan">Category</span></th>
						<th><span ng-hide="advSpan" >Type</span></th>
						<th><span ng-hide="advSpan">Offer</span></th>
						<th><span ng-hide="advSpan">Period</span></th>
						<th><span ng-hide="advSpan">Deadline</span></th>
						<!-- <th>flexy</th> -->
					</thead>

					<tbody>
						<tr class="cursor" ng-repeat="org in promotionData |orderBy:'-id'">
							<td class="checkbox" style="text-indent: 0% !important;" >								
								<input id="checkVal_{{$index}}" type="checkbox" ng-model="org.check_bx" ng-change="optionToggled()"/>
								<label for="checkVal_{{$index}}"></label>
							</td>						
							<td nowrap="nowrap" ng-click="gotoUpdate(org)">{{org.title}}</td>
							<td ng-click="gotoUpdate(org)">
								<span ng-repeat="cat in org.category">{{cat}}<span ng-show=" ! $last ">,</span></span>
							</td>
							<td ng-click="gotoUpdate(org)" style="padding-left:10px !important; text-indent: 0% !important; width:50px !important;  overflow: hidden;" title="{{org.check_bx}}">
								<span ng-repeat="typ in org.prdtype">{{typ}}<span ng-show=" ! $last ">,</span></span>
							</td>
							<td ng-click="gotoUpdate(org)">{{org.price}}</td>
							<td ng-click="gotoUpdate(org)">{{org.period}}</td>
							<td ng-click="gotoUpdate(org)">{{org.dedline}}</td>
						</tr>
						<tr ng-if="promotionData.length < 1">
							<td class="emptyrow" colspan="7">no data found</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
			</div>	
			
												<!-- RE ACTIVATE USER LIST MODAL -->
			<div id="deletePromo" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1">Delete Confirmation</h1>
			    		
			    		<p>are you want to delete the selected promotion(s)?</p>
			    		
			    		<div class="formInput col-sm-12" >
			    			<button class="pull-right pButton marginLeft10" ng-click="deletePromo()">Yes</button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal">No</button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>
			</div>

		<!-- END CREATE ORGANISATION MODAL -->
<%@include file="footer.jsp"%>
<script src="resources/controller/brotherPromoList.js"></script>

		<script>
			$(function(){
				$('#brother').addClass('menu-active');
				$(".tpMenu").addClass("menuShadow");
			});		
			
		</script>