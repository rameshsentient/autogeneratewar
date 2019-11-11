<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

String ASR_DEMO = APIUtil.ASR_DEMO;
%>
<script>

</script>
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
  
  <style type="text/css">
  /* .view-tab tr{
	  border: 1px solid #ccc; 
  } */
  
  </style>
  	
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
    rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    
    <link rel="stylesheet" href="resources/css/datafed_style.css">
  	<link rel="stylesheet" href="resources/css/market.css">
  	<link rel="stylesheet" href="resources/css/contract.css">
  	
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <style type="text/css">
  	
  	/* .titleHeadDiv {
  		background-color: #676974; 
  		color: #FFFFFF;
  		 border-top-right-radius:5px; 
  		 border-top-left-radius:5px;
  		 font-weight: bold; 
  		 font-size: 22px; 
  		 padding: 10px;
  		 box-shadow: 0px 0px 11px -2px rgba(114,123,158,1);
  		}
  	 */
  	.headDiv {
  		background-color: #676974; 
  		color: #FFFFFF;
  		 border-top-right-radius:5px; 
  		 border-top-left-radius:5px;
  		 font-weight: bold; 
  		 font-size: 18px; 
  		 padding: 10px;
  		 box-shadow: 0px 0px 11px -2px rgba(114,123,158,1);
  		}
  	
  	/* .contentDiv {
  	
  		border: 1px solid #676974;  
  		border-bottom-right-radius:5px; 
  		border-bottom-left-radius:5px; 
  		padding: 10px; 
  		background-color : #FFFFFF;
  		box-shadow: 0px 0px 11px -2px rgba(114,123,158,1);
  	
  	} */
  	
  	.boxContentDiv {
  	
  		/* border: 1px solid #676974;   */
  		border-radius:5px; 
  		padding: 10px; 
  		background-color : #FFFFFF;
		  box-shadow: 0px 2px 5px 0px rgba(194,188,194,1);
  		color: #676974;
  	
  	}
	  .billingHead{
		  margin-bottom: 0px;
	  }
  	.view-tab tr{
	border-radius: 5px;
	cursor: pointer;	  
  }
    </style>
  	
   <script type = "text/javascript" src = "https://www.gstatic.com/charts/loader.js">
   
   </script>
</head>
	<body ng-app="datafedApp" ng-controller="billingDashboardController" ng-cloak>
		<jsp:include page="new_header.jsp"></jsp:include>
		<!-- <div class="loadr" ng-show="loadeer"></div> -->
		<div class="loading-container" ng-show="loadeer">
			<div class="loading">
			  <span>Loading...</span>
			</div>
		  </div>
	
		<div class="container-fluid paddingLR30 pageTBMargin80 paddingTop0 padding0">
		<h4 class="btn_bg"></i> Billing Dashboard </h4>
			<div class="box" style="padding:20px;" >
			<div class="row" >
				<div class="col-md-4">
					<div style="font-weight: bold;" class="boxContentDiv" >
						<span style="font-weight: bold; font-size: 32px;"> {{lastMonthTempTotal|number : 2}}</span>
						<br/>
						<span style="font-weight: bold; font-size: 12px;">Last Month</span>
					</div>
				</div>
				<div class="col-md-4">
					<div style="font-weight: bold;" class="boxContentDiv" >
						<span style="font-weight: bold; font-size: 32px;"> {{currentMonthTempTotal|number : 2}}</span>
						<br/>
						<span style="font-weight: bold; font-size: 12px;">This month (cost before credits)</span>
					</div>
				</div>
				<!-- <div class="col-md-6">
					<div style="font-weight: bold;" class="boxContentDiv" >
						<div class="row" >
							<div class="col-md-6">
								<div style="padding-left: 40px;">
									<span style="font-weight: bold; font-size: 32px;">$ 450.52</span>
									<br/>
									<span style="font-weight: bold; font-size: 12px;">Credit remaining</span>
								</div>
							</div>
							<div class="col-md-6">
								<div style="padding-left: 40px;">
									<span style="font-weight: bold; font-size: 32px;">21 Jun 2019</span>
									<br/>
									<span style="font-weight: bold; font-size: 12px;">Credit validity</span>
								</div>
							</div>
						</div>
					</div>
				</div> -->
				
			</div>
			<br/>
			<div class="row" >
				<div class="col-md-4">
					<h4 class="btn_bg">
						Cost Summary
					</h4>
					<div id="barchart" style="height: 400px; width:100%; margin: 0 auto;" class="box" ></div> 
				</div>
				<div class="col-md-8">
					<h4 class="btn_bg">
						Cost by Microservices
					</h4>
					<div class="box" style="height: 400px; width:100%; margin: 0 auto; text-align: left; padding: 5px;"  >
						<p> &nbsp; &nbsp; The Chart below shows the proportion of cost spend for each service by use</p>
						<div  id="donutchart" style="height: 350px; width:100%; margin: 0 auto; text-align: left;">
						</div>
					</div> 
				</div>
			</div>
			<br>
			<br>
			<div class="table-responsive padding0">
			<table class="table view-tab" style="width:10%; text-align: center; margin-bottom: 0 !important;">
		  
		  	<tr ng-show="isDay">
		  		<td class="day" style="border-top-left-radius: 5px; border-bottom-left-radius:5px; background-color: rgb(193, 216, 126);
				  color: white;">Day</td>
		  		<td class="month" style="border-top-right-radius: 5px; border-bottom-right-radius: 5px; background-color: #f5f5f5;
				  color: black;" ng-click="showData('month')">Month</td>
		  	</tr>
		  	<tr ng-hide="isDay">
		  		<td class="day" style=" border-top-left-radius: 5px;  border-bottom-left-radius: 5px; background-color: rgb(193, 216, 126);
				  color: white;" ng-click="showData('day')">Day</td>
		  		<td class="month" style=" border-top-right-radius: 5px; border-bottom-right-radius: 5px; background-color: #f5f5f5;
				  color: black;" >Month</td>
			  </tr>
			  
			  <!-- <tr ng-show="isDay">
					<td style="background: #ccc; border-top-left-radius: 5px;  border-bottom-left-radius: 5px;">Day</td>
					<td style="background: #ccc; border-top-right-radius: 5px; border-bottom-right-radius: 5px;" ng-click="showData('month')">Month</td>
				</tr>
				<tr ng-hide="isDay"><td style="background: #ccc; border-top-left-radius: 5px; border-bottom-left-radius: 5px;" ng-click="showData('day')">Day</td>
					<td style="background: #ccc; border-top-right-radius: 5px; border-bottom-right-radius: 5px;" >Month</td>
				</tr> -->

		  </table>	
			</div>	  
		  <div class="box table-bottom" style="padding: 0px; border-radius:5px; border:0px;">
		  	<h4 class=" btn_bg" ng-show="isDay">Cost by Day</h4>
		  	<h4 class=" btn_bg" ng-show="!isDay">Cost by Month</h4>
		  	<div class="box">
		  		
			<div id = "chart1" style = "width: 100%; height: 350px; margin: 0 auto;"></div>
			<br/>
			
			<div style="width: 100%; height: auto; margin: 0 auto; border: 0px solid #CCC; padding: 10px; background-color : #FFFFFF;">
				<div align="right" style="padding: 10px; background-color: #FFFFFF">
				<a class="btn btn-secondary" href="{{downloadLink}}" role="button" style="background-color: #c1d87e !important;
				color: #ffffff !important;" >Download CSV</a>
				</div>
				<!--Table-->
				<div class="table-responsive">
				<table class="table table-striped table-hover table-fixed">
				
				  <!--Table head-->
				  <thead >
				    <tr >
				      <th ng-repeat="headding in tableHeadder" style="text-align: right;">
				      <div  ng-show="$index == 0" style="text-align: left;">{{headding.key}}</div>
				      <div ng-hide="$index == 0">{{headding.key}}</div>
				      </th>
				    </tr>
				  </thead>
				
				  <!--Table head-->
				
				  <!--Table body-->
				  <tbody>
				  <tr>
				    	<td style="font-weight: bold;">Total</td>
				    	<td ng-repeat="colTotal in columnTotalList" >
				    		
				    		<div align="right" style="text-align: right; font-weight: bold;">{{colTotal.value|number : 2}}</div>
				    	</td>
				    </tr>
				    <tr ng-repeat="row in tableData">
				      <td ng-repeat="value in row" ng-init="getTotalForRow($index, value.key)">
				      <div align="left" ng-show="$index == 0">{{value.key}}</div>
				      	<div align="right" ng-hide="$index == 0"  style="text-align: right;">{{value.key|number : 2}}</div>
				      	
				       </td>
				    </tr>		    
				  </tbody>
				  <!--Table body-->
				
				</table>
				</div>
				<!--Table-->
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
		<script src="resources/js/datafedApp.js"></script>
		<script src="resources/controller/billingDashboardController.js"></script>
		
	</body>
		<script>

	$(function(){
		$('#billingMenu').addClass('menu-active');
		$("#menuiconDA").hide();
		$(".tpMenu").addClass("menuShadow");
	});

	$('.view-tab .day').css('backgroundColor', '#c1d87e');

	$('.day').click(function() {	
		$('.month').css({'backgroundColor':'#f5f5f5','color':'black'});
   		$('.day').css({'backgroundColor':'#c1d87e','color':'white'});
	}); 	
	$('.month').click(function() {	
		$('.day').css({'backgroundColor':'#f5f5f5','color':'black'});
	    $('.month').css({'backgroundColor':'#c1d87e','color':'white'});
	});
</script>
</html>