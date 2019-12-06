
<!DOCTYPE html>
<html>
<%@include file="session.jsp"%>
<%@page contentType="text/html; charset=UTF-8" %>
<head>
	<meta charset="utf-8">
    <title>TEPCO</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   
    <!-- DataTables -->
    <link href="resources/tepcodemo/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="resources/tepcodemo/assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <!-- jvectormap -->
    <link href="resources/tepcodemo/assets/libs/jqvmap/jqvmap.min.css" rel="stylesheet">
	 <!-- ION Slider -->
    <link href="resources/tepcodemo/assets/libs/ion-rangeslider/css/ion.rangeSlider.css" rel="stylesheet" type="text/css">
    <link href="resources/tepcodemo/assets/libs/ion-rangeslider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet" type="text/css">
    <!-- Icons css -->
    <link href="resources/tepcodemo/assets/libs/%40mdi/font/css/materialdesignicons.min.css" rel="stylesheet" type="text/css">
    <link href="resources/tepcodemo/assets/libs/dripicons/webfont/webfont.css" rel="stylesheet" type="text/css">
    <link href="resources/tepcodemo/assets/libs/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <!-- App css -->
    <link rel="stylesheet" href="resources/tepcodemo/assets/css/app.min.css">
    <link rel="stylesheet" href="resources/tepcodemo/assets/css/multiple-select.css">
	<!-- Date Range -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
    <link href="resources/tepcodemo/assets/libs/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="resources/tepcodemo/assets/css/bootstrap-multiselect.css" rel="stylesheet">
    <link href="resources/tepcodemo/assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
	<style>
		.daterangepicker{
			width: 43% !important;
		}
		.daterangepicker.ltr .drp-calendar.left{
			margin-right: 80px !important;
		}
		.table-condensed tr th,td {
			color:#343b4a;
		}
		.irs-min,.irs-max{
			display:none;
		}
		
		.font12{
		  font-size:12px;
		}
		 /*style the box*/  
         .gm-style .gm-style-iw {
			color:#36364c;
         }  
		 
		 .loader {
		  border: 16px solid #f3f3f3;
		  border-radius: 50%;
		  border-top: 16px solid #3498db;
		  width: 100px;
		  height: 100px;
		  -webkit-animation: spin 2s linear infinite; /* Safari */
		  animation: spin 2s linear infinite;
		}
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #customers tr:nth-child(even){background-color: #f2f2f2;}

        #customers tr:hover {background-color: #ddd;}
        #content{
            width: 400px;
        }
		
		</style>
	
</head>

<body>
    <!-- Begin page -->
    <div id="wrapper">
        <!-- Navigation Bar-->
        <header id="topnav">
            <nav class="navbar-custom">
              
                <ul class="list-unstyled menu-left mb-0">
                    <li class="float-left"><a href="index-2.html" class="logo logo-light"><span class="" style="font-size:16px;font-weight:bold;color:#bdc3d0">TEPCO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="logo-sm"></span></a></li>
                    <li class="float-left">
                        <a class="button-menu-mobile open-left navbar-toggle">
                            <div class="lines"><span></span> <span></span> <span></span></div>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- end navbar-custom -->
        </header>
        <!-- End Navigation Bar-->
        <!-- ========== Left Sidebar Start ========== -->
        <div class="left-side-menu">
            <div class="slimscroll-menu">
                <!--- Sidemenu -->
                <div id="sidebar-menu">
                    <ul class="metismenu" id="side-menu">
                        <li class="menu-title">Navigation</li>
                        <li><a href="tepcodemo"><i class="mdi mdi-view-dashboard"></i> <span>Dashboard 1</span></a></li>
                        
                        <li><a href="geospatial"><i class="mdi mdi-view-dashboard"></i><span> Dashboard 2 </span></a> </li>
                       
                        <!--<li><a href="javascript:void(0);"><i class="mdi mdi-google-pages"></i> <span>Additional Services </span></a> </li>-->
                    </ul>
                </div>
                <!-- Sidebar -->
                <div class="clearfix"></div>
            </div>
            <!-- Sidebar -left -->
        </div>
        <!-- Left Sidebar End -->
        <!-- Page Content Start -->
        <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                    <!-- Page title box -->
                    <div class="page-title-box">
                        <h4 class="page-title">Dashboard 2</h4></div>
                    <!-- End page title box -->
					<div class="row">
						<div class="col-sm-12 col-xs-12">
                            <div class="dropdown float-right"><a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <!-- item--><a href="javascript:void(0);" class="dropdown-item">CASE A</a>
                                    <!-- item--><a href="javascript:void(0);" class="dropdown-item">CASE B</a>
                                    <!-- <a href="javascript:void(0);" class="dropdown-item">Date Range</a>item-->
                                </div>
                            </div>
                            <h5 class="header-title mb-3 float-right" id="view_by" style="margin-right: 20px"></h5>
								
								<div class="row text-center" id="r1">
									<div class="col-sm-10 mb-3" >
											<input type="hidden" id="fromValue">
											<input type="hidden" id="toValue">
	                                        <input type="text" id="range_01">
									</div>
								
									<div class="col-sm-2 mb-3">
									
									</div>
									
								</div>
								 
								<div class="row ">

                                    <div class="col-sm-3 mb-3">
                                        
                                        <div class="form-group" id="daterange" style="margin-left:0px;width:284px">
                                                <label>Date range</label>
                                            <input type="text" id="datepicker" class="form-control" >
                                        </div>
                                    </div>
									
									<div class="col-sm-3 mb-3" id="d1">
                                        <label>Prefecture</label>
                                        <select  class="form-control" multiple="multiple"  id="state" style="margin-left: 0px;width:290px;">
                                             <option value="神奈川県">神奈川県</option>
                                            <option value="山梨県">山梨県</option>
                                        </select>
									</div>	
                                    <div class="col-sm-3 mb-3" id="d2" style="display: none">
                                            <label>City / Ward</label>
                                            <select class="form-control" multiple="multiple"  id="city" style="margin-left: 0px;width:290px;">
                                            
                                        </select>
									</div>	
                                    <div class="col-sm-3 mb-3" id="d3" style="display: none">
                                            <label>Section / Area</label>
                                            <select class="form-control" multiple="multiple"  id="add1"  style="margin-left: 0px;width:290px;">
                                            
                                        </select>
                                    </div>
                               
                                    <div class="col-sm-3 mb-3" id="d4" style="display: none">
                                            <label>Chome</label>
                                            <select  class="form-control" multiple="multiple" id="add2" style="margin-left: -9px;width:290px" >
                                               
                                            </select>
                                        </div>
                                    <div class="col-sm-3 mb-3" id="d5" style="display: none">
                                            <label>Block Number</label>
                                            <select  class="form-control" multiple="multiple" id="post" style="width:290px" >
                                               
                                            </select>
                                        </div>	
                                    <div class="col-sm-3 mb-3" id="d6" style="display: none">
                                            <label>Building Number</label>
                                            <select  class="form-control" multiple="multiple" id="postpre" style="margin-left: -9px;width:290px" >
                                              
                                            </select>
                                        </div>	
									<div class="col-sm-3 mb-3">
										<button type="button" class="btn btn-success w-md" style="margin-left: 0px;margin-top: 30px;" onclick="getChartData()">Get MapData</button>
									</div>
									</div>
                            </div>
                            <!-- end card-box-->
						
						</div>
					</div>
					 <!--<div class="progress mb-0" id="progress">
						<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
					</div>-->
                    <div class="row" >
                            <div class="col-xl-3" id="t1" style="display: none">
                                <div class="card-box">
                                    <h4 class="header-title text-center">Households</h4>
                                    <!-- <p class="text-muted">March 26 - April 01</p>-->
                                    <div class="mb-3 mt-4">
                                        <div class="float-right d-none d-xl-block"></div>
                                        <h4 class="font-weight-light text-center"><span id="households">0</span></h4></div>
                                </div>
                            </div>
                            <div class="col-xl-3" id="t2" style="display: none">
                                <div class="card-box" style="height: 136px;">
                                
                                    <h4 class="header-title text-center">Average Energy <span class="font12">(kWh)</span></h4>
                                    <div class="mb-3 mt-4">
                                        <div class="float-right d-none d-xl-block"></div>
                                        <h4 class="font-weight-light text-center"><span id="average">0</span> </h4></div>
                                </div>
                            
                            </div>
                            <div class="col-xl-3" id="t3" style="display: none">
                                <div class="card-box">
                                    <h4 class="header-title text-center">Minimum Energy <span class="font12">(kWh)</span></h4>
                                    <!--<p class="text-muted">March 01 - April 01</p>-->
                                    <div class="mb-3 mt-4">
                                        <div class="float-right d-none d-xl-block"></div> 
                                        <h4 class="font-weight-light text-center"><span id="minimum">0</span> </h4></div>
                                        <div class="chartjs-chart dash-sales-chart" style="display:none">
                                            <canvas id="sales-chart"></canvas>
                                        </div>
                                </div>
                            </div>
                            <div class="col-xl-3" id="t4" style="display: none">
                                <div class="card-box">
                                    <h4 class="header-title text-center">Maximum Energy <span class="font12">(kWh)</span></h4>
                                    <div class="mb-3 mt-4">
                                        <div class="float-right d-none d-xl-block"></div>
                                        <h4 class="font-weight-light text-center"> <span id="maximum">0</span> </h4></div>
                                        <div class="chartjs-chart dash-sales-chart" style="display:none;">
                                            <canvas id="sales-chart"></canvas>
                                        </div>
                                </div>
                            </div>      
                         
                        <!-- end col -->

                        <div class="col-xl-12">
                            <div class="card-box">
                               
                                <h4 class="header-title mb-3">Number of households energy consumption within the range (<span class="font12">kWh</span>)</h4>
								
                                <div class="chartjs-chart high-performing-product" id="map">
                                    
                                </div>
								<div id="loader" class="loader" style="left:40%;position:absolute;top:-10%;background:none;display:none"></div>
                            </div>
                            <!-- end card-box-->
							
                        </div>
                        <!-- end col -->
                       
                    </div>
                    <!-- end row -->
                    
                     <!-- /.modal -->
                                <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog modal-dialog-centered modal-sm">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="mySmallModalLabel">Alert !!</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <div class="modal-body" id="mbodytxt"></div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->
                </div>
            </div>
        </div>
        <!-- End Page Content-->
        <!-- Footer -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 text-center">2018 © Sentient.io.</div>
                </div>
            </div>
        </footer>
        <!-- End Footer -->
 
    </div>
    <!-- End #wrapper -->
    <!-- jQuery  -->
    <script src="resources/tepcodemo/assets/libs/jquery/jquery.min.js"></script>
    <script src="resources/tepcodemo/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/tepcodemo/assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="resources/tepcodemo/assets/libs/metismenu/metisMenu.min.js"></script>
    <!-- KNOB JS -->
    <script src="resources/tepcodemo/assets/libs/jquery-knob/jquery.knob.min.js"></script>
    <!-- Chart JS -->
    <script src="resources/tepcodemo/assets/libs/chart.js/Chart.bundle.min.js"></script>
    <!-- Jvector map -->
    <script src="resources/tepcodemo/assets/libs/jqvmap/jquery.vmap.min.js"></script>
    <script src="resources/tepcodemo/assets/libs/jqvmap/maps/jquery.vmap.usa.js"></script>
   
	
	<!-- Bootstrap Date Range -->
    <script src="resources/tepcodemo/assets/libs/bootstrap-daterangepicker/daterangepicker.js"></script>
	 <script src="resources/tepcodemo/assets/libs/bootstrap-select/js/bootstrap-select.min.js"></script>
	 <!-- Range slider js -->
    <script src="resources/tepcodemo/assets/libs/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
    <script src="resources/tepcodemo/assets/js/jquery.range-sliders.js"></script>
  
    <!-- Dashboard Init JS -->
    <script src="resources/tepcodemo/assets/js/jquery.dashboard2.js"></script>
    <!-- App js -->
    <script src="resources/tepcodemo/assets/js/jquery.core.js"></script>
    <script src="resources/tepcodemo/assets/js/jquery.app.js"></script>
    
    <script src="resources/tepcodemo/assets/js/multiple-select.js"></script>
	
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyC_ObHusplO496mcKvJE8sS3p4rFdUmRL0"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OverlappingMarkerSpiderfier/1.0.3/oms.min.js"></script>

</body>
    <script>
        $(function() {
            $('#state').multipleSelect({
                width: '100%'
            });
            $('#city').multipleSelect({
                width: '100%'
            });
            $('#add1').multipleSelect({
                width: '100%'
            });
            $('#add2').multipleSelect({
                width: '100%'
            });
            $('#post').multipleSelect({
                width: '100%'
            });
            $('#postpre').multipleSelect({
                width: '100%'
            });
        });
    </script>
</html>