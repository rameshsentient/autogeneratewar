<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("DATASCHEMA"));

String API_ADD_SCHEMA = APIUtil.API_ADD_SCHEMA;
String API_LIST_SCHEMA = APIUtil.API_LIST_SCHEMA;
String API_DELETE_SCHEMA = APIUtil.API_DELETE_SCHEMA;
String API_GET_DA_SETTING = APIUtil.API_GET_DA_SETTING;
String API_FILE_UPLOAD = APIUtil.API_FILE_UPLOAD;

String API_MARKET_PLACE = APIUtil.API_MARKET_PLACE;

%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var API_ADD_SCHEMA = "<%=API_ADD_SCHEMA%>";
var API_LIST_SCHEMA = "<%=API_LIST_SCHEMA%>";
var API_DELETE_SCHEMA = "<%=API_DELETE_SCHEMA%>";
var API_GET_DA_SETTING = "<%=API_GET_DA_SETTING%>";
var API_FILE_UPLOAD = "<%=API_FILE_UPLOAD%>";

var API_MARKET_PLACE = "<%=API_MARKET_PLACE%>";

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
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/search.css">
  <link rel="stylesheet" href="resources/css/fileupload.css">
  <link rel="stylesheet" href="resources/css/New-style.css">
  <link rel="stylesheet" href="resources/css/New-table-styls.css">
  
  <!-- COUNTRY LIST ===========-->
  <link href="resources/css/fSelect.css" rel="stylesheet">
  <!-- COUNTRY LIST ===========-->
  
  
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
    rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  
  <style type="text/css">
  	.requiredfileds{color: red;}
  	
  	.aligncenter{
  		text-align:center;
  		cursor: pointer;
  		
  	}
  	.disableDelete {
	    pointer-events: none;
	    color:#AAA;
    	background:#F5F5F5;
 	}
 	
 	.custom-form-control {
	    height: 34px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #555;
	    background-color: #fff;
	    background-image: none;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
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
	.todate{
		text-align: right;	
	}
  .filter_style{
    margin-left: 0px;
    margin-top: -5px;
  }
  .rowLG{
    margin-left: 0px!important;
    margin-right: 0px!important
}
.model{
  background-color:red;
  }
  .model{
  background-color:red;
  }
  .create>.modal-dialog {
  width: 80%;
  padding: 20px;
  overflow-y: auto;
    display: block;
	height: 80%;
	border-radius: 6px;  
}

  .action-icons{
	text-decoration: none;
    padding: 5px;
    border: 1px solid #c1bbbb;
    border-radius: 5px;
}
.marginbottom10{
	margin-bottom:10;
}
.margin0{
	margin: 0;
}
/* .fs-label-wrap, .fs-dropdown{
	width: 100%;
	border-radius:10px;
} */
.fs-label-wrap{
	width: 100%;
	border-radius:5px;
	height: 36px;
}
.fs-wrap{
	width: 100%;
	border-radius:5px;
}
.fs-dropdown{
	margin-top: 0px!important;
}
.fs-label-wrap .fs-label{
	color: #9a9a9a!important;
}
.my-group .form-control{
	width: 50% !important;
}
.panel-default{
	padding: 10px !important;
}
@media screen and (max-width: 767px){
.action-btn{
	text-align: right!important;
	padding-right: 0;
}
.filter-title,.filter-opt{
	margin-bottom: 10px !important;
}
.create>.modal-dialog{
	height: 95%;
	margin: auto;
}
}
@media screen and (max-width: 370px){
	.group_data{
		margin-top: 50px !important;
	}
}
.container-fluid{
	padding-right: 15px !important;
    padding-left: 15px !important;
    margin-right: auto !important;
    margin-left: auto !important;
		width: auto !important;
}
@media screen and (min-device-width: 768px) and (max-device-width: 926px) { 
    /* STYLES HERE */
}
.panel-body{
	padding: 0px 30px 20px 30px!important;
}
.delSpinner{
	background: #abc445!important;
    color: white!important;
}
  </style>
  	
  	<link rel="stylesheet" href="resources/css/datafed_style.css">
	  <link rel="stylesheet" href="resources/css/market.css">
	  <link rel="stylesheet" href="resources/css/New-style.css">
  	<script src="resources/js/1.9.1-jquery.js"></script> 
  	<script src="resources/js/1.11.4-jquery-ui.js"></script>
</head>
	<body ng-app="datafedApp" ng-controller="datafedController" ng-cloak>
		<jsp:include page="new_header.jsp"></jsp:include>
		
    <!-- <div class="loadr" ng-show="loadeer"></div> -->
    <div class="loading-container" ng-show="loadeer">
      <div class="loading">
        <!-- <span>Loading...</span> -->
      </div>
    </div>
		
		<div class="container-fluid Da-MS-top">
    <!-- <h3 class="font-weight-bold"><%=lbl.get("DATASCHEMA").get("TITLE")%> </h3>  -->
	
  	<h4 class="schema-add" id="focusBtnCreateBtn" > 
    	<button class="btn_bg1" ng-click="clickShow()" ng-hide="toggleOff" data-toggle="modal" data-target="#createdata" > <%=lbl.get("DATASCHEMA").get("CREATE_SCHEMA")%></button>
    	<button class="btn_bg1" ng-click="clickShow()" ng-show="toggleOff" > <%=lbl.get("DATASCHEMA").get("CREATE_SCHEMA")%></button>
  	</h4>
  	 
    <div class="list_find">
      <div class="rowLG row">
			<div class=" col-md-12">
					<div class="row btn_bg"style="margin-right: 0px; background-color:#dfdfdf!important; margin-left: 0px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
						<div class="col-xs-12 col-sm-1 paddingLeft filter-title">
							<h4 style="color: #7a7a7b; text-align: left;">Filters</h4>
						  </div>
		
						  <div>
								<div class="col-xs-12 col-sm-7 filter-opt paddingRight padding0" style="z-index: 0;">
										<div style="border-top-left-radius: 5px !important;
												border-bottom-left-radius: 5px !important;">
									  <div class="input-group my-group" style="width: 100%">
		
					 <select class="form-control select-form-control border-class" ng-model="category" style="cursor:pointer">
					  <option value=""><%=lbl.get("DATASCHEMA").get("SELECT_CATEGORY")%></option>
					  <option ng-repeat="cat in categoryOptions" value="{{cat.value}}">{{cat.value}}</option>
					  </select>
					  
					  <select class="form-control select-form-control border-class" style="border-bottom-right-radius: 5px; border-top-right-radius: 5px;" ng-model="statusIn" style="cursor:pointer">
						<option value=""><%=lbl.get("DATASCHEMA").get("SELECT_STATUS")%></option>
						<option ng-repeat="sta in statusOptions" value="{{sta.value}}">{{sta.value}}</option>
					  </select>
				   
				</div>
				  </div>
					</div>
					
					<div class="col-xs-12 col-sm-3 action-btn" style="text-align:left;">
					  <button class="btn uButton mycollap" ng-click="cancel('cancelfilter')" ><i ng-hide="!findButtonStatus" class="fa fa-refresh" style="font-size: 23px;	color: #424143;" aria-hidden="true"></i><i ng-hide="findButtonStatus" class="fa fa-refresh fa-spin" style="font-size: 23px;	color: #424143;	font-weight: bold;" aria-hidden="true"></i></button>
					  <button class="btn btn-successcustom marginLeft5" ng-click="filterData()" ng-show="findButtonStatus"><%=lbl.get("DATASCHEMA").get("FIND")%></button>
					  <button class="btn btn-successcustom marginLeft5"  ng-show="!findButtonStatus"><%=lbl.get("DATASCHEMA").get("FIND")%></button>
					  <%-- <button class="btn btn-successcustom" ng-hide="findButtonStatus"><%=lbl.get("DATASCHEMA").get("FIND")%> <i class="fas fa-spinner fa-spin"></i></button> --%>
					</div>
				</div>
		
				  </div>
				</div>
      
        
        <div class="col-md-12">
          <div class="table-responsive tableTop new-table">
          <table class="table table-striped table-hover list_schema table-bottom border-box-table" >
            <thead>
              <tr ng-show="normalHead">
              	<th scope="col" class="fixed-status"><%=lbl.get("DATASCHEMA").get("LIST_STATUS")%></th>
                <th scope="col"><%=lbl.get("DATASCHEMA").get("LIST_NAME")%></th>
                <th scope="col"><%=lbl.get("DATASCHEMA").get("LIST_PRICE")%></th>
                <th scope="col"><%=lbl.get("DATASCHEMA").get("LIST_CATEGORY")%></th>
                <th scope="col"><%=lbl.get("DATASCHEMA").get("LIST_CREATED_DATA")%></th>
                <!-- <th scope="col"><%=lbl.get("DATASCHEMA").get("LIST_PERIOD")%></th> -->
                <th scope="col" style="text-align: left;"><%=lbl.get("DATASCHEMA").get("ACTION")%></th>
              </tr>
            </thead>
            <tbody>
	            
              <tr ng-repeat="res in dataSchemaItems" title="view more">
                <td ng-click="viewMore(res)"  style="cursor:pointer;" class="fixed-width" ><button ng-class="getStatusClass(res.Record.status)" style="text-transform: capitalize;">{{res.Record.status}}</button></td>
              	<td class="table-description" style="cursor:pointer;" ng-click="viewMore(res)" data-container="body" data-toggle="tooltip" title="{{res.Record.name}}"><span class="span-description">{{res.Record.name}}</span></td>             
                <td ng-click="viewMore(res)"  style="cursor:pointer;">{{res.Record.displayprice | number:0}}</td>
              	<td ng-click="viewMore(res)"  style="cursor:pointer;">{{res.Record.category}}</td>
              	
				        <td ng-click="viewMore(res)"  style="cursor:pointer;">{{res.Record.datecreated | date:'dd MMM yyyy, HH:mm a' }}</td>
						<td>
								<span class="action-icons" ng-click="showCloneData(res.Record)" data-toggle="modal" data-target="#createdata" style="cursor:pointer;"> <i class="fa fa-clone" title="clone">&nbsp;</i>Clone</span>
								<span class="action-icons" ng-show="showTrash" ng-click="deletebox(res.Record.id)" title="delete" style="cursor:pointer;"> <i class="fa fa-trash aligncenter" aria-hidden="true" >&nbsp;</i>Delete</span>
							 </td>
              </tr>
              	<td colspan="7" style="text-align: center; font-weight: bold;" ng-show="!(dataSchemaItems.length)"><%=lbl.get("DATASCHEMA").get("NOT_FOUND")%>
              	</td>
              <tr>
              	
              </tr>
            </tbody>
          </table>
		<div ng-show="showLoadmoretext" style="padding: 20px; padding-left: 45%; color: #80808096"><%=lbl.get("DATASCHEMA").get("LOADING_MORE")%></div>
		<div ng-show="!showLoadmoretext && dataSchemaItems.length" style="padding: 20px; padding-left: 45%; color: #80808096"><%=lbl.get("DATASCHEMA").get("NO_MORE_RESULT")%></div>
        </div>
          <%-- <div style="text-align: center; font-weight: bold; padding-bottom:10px" ng-show="!(dataSchemaItems.length)"><%=lbl.get("DATASCHEMA").get("NOT_FOUND")%></div> --%>
          </div>
        
      </div>
    </div>
    <br/><br/>
  </div>
</div>
	
	
	<!-- Modal - Delete schema-->
	 
	<div id="myModal" class="modal fade" role="dialog" >
		<div class="modal-dialog">
			<div class="modal-content">
    	        <div class="modal-body">
	                <p style="text-align:center;"><%=lbl.get("DATASCHEMA").get("DELETE_POPUP")%></p>
	            </div>
	            <div class="modal-footer" style="text-align:center;">
	            	<button type="button" class="btn btn-default uButton" ng-show="noBtn" data-dismiss="modal"><%=lbl.get("DATASCHEMA").get("DELETE_NO")%></button>
	            	<button type="button" class="btn btn-successcustom marginLeft10" ng-show="deleteBtn" ng-click="deleteApi()"><%=lbl.get("DATASCHEMA").get("DELETE_YES")%></button>
	                <button type="button" class="btn  delSpinner" ng-hide="deleteBtn"> <%=lbl.get("DATASCHEMA").get("WAIT")%> <i class="fas fa-spinner fa-spin"></i></button>
	                
	            </div>
	        </div>
	    </div>
	</div>	
	
	<!-- Modal end -->
	
	
	<!-- Modal - Price popup   ______ COMMENTED--> 
	 
	<div id="verifyPrice" class="modal fade" role="dialog" >
	    <div class="modal-dialog"> 
	        <div class="modal-content">
	            <div class="modal-body">
	                <p style="text-align:center;"><%=lbl.get("DATASCHEMA").get("PRICE_FREE")%></p>
	            </div>
	            <div class="modal-footer" style="text-align:center;">
	            	<button type="button" class="btn btn-default btn_cancel" data-dismiss="modal"><%=lbl.get("DATASCHEMA").get("PRICE_NO")%></button>
	            	<button type="button" class="btn btn-default  btn-successcustom btn_cancel" data-dismiss="modal" ng-click="addDataItem2()" style="color: white"><%=lbl.get("DATASCHEMA").get("PRICE_YES")%></button>
	            </div>
	        </div>
	    </div>
	</div>	
	
	<!-- Modal end -->
	
	
	
	<!-- Modal -->
		<div class="modal fade " id="moreDetailModal" tabindex="-1" role="dialog" aria-labelledby="moreDetailModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
		  <div class="modal-content">
		    <div class="modal-header" style="text-align:left!important;padding: 25px;">
					<button type="button" class="close" data-dismiss="modal" ng-click="startInterval()">x</button>
		      <h3 class="modal-title font-weight-bold card-wrap"  id="moreDetailModalLabel" data-toggle="tooltip" title="{{viewSchema.Record.name}}">{{viewSchema.Record.name}}</h3>
		    </div>
		    <div class="modal-body area-modal-body" style="height: 360px; overflow: auto; padding-top:0;">
					<div class="col-md-12 marginbottom10">
							<div class="row margin0">
			  <p class="card-desc">{{viewSchema.Record.description}}</p>
					</div>
				</div>
				
			  		      <div class="col-md-12 marginbottom10">
								<div class="row margin0">
		    <div class="col-md-4 col-sm-4 col-xs-4 font-weight-bold padding0">Source&nbsp;&nbsp;</div>
		      	<div class="col-md-8 col-sm-8 col-xs-8" ng-show="viewSchema.Record.source !='' ">{{viewSchema.Record.source}}
				<span ng-show="viewSchema.Record.source =='' "><%=lbl.get("DATASCHEMA").get("NA")%></span>
			</div>
			  </div> </div>
			  
			  
			  <div class="col-md-12 marginbottom10">
					<div class="row margin0">
				<div class="col-md-4 col-sm-4 col-xs-4 font-weight-bold  padding0"><%=lbl.get("DATASCHEMA").get("NUMBER_OF_RECS")%></div>
				<div class="col-md-8 col-sm-8 col-xs-8">
		        <span class="" ng-show="viewSchema.Record.recordcount> 0">{{viewSchema.Record.recordcount | number}}</span>
				<span ng-show="viewSchema.Record.recordcount < 1"><%=lbl.get("DATASCHEMA").get("NA")%></span>
			</div>
		      </div>
			</div>
				
					<div class="col-md-12 marginbottom10">
							<div class="row margin0">
					<div class="col-md-4 col-sm-4 col-xs-4 font-weight-bold  padding0"><%=lbl.get("DATASCHEMA").get("PERIOD_FROM_TO")%></div>
		        <!-- <span class="">{{viewSchema.Record.period}}</span> -->
				<div class="col-md-8  col-sm-8 col-xs-8">
	        	<span ng-show="viewSchema.Record.fromyear > 0">{{viewSchema.Record.fromyear}}</span><span ng-show="viewSchema.Record.frommonth > 0">-</span><span ng-show="viewSchema.Record.frommonth < 10 && viewSchema.Record.frommonth > 0">0</span><span ng-show="viewSchema.Record.frommonth > 0">{{viewSchema.Record.frommonth}}</span><span ng-show="viewSchema.Record.fromdate > 0">-</span><span ng-show="viewSchema.Record.fromdate < 10 && viewSchema.Record.fromdate > 0">0</span><span ng-show="viewSchema.Record.fromdate > 0">{{viewSchema.Record.fromdate}}</span><span ng-show="viewSchema.Record.fromyear > 0 && viewSchema.Record.toyear > 0"> <%=lbl.get("DATASCHEMA").get("DATE_SEPARATOR")%> </span><span ng-show="viewSchema.Record.toyear > 0">{{viewSchema.Record.toyear}}</span><span ng-show="viewSchema.Record.tomonth > 0">-</span><span ng-show="viewSchema.Record.tomonth < 10 && viewSchema.Record.tomonth > 0">0</span><span ng-show="viewSchema.Record.tomonth > 0">{{viewSchema.Record.tomonth}}</span><span ng-show="viewSchema.Record.todate > 0">-</span><span ng-show="viewSchema.Record.todate < 10 && viewSchema.Record.todate > 0">0</span><span ng-show="viewSchema.Record.todate > 0">{{viewSchema.Record.todate}}</span>
				<span ng-show="viewSchema.Record.fromyear < 1 && viewSchema.Record.toyear < 1"><%=lbl.get("DATASCHEMA").get("NA")%></span>		
					</div>
				</div> </div>
				
				<div class="col-md-12 marginbottom10">
						<div class="row margin0">
						<div class="col-md-4 col-sm-4 col-xs-4 font-weight-bold  padding0">Open dataset&nbsp;&nbsp;</div>
						<div class="col-md-8 col-sm-8 col-xs-8">
		           <span ng-show="viewSchema.Record.opendataset == 'yes' ||viewSchema.Record.opendataset == true">Yes</span>
		           <span ng-show="!(viewSchema.Record.opendataset == 'yes' ||viewSchema.Record.opendataset == true)">No</span>
				 </div>
				</div> </div>

			
			    	<div class="col-md-12 marginbottom10">
							<div class="row margin0">
					<div class="col-md-4 col-sm-4 col-xs-4 font-weight-bold  padding0">Price&nbsp;&nbsp;<span class="dollar-sign">S</span></div>
					<div class="col-md-8 col-sm-8 col-xs-8">
		           <span> {{viewSchema.Record.price| number:0}}</span>
				 </div>
				</div> </div>

		     
				<div class="col-md-12 marginbottom10" ng-if="viewSchema.Record.type.length" class="ng-scope">
					    <div class="row margin0">
						<div class="col-md-4 col-sm-4 col-xs-4 font-weight-bold  padding0">Type</div>
						<div class="col-md-8 col-sm-8 col-xs-8">
					<span>{{viewSchema.Record.type}}</span>
				</div>
			</div> </div>
			
		      
			<div class="col-md-12 marginbottom10">
					<div class="row margin0">
					<div class="col-md-4 col-sm-4 col-xs-4 font-weight-bold  padding0">Country</div>
						<div class="col-md-8 col-sm-8 col-xs-8 col-xs-8">
					<span ng-repeat="contry in viewSchema.Record.countries | limitTo:limitlength" style="word-break: break-all">{{contry.name}}<font ng-show="!$last">, </font></span>
					<span ng-hide="viewSchema.Record.countries.length<=4 || !(viewSchema.Record.countries.length)">
						<span ng-hide="expanded">...</span><a ng-hide="expanded"  ng-click='expanded = !expanded; limitlength=100' style="text-decoration: underline;">View all</a>
						<a ng-show="expanded" ng-click='expanded = !expanded; limitlength=4' style="text-decoration: underline;">View less</a>
					</span>
					<span ng-show="!(viewSchema.Record.countries.length)"><%=lbl.get("DATASCHEMA").get("NA")%></span>
					</div>
		         </div> </div>
		        
			     <div class="col-md-12 marginbottom10">
						<div class="row margin0">
						<div class="col-md-4 col-sm-4 col-xs-4 font-weight-bold  padding0"><%=lbl.get("DATASCHEMA").get("DATA_PROVIDER")%></div>
						<div class="col-md-8 col-sm-8 col-xs-8">
		           <span>{{viewSchema.Record.dataprovidername}}</span>
				 </div>
				</div>
			  </div>
			

		        <div class="col-md-12">
		        	<span class="font-weight-bold"> <%=lbl.get("DATASCHEMA").get("SCROLL_DATAITEMS")%> </span>
		          <div style="max-height: 160px; overflow: auto;">	
		          <table class="table table-striped" style="font-family: avenir roman; font-size: 14px; color: #4f5671"  >
		            <thead>
		              <tr>
		                <th scope="col"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_HEADER_NAME")%></th>
		                <th scope="col"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_HEADER_TYPE")%></th>
		                <th scope="col"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_HEADER_ISNULL")%></th>
		                <th scope="col"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_HEADER_LENGTH")%></th>
		                <th scope="col"><%=lbl.get("DATASCHEMA").get("DESCRIPTION")%></th>
		              </tr>
		            </thead>
		            <tbody>
		              <tr ng-repeat="dataItem in viewSchema.Record.dataitems">
                    <td class="table-description">
                    <span class="span-description" ng-show="dataItem.name.length> 0" data-container="body" data-toggle="tooltip" title="{{dataItem.name}}">{{dataItem.name}}</span>
                    <span ng-show="dataItem.name.length < 1"><%=lbl.get("DATASCHEMA").get("NA")%></span>
                  </td>
		                <td>
		                	<span ng-show="dataItem.type.length > 0">{{dataItem.type}}</span>
		                	<span ng-show="dataItem.type.length < 1"><%=lbl.get("DATASCHEMA").get("NA")%></span>
		                </td>
		                <td >{{dataItem.isnull}}</td>
		                <td>
		                	<span ng-show="dataItem.datalength.length > 0">{{dataItem.datalength}}</span>
		                	<span ng-show="dataItem.datalength.length < 1"><%=lbl.get("DATASCHEMA").get("NA")%></span>
		                </td>	
		                <td class="table-description">
		                	<span class="span-description" ng-show="dataItem.description.length > 0" data-container="body" data-toggle="tooltip" title="{{dataItem.description}}">{{dataItem.description}}</span>
		                	<span ng-show="dataItem.description.length < 1"><%=lbl.get("DATASCHEMA").get("NA")%></span>
		                </td>              
		              </tr>
		            </tbody>
		          </table>
		          </div>
		          <div class="DP" style="margin: 15px 0">
		          <div class="mt-5"> <i class="fas fa fa-tag"></i>
		              <span class="font-weight-bold">{{viewSchema.Record.category}}
		              </span>
		              
		              <div class="mt-5 font-weight-bold" ng-show="viewSchema.Record.samplefilelocation !=''"> 
			              <a style="color:#4f5671" class="font-weight-bold"  ng-href="{{viewSchema.Record.samplefilelocation}}">
			              <i class="fa fa-download"></i> <%=lbl.get("DATASCHEMA").get("DOWNLOAD_SAMPLE")%></a> 
	          	 	 </div>
	          	 
	          	  </div>
		           </div>
				</div>
			</div>
			
		    <div class="modal-footer" stye="text-align:center;">
					<div class="col-md-12">
		      <button type="button" class="btn btn-successcustom" data-dismiss="modal">
		        <%=lbl.get("DATASCHEMA").get("CLOSE_MODAL")%>
		      </button>
		      <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
			</div>
		  </div>
		</div>
		</div>
		</div>
	<!-- Modal end -->
	
	<!-- Success Modal-->
	<!-- <div class="modal fade center-modal" id="hi"  role="dialog" aria-labelledby="thanksModalLabel" aria-hidden="true" style="z-index:1090!important;top: 20%;"> -->
		<div class="modal fade center-modal" id="successModal"  role="dialog" aria-labelledby="thanksModalLabel" aria-hidden="true" style="z-index:1090!important;top: 20%;">
		<div class="modal-dialog" role="document">
		  <div class="modal-content">
		    <div class="modal-header thanksModal" style="border-bottom:none;">
		      <br>
			  <div>
				<span class="checkSuccess"> <i class="fas fa-check-circle"> </i></span>
				<span style="font-size:3rem;vertical-align: middle;font-weight:600;">&nbsp;<%=lbl.get("DATASCHEMA").get("SUCCESS")%> </span>
				<p></p>
				<p></p>
			</div> 
			  <!-- <i class="far fa-check-circle outline-tick" style="font-size: 45px;"></i>
		      <p style="text-align: center; margin-top: 20; font-size: 20px;"><%=lbl.get("DATASCHEMA").get("SUCCESS")%></p> -->
			</div>
		  </div>
		</div> 
	</div>
	<!-- ------------------------------------------------------ -->	

	
	<div class="modal fade center-modal" id="alreadyFound" tabindex="-1" role="dialog" aria-hidden="true" style="z-index:1090!important;top: 20%;">
		<div class="modal-dialog" role="document">
		  <div class="modal-content">
		    <div class="modal-header">
		      <br>
		      <p ng-show="showLowAmount"><%=lbl.get("DATASCHEMA").get("DA_CST_COMM_AMNT_LOW")%></p>
		      <p ng-show="!showLowAmount"><%=lbl.get("DATASCHEMA").get("ALREADY_EXIST")%></p>
			</div>
			<div class="modal-footer" style="text-align:center;">
		  	  <button type="button" id="focusBtn" class="btn btn_save btn-successcustom" data-dismiss="modal" ng-click="defaultFilterData()"><%=lbl.get("DATASCHEMA").get("CLOSE_MODAL")%></button>
		    </div>
		  </div>
		</div> 
	</div>
	<!-- ------------------------------------------------------ -->	
	
	
	<!-- ----------------------ENDPOINT URL MODAL - START-------------------------------- -->
	<div class="modal fade center-modal" id="endPointModal" tabindex="-1" role="dialog" aria-hidden="true" style="z-index:1090!important;top: 20%;">
		<div class="modal-dialog" role="document">
		  <div class="modal-content">
		    <div class="modal-header">
		      <br>
		      <p><%=lbl.get("DATASCHEMA").get("ENDPOINT_MSG")%></p>
			</div>
			<div class="modal-footer" style="text-align:center;">
		  	  <button type="button" id="endpointModalCls" class="btn btn_save btn-successcustom" data-dismiss="modal" ><%=lbl.get("DATASCHEMA").get("CLOSE_MODAL")%></button>
		    </div>
		  </div>
		</div> 
	</div>
	<!-- ----------------------ENDPOINT URL MODAL - END-------------------------------- -->	
		
	
	<!-- ----------------------OPENDATASET MODAL - START-------------------------------- -->
	<div class="modal fade center-modal" id="openDataSetModal" tabindex="-1" role="dialog" aria-hidden="true" style="z-index:1090!important;top: 20%;">
		<div class="modal-dialog" role="document">
		  <div class="modal-content">
		    <div class="modal-header">
		      <br>
		      <p style="text-align:center;">Are you sure there is a cost for this open dataset?</p>
			</div>
			<div class="modal-footer" style="text-align:center;">
		  	  <button type="button" class="btn btn_save btn-successcustom" ng-click="setOpenDataSetValue('')">Proceed</button>
		  	  <button type="button" class="btn btn_save btn-successcustom" ng-click="setOpenDataSetValue('zero')">Set cost to 0</button>
		    </div>
		  </div>
		</div> 
	</div>
	<!-- ----------------------OPENDATASET MODAL - END-------------------------------- -->	
	
	<!-- Price Mandatory modal--> 
	 
	<div id="priceMandateModal" class="modal fade" role="dialog" style="z-index:1090!important;top: 20%;">
	    <div class="modal-dialog"> 
	        <div class="modal-content">
	            <div class="modal-body">
	                <p style="text-align:center;">Price is mandatory for Non-Open dataset</p>
	            </div>
	            <div class="modal-footer" style="text-align:center;">
	            	<button type="button" id="priceMandateMdl" class="btn btn-default  btn-successcustom btn_cancel" data-dismiss="modal" ng-click="addDataItem2()" style="color: white;z-index: 999999;;">Ok</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- COMMISION VALUE MODAL -->
	<div id="commissionValMdl" class="modal fade" role="dialog" style="z-index:1090!important;top: 20%;">
	    <div class="modal-dialog"> 
	        <div class="modal-content">
	            <div class="modal-body">
	                <p style="text-align:center;">Your dataset price should be greater than commission value</p>
	            </div>
	            <div class="modal-footer" style="text-align:center;">
	            	<button type="button" id="commMandateMdl" class="btn btn-default  btn-successcustom btn_cancel" data-dismiss="modal" ng-click="addDataItem2()" style="color: white;z-index: 999999;;">Ok</button>
	            </div>
	        </div>
	    </div>
	</div>
	
		
	
	<!-- Price Mandatory modal end -->
	<!-- <Create data modal> -->
			<div class="create modal" id="createdata">
					<div class="modal-dialog modal-lg">
							<div class="modal-content">
									<div class="modal-header padding0">
											<button type="button" class="close" style="margin-top: 0px; margin-right: 20px;;" data-dismiss="modal" ng-click="startInterval()">x</button>
									  <h3 class="font-weight-bold" style="text-align: left; padding: 10px 25px 10px 35px">Create Dataset</h3>
									</div>
			  <div class="modal-body panel-default">
				<div class="panel-body">
				  <div class="row" style="margin-top:20px;">
					<div class="form-group col-sm-6 col-md-6">
					  <label class="font-weight-bold" for="Name"><%=lbl.get("DATASCHEMA").get("NAME")%>  <span style="color:red">*</span></label>
					  <span class="requiredfileds" ng-show="nameRequired" ><%=lbl.get("DATASCHEMA").get("NAME_IS_REQUIRED")%></span>
					  <input type="text" id="datasetName" class="form-control" ng-model="dataSchema.name" placeholder="<%=lbl.get("DATASCHEMA").get("ENTER_NAME")%>"/>
					</div>
					
					<div class="form-group col-sm-6 col-md-6">
					  <label class="font-weight-bold" for="Name"><%=lbl.get("DATASCHEMA").get("PRICE")%></label>
					  <div class="input-group-btn border-button">
						<input id="isPrice" type="text" class="form-control float"  ng-model="dataSchema.price" onkeyup="return checkPrice()" placeholder="0.00" />
					  </div>
					</div>
				  </div>
				  
				  <div class="row">
					<div class="form-group col-sm-6 col-md-6">
					  <label class="font-weight-bold" for="Name"><%=lbl.get("DATASCHEMA").get("CATEGORY")%> <span style="color:red">*</span></label>
					  <span class="requiredfileds" ng-show="categoryRequired" ><%=lbl.get("DATASCHEMA").get("CATEGORY_REQUIRED")%></span>
					  <select class="form-control select-form-control" ng-model="dataSchema.category" style="cursor:pointer">
						  <option ng-repeat="cat in categoryOptions" value="{{cat.value}}">{{cat.value}}</option>
					  </select>
					</div>
					
					<div class="form-group col-sm-6 col-md-6">
					  <label class="font-weight-bold" for="Price"><%=lbl.get("DATASCHEMA").get("NUMBER_OF_RECORDS")%></label>
					  <input id="isRecord" type="text" class="form-control" ng-model="dataSchema.recordcount" onkeyup="return isNumber()" placeholder="0" />
					</div>
				  </div>
				  
				  <div class="row">
					<div class="form-group col-sm-6 col-md-6">  
					  <label class="font-weight-bold" for="Price"><%=lbl.get("DATASCHEMA").get("SOURCE")%> <span style="color:red">*</span></label>  
					  <span class="requiredfileds" ng-show="sourceRequired" > <%=lbl.get("DATASCHEMA").get("SOURCE_REQUIRED")%></span>
					  <input type="text" class="form-control" placeholder="Enter source" ng-model="dataSchema.source" maxlength="20" />              
					</div>
					
					    <div class="form-group col-sm-6 col-md-6" ng-show="enabelopendataset">
							 <label class="font-weight-bold" for="enpointurl"><%=lbl.get("DATASCHEMA").get("ENDPOINT_URL")%></label>
							 <input type="text" class="form-control" id="end_point_url" placeholder="Endpoint Url" ng-model="dataSchema.endpointurl" />
					   </div>	
					</div>
					
					<div class="row">
						<!-- <div class="form-group col-sm-6 col-md-6" style="padding-top: 19px;"> -->
						<div class="form-group col-sm-6 col-md-6">
							<label class="font-weight-bold" for="Name">Type <span style="color:red"> *</span></label>
							<span class="requiredfileds" ng-show="typeRequired" >Type is required</span>
							<select class="form-control select-form-control" ng-model="dataSchema.type" style="cursor:pointer">
								<option  value="">Select Type</option>
								<option ng-repeat="dsType in schemaTypes" value="{{dsType.value}}">{{dsType.value }}</option>
								<!-- <option  value="leads">Leads</option>
								<option  value="pos">POS</option> -->
								
							</select>
						</div>
						
						<!-- <div class="form-group col-sm-6 col-md-6" style="padding-top:40px;"> -->
						<div class="form-group col-sm-6 col-md-6">
							<label class="font-weight-bold" for="Name">Country</label>
						  <select class="test form-control select-form-control" id="countryId" multiple="multiple" ng-model="dataSchema.countries" placeholder="Select Country--" >
							  <option ng-repeat="countryObj in countriesList" value="{{countryObj.code}}">{{countryObj.name}}</option>
						  </select>
					  </div>
					</div>
					
					
					
									
						<div class="row">
						 <div class="form-group col-sm-6 col-md-6">
							 <label class="font-weight-bold" for="Price"><%=lbl.get("DATASCHEMA").get("PERIOD")%><sup><i class="fas fa-info-circle"  title="<%=lbl.get("DATASCHEMA").get("PERIOD_TOOLTIP")%>"></i></sup></label>
							   <div class="row">
								<div class="col-sm-12 col-md-12">
								  <div class="row">
									<div class="col-sm-1 col-md-1 ">
									  <label style="color: gray;font-weight: normal;" ><%=lbl.get("DATASCHEMA").get("FROM")%></label>
									</div>
								  <div class="col-md-11">
									<div class="col-sm-4 col-md-4 col-xs-4 paddingRight">
									  <select style="padding: 6px 2px !important" class="form-control select-form-control" style="cursor:pointer" ng-model="dataSchema.fromyear" ng-change="setLastDate('FROM')">
										<option value="0" selected><%=lbl.get("DATASCHEMA").get("YEAR")%></option>
										<option ng-repeat="year in yearsFrom" value="{{year}}" >{{year}}</option>
									  </select>
									</div>
									
									<div class="col-sm-4 col-md-4 col-xs-4 paddingRight paddingLeft5">
									  <select style="padding: 6px 6px !important" class="form-control select-form-control" style="cursor:pointer" ng-model="dataSchema.frommonth" ng-change="setLastDate('FROM')"  ng-disabled="dataSchema.fromyear == undefined || dataSchema.fromyear == null || dataSchema.fromyear == ''  || dataSchema.fromyear == 0">
										<%-- <option value=""><%=lbl.get("DATASCHEMA").get("MONTH")%></option> --%>
										<option value="0" selected><%=lbl.get("DATASCHEMA").get("MONTH")%></option>
										<option ng-repeat="month in monthsFrom" value="{{month}}" >{{month}}</option>
									  </select>
									</div>
									
									<div class="col-sm-4 col-md-4 col-xs-4 paddingLeft5" style="padding-right:0;">
									  <select style="padding: 6px 6px !important" class="form-control select-form-control" style="cursor:pointer" ng-model="dataSchema.fromdate" ng-disabled="dataSchema.frommonth == undefined || dataSchema.frommonth == null || dataSchema.frommonth == ''  || dataSchema.frommonth == 0">
										<option value="0" selected><%=lbl.get("DATASCHEMA").get("DATE")%></option>
										<option ng-repeat="day in daysFrom" value="{{day}}" >{{day}}</option>
									  </select>
									</div>     
									</div>               
								  </div>
								</div>
								</div>
								
								<div class="row" style="margin-top: 10px;">
						 			<div class="form-group col-sm-12 col-md-12">
								
								<!-- <div class="col-sm-6 col-md-6"> -->
								  <div class="row">
									<div class="col-sm-1 col-md-1 ">
									  <label style="color: gray;font-weight: normal;"><%=lbl.get("DATASCHEMA").get("TO")%></label>
									</div>
									<div class="col-md-11">
									<div class="col-sm-4 col-md-4 col-xs-4 paddingRight">
									  <select style="padding: 6px 6px !important" class="form-control select-form-control" style="cursor:pointer" ng-model="dataSchema.toyear" ng-change="setLastDate('TO')">
										<option value="0" selected><%=lbl.get("DATASCHEMA").get("YEAR")%></option>
										<option ng-repeat="year in yearsTo" value="{{year}}" >{{year}}</option>
									  </select>
									</div>
									<div class="col-sm-4 col-md-4 col-xs-4 paddingRight paddingLeft5">
									  <select style="padding: 6px 6px !important" class="form-control select-form-control" style="cursor:pointer" ng-model="dataSchema.tomonth"  ng-change="setLastDate('TO')" ng-disabled="dataSchema.toyear == undefined || dataSchema.toyear == null || dataSchema.toyear == ''  || dataSchema.toyear == 0">
										<option value="0" selected><%=lbl.get("DATASCHEMA").get("MONTH")%></option>
										<option ng-repeat="month in monthsTo" value="{{month}}" >{{month}}</option>
									  </select>
									</div>
									<div class="col-sm-4 col-md-4 col-xs-4 paddingLeft5"  style="padding-right:0;">
									  <select style="padding: 6px 6px !important" class="form-control select-form-control" style="cursor:pointer" ng-model="dataSchema.todate" ng-disabled="dataSchema.tomonth == undefined || dataSchema.tomonth == null || dataSchema.tomonth == ''  || dataSchema.tomonth == 0">
										<option value="0" selected><%=lbl.get("DATASCHEMA").get("DATE")%></option>
										<option ng-repeat="day in daysTo" value="{{day}}" >{{day}}</option>
									  </select>
									</div>
									</div>
								  </div>
								</div>
							  </div>
							</div>
							
							
							  <div class="form-group col-sm-6 col-md-6">
									<label class="font-weight-bold" for="Name"><%=lbl.get("DATASCHEMA").get("SAMPLE_DATA")%></label></br>
									<input type="radio" name="fileType"  value="document" ng-model="dataSchema.samplefiletype" ng-change="chooseFileType()" style="padding: 10px; cursor: pointer;"><span  style="color: gray;font-weight: normal;"> <%=lbl.get("DATASCHEMA").get("UPLOAD_FILE")%></span>
									<input type="radio" name="fileType"  value="url" ng-model="dataSchema.samplefiletype" ng-change="chooseFileType()" style="padding: 10px; cursor: pointer;"><span  style="color: gray;font-weight: normal;"> <%=lbl.get("DATASCHEMA").get("SAMPLE_URL")%></span>
								  </div>
								  <div class="form-group col-sm-6 col-md-6">
										 <div ng-hide="uploadFile" class="file-upload" style="padding-top:1px;">
										  <div class="file-select">
												  <div class="file-select-name" id="noFile"><%=lbl.get("DATASCHEMA").get("FILE_FORMATS")%></div> 
											<div class="file-select-button pull-right" id="fileName" ><%=lbl.get("DATASCHEMA").get("CHOOSE_FILE_TYPE")%></div>
										 
											<input type="file" id="documrtfile" ng-model="samplefilelocation" accept=".txt,.doc,.docx,.rtf,.pdf">
										  </div>        
									  </div>
									  <div ng-show="uploadFile">
										  <input type="text" ng-model="samplefilelocation" class="form-control ng-pristine ng-valid ng-touched" style="height: 40px !important;"/>
									  </div>                                  
								  </div>
						 </div>
						 
						 
						 <div class="row">
							 
							 <div class="form-group col-sm-6 col-md-6" ng-show="enabelopendataset">
							  <label class="font-weight-bold"><%=lbl.get("DATASCHEMA").get("OPEN_DATASET")%>
							  <div style="padding-top: 5px;">
									<input type="radio" value="yes" ng-model="dataSchema.opendataset"  style="padding: 10px; cursor: pointer;"><span style="font-weight: normal;"> <%=lbl.get("DATASCHEMA").get("OPEN_DATA_YES")%></span>
									<input type="radio" value="no" ng-model="dataSchema.opendataset"  style="padding: 10px; cursor: pointer;"><span style="font-weight: normal;"> <%=lbl.get("DATASCHEMA").get("OPEN_DATA_NO")%></span>
									</div>
							</div>
								  
							<div class="form-group col-sm-6 col-md-6" ng-hide="enabelopendataset">
								 <label class="font-weight-bold" for="enpointurl"><%=lbl.get("DATASCHEMA").get("ENDPOINT_URL")%></label>
								 <input type="text" class="form-control" placeholder="Endpoint Url" ng-model="dataSchema.endpointurl" />
							</div>
						 </div>
						 
						 
						
						<div class="form-group dec_area">
						<div class="form-group">
						  <label class="font-weight-bold" for="Description" required><%=lbl.get("DATASCHEMA").get("DESCRIPTION")%> <span style="color:red">*</span></label>
						  <span class="requiredfileds" ng-show="descriptionRequired"><%=lbl.get("DATASCHEMA").get("DESCRIPTION_REQUIRED")%></span>
						  <span class="requiredfileds" ng-show="descriptionMaxChar"><%=lbl.get("DATASCHEMA").get("MAXIMUM_CHARATER")%></span>
						  <textarea class="form-control" rows="5" ng-model="dataSchema.description" id="comment"></textarea>
						</div>
						<br/>
						<div class="">
						<div class="table_create">
						  <label class="font-weight-bold tb_top" for="Price" title="<%=lbl.get("DATASCHEMA").get("DATA_ITEM_TOOLTIP")%>"><%=lbl.get("DATASCHEMA").get("DATA_ITEM")%><sup><i
								class="fas fa-info-circle"></i></sup></label>
						  <div class="row group_data" style="margin-left: 15px;margin-right: 15px">
							<div class="form-group col-sm-6 col-md-6">
							  <label class="font-weight-bold"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_NAME")%></label>
							  <span class="requiredfileds" ng-show="dataItemnameExists"><%=lbl.get("DATASCHEMA").get("COLUMN_EXISTS")%></span>
							  <span class="requiredfileds" ng-show="dataItemnameRequired">  <%=lbl.get("DATASCHEMA").get("DATA_ITEM_NAME_REQUIRED")%></span>
							  <span class="requiredfileds" ng-show="dataItemAtleastOne"><%=lbl.get("DATASCHEMA").get("MINIMUM_DATAITEM_FILED")%> </span>
							  <input type="text" class="form-control" ng-model="itemname" placeholder="<%=lbl.get("DATASCHEMA").get("DATA_ITEM_NAME_PLACE")%>" />
							  
							</div>
							<div class="D-item">
							  <div class="form-group col-sm-6 col-md-6">
								<!-- <label class="font-weight-bold">Data Item</label> -->
								<label class="font-weight-bold"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_TYPE")%></label>
								<select class="form-control select-form-control" ng-model="itemtype" id="sel1" style="cursor:pointer">
									<option value="" disabled selected><%=lbl.get("DATASCHEMA").get("SELECTTYPE")%></option>
								  <option ng-repeat="typ in dataTypeOptions" value="{{typ.value}}">{{typ.value}}</option>
								</select>
							  </div>
							  <div class="form-group col-sm-6 col-md-6">
								<label class="checkbox-inline"><input type="checkbox" ng-model="itemisnull" value="" /> <b><%=lbl.get("DATASCHEMA").get("IS_NULL")%></b></label>
								<!-- <label class="font-weight-bold">Data length</label> -->
								<div style="padding-top: 20px;">
								<label class="font-weight-bold"><%=lbl.get("DATASCHEMA").get("DATAITEM_LENGTH")%></label>
								<input type="text" class="form-control" id="isSize" ng-model="datalength" onkeyup="return isSizeNumber()" placeholder="0" />
								</div>
							  </div>
							  <div class="form-group col-sm-6 col-md-6">
								<label class="font-weight-bold" for="Description" required><%=lbl.get("DATASCHEMA").get("DESCRIPTION")%></label>
								<textarea class="form-control" rows="3" ng-model="itemDescription" ></textarea>
							  </div>
							  <div style="text-align:center!important" class="schema_btns col-sm-12" style="padding-bottom: 10px;">
								<button class="btn refresh font-weight-bold" ng-click="clearObj()">
								  <i class="fas fa-redo-alt"></i> <%=lbl.get("DATASCHEMA").get("RESET")%>
								</button>
								<button class="btn add_field font-weight-bold" ng-click="addDataStructure()">
								  <i class="fas fa-plus"></i> <%=lbl.get("DATASCHEMA").get("ADD")%>
								</button>
							  </div>
							  <div ng-if="dataSchema.dataitems.length">
								<table class="table table-striped" >
								  <thead>
									<tr>
									  <th scope="col"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_HEADER_NAME")%></th>
									  <th scope="col"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_HEADER_TYPE")%></th>
									  <th scope="col"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_HEADER_ISNULL")%></th>
									  <th scope="col"><%=lbl.get("DATASCHEMA").get("DATA_ITEM_HEADER_LENGTH")%></th>
									  <th scope="col"><%=lbl.get("DATASCHEMA").get("DESCRIPTION")%></th>
									  <th class="last_col" scope="col">&nbsp;</th>
									</tr>
								  </thead>
								  <tbody id="dragDrop">
									<tr ng-repeat="datas in dataSchema.dataitems">
									   <td>{{datas.name}}</td>
									   <td>{{datas.type}}</td>
									   <td>{{datas.isnull}}</td>
									   <td>{{datas.datalength}}</td>
									   <td>{{ datas.description | limitTo: 10 }}{{datas.description.length > 10 ? '...' : ''}}</td>
									   <td class="last_col">
										<i class="fa fa-trash act_icon aligncenter" aria-hidden="true" ng-click="deleteRow($index)"></i>
									  </td>
									</tr>
								  </tbody>
								</table>
							  </div>
							</div>
						  </div>
						</div>
					 
					  </div>
						<br/>
						<div class="row">
						  <div class="schema_btns" style="margin-top: 20px;">
							<button class="btn btn-default uButton"  data-dismiss="modal" ng-click="cancel('')"><%=lbl.get("DATASCHEMA").get("CANCEL")%></button>
							<button class="btn btn-successcustom marginLeft5" ng-hide="modal" ng-click="addDataItem3()" ng-show="saveButtonStatus" ><%=lbl.get("DATASCHEMA").get("SAVE")%></button>
							<button class="btn btn_save btn-successcustom" ng-hide="saveButtonStatus"><%=lbl.get("DATASCHEMA").get("SAVE")%> <i class="fas fa-spinner fa-spin"></i> </button>
						  </div>
						</div>
					  </div>
					  </div>
					  </div>
					</div>  
			<!-- <END> -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>	  
  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
	<script src="resources/js/ngstorage.min.js"></script>
	<script src="resources/js/datafedApp.js"></script>
	<script src="resources/controller/datafedController.js"></script>
	
	<!-- COUNTRY LIST ===========-->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script src="resources/js/fSelect.js"></script>
	
	<!-- COUNTRY LIST ===========-->
	

</body>
<script>

	$('input.float').on('input', function() {
	  this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	});


	$(function(){
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
		$('#datafedmenu').addClass('menu-active');
	});
	$(document).ready(function () {	     
	      $("#filter-icon").on("click", function () {
	        $(".filter-container").toggle();
	      });
	      
	      $(".mycollap").on("click", function () {
		        $(".filter-container").toggle();
	      });
	      
    });
	
	
	function checkPrice(){
        var input = document.getElementById('isPrice');
        /* var ponto = input.value.split('.').length; */
        var ponto = input.value.length;
        if (ponto > 5)
                input.value=input.value.substr(0,(input.value.length)-1);
        
        input.value=input.value.replace(/[^0-9-]/,'');

        if (ponto ==2)
			input.value=input.value.substr(0,(input.value.indexOf('.')+3));
	
		if(input.value == '.')
			input.value = "";
		
	}
	
	function isNumber(){
        var input = document.getElementById('isRecord');
        input.value=input.value.replace(/[^0-9]/,'');
	}
	
	function isSizeNumber(){
        var input = document.getElementById('isSize');
        input.value=input.value.replace(/[^0-9]/,'');
	}
	
	$(document).on('click','#focusBtn',function() {
		$("#datasetName").focus();
	});

	$(document).on('click','#focusBtnCreateBtn',function() {
		$("#datasetName").focus();
	});
	
	$(document).on('click','#endpointModalCls',function() {
		$("#end_point_url").focus();
	});

	$(document).on('click','#priceMandateMdl',function() {
		$("#isPrice").focus();
	});

	$(document).on('click','#commMandateMdl',function() {
		$("#isPrice").focus();
	});
	

	$(window).scroll(function (e){
	    var body = document.body;    
	    var scrollTop = this.pageYOffset || body.scrollTop;
	    if (body.scrollHeight - scrollTop === parseFloat(body.clientHeight)) {
	        angular.element(document.querySelector('[ng-controller="datafedController"]')).scope().scrollingIsActiveRightNow();
		}
	});


	<!-- COUNTRY LIST ===========-->
	(function($) {
	    $(function() {
	        window.fs_test = $('.test').fSelect();
	    });
	})(jQuery);

	function clearCountryList(){
		$('#countryId option:selected').removeAttr('selected');
		$('#countryId').prev(".fs-dropdown").find(".fs-options .fs-option").each(function() {
		    $(this).removeClass('selected', false);
	    });
		var x = document.getElementsByClassName("fs-label");
	    for(var i = 0; i < x.length; i++){
	    	x[i].innerText="Select Country";
	    }
	}

	<!-- COUNTRY LIST ===========-->

	
</script>

<script type="text/javascript">
  $('#dragDrop').sortable();
  $("#dataset").addClass("active");
</script>

</html>
