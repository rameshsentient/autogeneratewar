<!DOCTYPE html>
<html lang="en">
<%@include file="session.jsp"%>
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
	<!-- Date Range -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
    <link href="resources/tepcodemo/assets/libs/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet">
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
		
		</style>
	
</head>

<body>
    <!-- Begin page -->
    <div id="wrapper">
        <!-- Navigation Bar-->
        <header id="topnav">
            <nav class="navbar-custom">
              
                <ul class="list-unstyled menu-left mb-0">
                    <li class="float-left"><a href="javascript: void(0);" class="logo logo-light"><span class="" style="font-size:16px;font-weight:bold;color:#bdc3d0">TEPCO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="logo-sm"><img src="assets/images/logo_sm.png" alt="" height="28"></span></a></li>
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
                       
                       <!-- <li><a href="javascript:void(0);"><i class="mdi mdi-google-pages"></i> <span>Additional Services </span></a> </li>-->
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
                        <h4 class="page-title">Dashboard 1</h4></div>
                    <!-- End page title box -->
					<div class="row">
						
						<div class="col-sm-12 col-xs-12">
							<div class="card-box">
                                <div class="dropdown float-right"><a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <!-- item--><a href="javascript:void(0);" class="dropdown-item">Month</a>
                                        <!-- item--><a href="javascript:void(0);" class="dropdown-item">Year</a>
                                        <!-- <a href="javascript:void(0);" class="dropdown-item">Date Range</a>item-->
									</div>
                                </div>
								
								<h4 class="header-title mb-3 float-right" id="view_by" ></h4>
								
								<div class="row text-center">
									<input type="hidden" id="fromValue">
									<input type="hidden" id="toValue">
									<div class="col-sm-8 mb-3" id="range1">
											<input type="text" id="range_03">
									</div>
									<div class="col-sm-8 mb-3" id="range2" style="display:none !important">
											<input type="text" id="range_04">
									</div>
									<div class="col-sm-4 mb-3">
										<select class="form-control select2 mb-3" id="year1" style="width:100px;position: absolute;top: 34px;left: 85px;">
											<option value="2018">2018</option>
											<option value="2017">2017</option>
											<option value="2016">2016</option>
									</select>
									</div>
									
								</div>
								 <div class="float-right" style="position: relative;bottom: 50px;">
										<select class="form-control select2 mb-3" id="month" style="width:200px">
											<option value="01">January</option>
											<option value="02">February</option>
											<option value="03">March</option>
											<option value="04">April</option>
											<option value="05">May</option>
											<option value="06">June</option>
											<option value="07">July</option>
											<option value="08">August</option>
											<option value="09">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
										</select>
                                       <select class="form-control select2 mb-3" id="year" style="width:100px;display:none;">
											<option value="2018">2018</option>
											<option value="2017">2017</option>
											<option value="2016">2016</option>
										</select>
										 <div class="form-group mb-3" id="daterange" style="display:none;width:200px">
                                            <input type="text" id="datepicker" class="form-control">
                                        </div>
                                </div>
                            </div>
                            <!-- end card-box-->
						
						</div>
					</div>
					
                    <div class="row">
                        <div class="col-xl-3">
                            <div class="card-box">
                                <h4 class="header-title text-center">Number of households</h4>
                                <!-- <p class="text-muted">March 26 - April 01</p>-->
                                <div class="mb-3 mt-4">
                                    <div class="float-right d-none d-xl-block"></div>
                                    <h4 class="font-weight-light text-center"><span id="households"></span></h4></div>
                            </div>
                        </div>
						 <div class="col-xl-3">
                            <div class="card-box" style="height: 136px;">
                              
                                <h4 class="header-title text-center">Average Energy <span class="font12">(kWh)</span></h4>
								  <div class="mb-3 mt-4">
                                    <div class="float-right d-none d-xl-block"></div>
                                    <h4 class="font-weight-light text-center"><span id="average"></span> </h4></div>
                            </div>
                           
                        </div>
						 <div class="col-xl-3">
                            <div class="card-box">
                                <h4 class="header-title text-center">Minimum Energy <span class="font12">(kWh)</span></h4>
								<!--<p class="text-muted">March 01 - April 01</p>-->
                                <div class="mb-3 mt-4">
                                    <div class="float-right d-none d-xl-block"></div> 
                                    <h4 class="font-weight-light text-center"><span id="minimum"></span> </h4></div>
									<div class="chartjs-chart dash-sales-chart" style="display:none">
										<canvas id="sales-chart"></canvas>
									</div>
                            </div>
                        </div>
						 <div class="col-xl-3">
                            <div class="card-box">
                                <h4 class="header-title text-center">Maximum Energy <span class="font12">(kWh)</span></h4>
                                <div class="mb-3 mt-4">
                                    <div class="float-right d-none d-xl-block"></div>
                                    <h4 class="font-weight-light text-center"> <span id="maximum"></span> </h4></div>
									<div class="chartjs-chart dash-sales-chart" style="display:none;">
										<canvas id="sales-chart"></canvas>
										
									</div>
									
                            </div>
                           
                        </div>
                        <!-- end col -->
                        <div class="col-xl-12">
                            <div class="card-box">
                               
                                <h4 class="header-title mb-3">Number of households energy consumption within the range (<span class="font12">kWh</span>)</h4>
								<img id="loader"  src="resources/tepcodemo/assets/css/loader.gif" style="display:none; width: 80px;height: 80px;position: absolute;top:150px;left: 450px"/>
                                 <span id="nodata" style="display: none;">no datas found</span>
                                <div class="chartjs-chart high-performing-product" id="chartDiv">
                                    
                                </div>
                                
                            </div>
                            <!-- end card-box-->
                        </div>
                        <!-- end col -->
                       
                    </div>
                    <!-- end row -->
			
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
	 <!-- Range slider js -->
    <script src="resources/tepcodemo/assets/libs/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
    <script src="resources/tepcodemo/assets/js/jquery.range-sliders.js"></script>
  
    <!-- Dashboard Init JS -->
    <script src="resources/tepcodemo/assets/js/jquery.dashboard.js"></script>
    <!-- App js -->
    <script src="resources/tepcodemo/assets/js/jquery.core.js"></script>
    <script src="resources/tepcodemo/assets/js/jquery.app.js"></script>
    <script>
        $(document).ready(function() {
            // Default Datatable
            $('#datatable').DataTable({
                "pageLength": 5,
                "searching": false,
                "lengthChange": false
            });
        });
    </script>
		 <script type="text/javascript">

				
   
			  
			</script>
</body>

</html>