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
  <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.css">
  <link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/search.css">
  <link rel="stylesheet" href="resources/css/mob-res.css">
  
	<script>
	var orgid="<%=session.getAttribute("loginOrgId")%>";
	var WEB_SCRAPING = "<%=WEB_SCRAPING_URL%>";
	
	</script>  
	<style type="text/css">
	.dragDrpBx p a, a:hover, a:focus{
		color: #08c;
		}

		.webBox {
		    width: 100%;
		    min-height: 140px;
		    padding: 10px;
		    border-radius: 4px;	
		    /* border: 1px solid #ddd; */
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
		.input-tags {
		  width: 100%;
		  padding: 15px;
		  display: block;
		  margin: 0 auto;
		}
		.tagsinput{
			min-width: 100%;
		}
		
		.label-info {
		  background-color: #5bc0de;
		  padding: 3px;
		}
		
		[ng\:cloak], [ng-cloak], .ng-cloak {
		  display: none !important;
		}
		h4{
			margin-top:0px!important;
			margin-bottom: 0px!important;
		}
		.table-condensed thead tr th{
			background-color: rgb(241, 241, 241)!important;
			color: black;
		}
	.fa-angle-left{
		/* font-size: 25px;
    font-weight: bold;
    border-radius: 50%;
    border: 1px solid #333;
    color: #333;
    width: 40px;
    height: 40px;
    line-height: 40px;
    text-align: center;
	margin-bottom: 15px; */
	font-size: 25px;
    border-radius: 50%;
    border: 1px solid #fff;
    color: #fff;
    width: 26px;
	text-align: center;
	margin-right: 10px;
}
	.fa-angle-left:focus{
	font-size: 25px;
    border-radius: 50%;
    border: 1px solid #fff;
    color: #fff;
    width: 26px;
	text-align: center;
	margin-right: 10px;
	}
	.fa-angle-left:hover{
		 border: 1px solid#96CA4E;
    color: #96CA4E;

	}
	</style>
</head>
	<body ng-clock ng-app="sentiApp" ng-controller="brotherPromo" id="mainContainer" style="display:none">
		<jsp:include page="new_header.jsp"></jsp:include>
	
		<div class="container-fluid paddingLR30  paddingTop0 padding0" style="margin-top: 70px">			
		
			
			<div class ="titleInfo">
					<h4 class="dastitl btn_bg"  style="text-align: left;" ng-hide="viewType"> 	<a class="fa fa-angle-left" href="promolist" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="back"></a>Add Promotion</h4>
					<h4 class="dastitl btn_bg" ng-show="viewType">Update Promotion</h4>
				</div>
				<div class="clearfix"></div>

				<div class="tablData box table-bottom">
					<!-- <div class="loadr" ng-show="loadr"></div> -->
					<div class="loading-container" ng-show="loadeer">
						<div class="loading">
						  <span>Loading...</span>
						</div>
					  </div>
						<form class="webBox">
							<div class="formGrp marginTop20" >
									<div class="formLabel col-sm-3">
										<h3>Title</h3>
									</div>
									<div class="formField col-sm-6">
										<input type="text"  ng-model="title" placeholder="">
										<input type="hidden"  ng-model="id" placeholder="">
									</div>
									<div class="formField col-sm-3">
										<span class="error" ng-show="!title && !formValid">* Please enter the title</span>
									</div>
								</div>
								
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3>Description</h3>
								</div>
								<div class="formField col-sm-6">
									<textarea  ng-model="desc" placeholder=""></textarea>
								</div>
								<div class="formField col-sm-3">
										<!-- <span class="error" ng-show="!desc && !formValid">* Please enter description</span> -->
								</div>
							</div>
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3>Category</h3>
								</div>
								<div class="col-sm-6 formSelect">
									<select  multiple="multiple"  id="category" ng-model="category">{{category}}
                                		<option value="Home">Home</option>
										<option value="Work">Work</option>
                            		</select>
								</div>
									<div class="formField col-sm-3">
										<span class="error" ng-show="category.length<1 && !formValid">* Please select category</span>
									</div>
								<div class="clearfix"></div>
							</div>
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3>Product type</h3>
								</div>
								<div class="col-sm-6 formSelect">
									<select  multiple="multiple"  id="prdtype" ng-model="prdtype">
                                		<option value="Printer & Multi-function">Printer & Multi-function</option>
                                		<option value="Scanner">Scanner</option>
										<option value="Labeller">Labeller</option>
										<option value="Sewing Machine">Sewing Machine</option>
										<option value="ScanNCut">ScanNCut</option>
										<option value="Fax Machine">Fax Machine</option>
										
                            		</select>
								</div>
								<div class="formField col-sm-3">
										<span class="error" ng-show="prdtype.length<1 && !formValid">* Please select product type</span>
									</div>
								<div class="clearfix"></div>
							</div>
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3>Product model</h3>
								</div>
								<div class="col-sm-6">
									<!-- <select  multiple="multiple"  id="model" >
                                		<option value="AA">AA</option>
										<option value="BB">BB</option>
										<option value="CC">CC</option>
                            		</select> -->
                            		 <input name="tags" id="input-tags" value="add a tagsss"  ng-model="model" placeholder="hello" style="min-width: 100%;"/>
								</div>
								<div class="formField col-sm-3">
									<span class="error" ng-show="!model && !formValid">* Please enter the model</span>
								</div>
							</div>
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3 >Offer</h3>
								</div>
								<div class="formField col-sm-6">
									<input type="text" id="offer" ng-model="price" placeholder="">
								</div>
								<div class="formField col-sm-3">
									<span class="error" ng-show="!price && !formValid">* Please enter the offer</span>
								</div>
							</div>
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3>Promotion period</h3>
								</div>
								<div class="formField col-sm-6">
									<input type="text" id="range" ng-model="period" placeholder="" autocomplete="off">
									<i class="fa fa-calendar" onclick="document.getElementById('range').focus()" style="position: absolute;top: 12px; right: 20px;"></i>
								</div>
								<div class="formField col-sm-3">
									<span class="error" ng-show="!period && !formValid">* Please enter the period</span>
								</div>
							</div>
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3>Redemption deadline</h3>
								</div>
								<div class="formField col-sm-6">
									<input type="text" id="startdate" ng-model="dedline"  autocomplete="off"/>
			    					<i class="fa fa-calendar" onclick="document.getElementById('startdate').focus()" style="position: absolute;top: 12px; right: 20px;"></i>
								</div>
								<div class="formField col-sm-3">
									<span class="error" ng-show="!dedline && !formValid">* Please enter the deadline</span>
								</div>
							</div>
							<div class="formGrp marginTop20" >
									<div class="formLabel col-sm-3">
										<h3>Promotion URL</h3>
									</div>
									<div class="formField col-sm-6">
										<input type="text"  ng-model="promotionurl" placeholder="">
									</div>
									<div class="formField col-sm-3">
										
									</div>
								</div>
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3>PDF upload</h3>
								</div>
									<div class="relative formUpload col-sm-6" style="padding-left:15px">
										<div ng-hide="showPdf" class="dragDrpBx" ngf-select="uploadFiles($files)" ngf-drop="uploadFiles($files)" ng-model="files" multiple="true">
											<p><a>Choose PDF or Drag here to upload</a></p>
										</div>
										<div ng-show="showPdf">
											<i class="fa fa-close removeIcon" ng-click="removePdf()"></i>
											<img height="90px" src="resources/images/img-doc-pdf.png">
											<span>{{files[0].name}}</span>
										</div>
									</div>
									<div class="formField col-sm-3">
										<%-- <span class="error" ng-show="files.length < 1 && !formValid">* Please choose a PDF</span> --%>
									</div>
							</div>
							<div class="formGrp">
								<div class="formLabel col-sm-3">
									<h3>Image upload</h3>
								</div>
									<div class="relative formUpload col-sm-6" style="padding-left:15px">
										<div ng-hide="showImg" class="dragDrpBx" ngf-select="uploadImages($files)" ngf-drop="uploadImages($files)" ng-model="images" multiple="true">
											<p><a>Choose image or Drag here to upload</a></p>
										</div>
										<div ng-show="showImg">
											<i class="fa fa-close removeIcon" ng-click="removeImg()"></i>
											<img height="90px" src="resources/images/img-img.png">
											<span>{{images[0].name}}</span>
										</div>
									</div>
									<div class="formField col-sm-3">
									</div>
							</div>
							
							
							<div class="clearfix"></div>
							
							<div class="formGrp">
								<div class="formBtn marginTop20 col-md-9" style="text-align:right;">									
									<button class="btn btn-default uButton"  ng-click="clearForm()" id="clearBtn" ng-hide="viewType">Clear</button>
									<button class="btn btn-default uButton"  ng-click="cancelForm()" ng-show="viewType">Cancel</button>
									<button type="button" class="btn btn-successcustom marginRight20" ng-click="addPromotion()">Submit</button>	
								</div>
							</div>

							<div class="clearfix"></div>
						</form>
						<div class="clearfix"></div>
				</div>	
				
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
	  	<script src="resources/controller/brotherPromo.js"></script>
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
	  	
  		<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css" />
		<link href="resources/css/multiple-select.css" rel="stylesheet" />
		<script src="resources/js/multiple-select.js"></script>
		<script src="resources/js/bootstrap-datepicker.js"></script>
		
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	    <script type="text/javascript" src="https://cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
	    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
	    
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-tagsinput/1.3.6/jquery.tagsinput.min.css" rel="stylesheet">
	    <script src="resources/js/jquery.tagsinput.min.js"></script>
		
		
	</body>
		<script>
	var newDate= new Date();
	$(function(){
		$('#brother').addClass('menu-active');
		$('#startdate').datepicker({
			format: 'yyyy-mm-dd',
		});
		
		$('#range').daterangepicker({locale: {
		      format: 'YYYY-MM-DD'
	    },});
		$('#category').multipleSelect({
            width: '100%'
        });
		$('#prdtype').multipleSelect({
            width: '100%'
        });
		$('#model').multipleSelect({
            width: '100%'
        });
		$('#input-tags').tagsInput();
	})
	
	$( "#clearBtn" ).click(function() {
		$('#category').val([]);
		$('#category').multipleSelect({
            width: '100%'
        });
		$('#prdtype').val([]);
		$('#prdtype').multipleSelect({
            width: '100%'
        });
	});
	
	$(".tpMenu").addClass("menuShadow");
</script>
</html>