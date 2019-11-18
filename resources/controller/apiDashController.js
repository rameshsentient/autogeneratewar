app.controller('apiDashController',function($scope,$timeout, $localStorage, $http){
	
	$scope.loadeer = false;
	
	$scope.uAccess=$localStorage.uAccess;
	$localStorage.orgDatum={id:orgid};
	$scope.orgid = orgid;
	
//	alert($scope.orgid);
	
	$scope.planyType = "";
	$scope.planTypes = {};
	
	$scope.apiEndpointStatusData = [];
	
	$scope.colorArray = ["#66b7dc","#6892cc","#626cb1","#6e65ab","#8869ab","#a36dac","#bc6eaa","#dc6967","#dc8c67","#784193","#bba8c3","#9f84aa","#b39dbb","#c9bac8","#e7c0cd","#1b5faa","#094b8a","#12395f","#10243a","#131328","#6f6f6f","#595958","#424242","#2e2e2f","#1b1c1b","#0b2a29","#0e3b39","#114d60","#106a88","#09aadc","#7eba27","#41ab34","#4c8b32","#386229","#273b1c","#a14795","#96398d","#881d6a","#5f194c","#390f2e","#784193","#72368c","#642482","#47235c","#2d173b"];
	
	
	var date = new Date();
	var last = new Date(date.getTime() - (7 * 24 * 60 * 60 * 1000));
	var day =last.getDate();
	var month=last.getMonth()+1;
	var year=last.getFullYear();
	
	var current = date.getMonth()+1;
	
	var OWNER_API_KEY = "";
	
	$scope.fromDate =  year+"-"+month+"-"+day;
	$scope.toDate = date.getFullYear()+"-"+current +"-"+date.getDate();

	console.log($scope.fromDate);
	console.log($scope.toDate);


	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});	
	

	$scope.getBarChartData = function() {
		$scope.loadeer = true;
		console.log($scope.fromDate);
		console.log($scope.toDate);
		$http({
	        url: API_METTERING_DASHBOARD,
	        method: "POST",
	        
	        data: { "fromDate" : $scope.fromDate, "toDate" : $scope.toDate, "orgId" : ORG_ID }
	    }).then(function(response) {
            console.log(JSON.stringify(response));
            $scope.setBarData(response);
            $scope.loadeer = false;
	    });
	}
	
	
	$scope.getAPIEndpointStatus = function(selectDate) {
		
		var fromDate = $scope.fromDate;
		var toDate = $scope.toDate;
		
		if(selectDate != "") {
			
			
			var datObj = selectDate.split("-");
			
			var date1 = new Date();
			
			var dateValue = date1.getFullYear()+"-"+datObj[1]+"-"+datObj[0]+"";
			
			//alert(dateValue);
						
			
			fromDate = dateValue;
			toDate = dateValue;
		}
		
		$http({
	        url: API_ENDPOINT_STATUS,
	        method: "POST",
	        
	        data: { "fromDate" : fromDate, "toDate" : toDate, "orgId" : ORG_ID }
	    }).then(function(response) {
            console.log(JSON.stringify(response));
            $scope.apiEndpointStatusData = response.data.results;
            
            $scope.setCorechartData();
        	
	    });
		
	}
	
	$scope.setCorechartData = function() {
	      google.charts.load("current", {packages:["corechart"]});
	      google.charts.setOnLoadCallback(drawChart2);
	      function drawChart2() {
	    	  
	    	  //$scope.apiEndpointStatusData
	    	  
	    	var data2 =   [['Task', 'Hours per Day'] ];
	    	
	    	for(i in $scope.apiEndpointStatusData){
	    		
	    		data2.push([$scope.apiEndpointStatusData[i].functionCode, $scope.apiEndpointStatusData[i].count]);
	    	}
	    	
	    	
	        var data = google.visualization.arrayToDataTable(data2);

	        var options = {
	          pieHole: 0.4,
	          colors: $scope.colorArray,
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	        chart.draw(data, options);
	      }
	}
	
	$scope.setBarData = function(responce) {
		
		google.charts.load('current', {'packages':['bar']});
	      google.charts.setOnLoadCallback(drawChart);
	      
	      	var tepData = [
	          ['Date', 'API Calls']
	        ];
	      	
	      	var datas = responce.data.results;
	      	for(i in datas){
	      		tepData.push([datas[i].date, datas[i].count]);
	      	}
	      	
	      	if(datas.length > 0) {
	      		
	      		$("#mainDiv").show();
	      		$("#nodataDiv").hide();
	      		
	      	}
	      	else {
	      		
	      		$("#mainDiv").hide();
	      		$("#nodataDiv").show();
	      		
	      	}
	      	
	      	console.log(tepData);

	      function drawChart() {
	        var data = google.visualization.arrayToDataTable(tepData);

	        var options = {
	         colors: $scope.colorArray,
	         legend: { position: 'none' },
	          chart: {
	            
	          },
	          bars: 'vertical' // Required for Material Bar Charts.
	        };

	        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	        
	        google.visualization.events.addListener(chart, 'select', selectHandler);
	        
			function selectHandler(e) {				
				  var selection = chart.getSelection();
				  var message = '';
				  for (var i = 0; i < selection.length; i++) {
					var item = selection[i];
					if (item.row != null && item.column != null) {
						message = data.getValue(item.row, 0);
					} 
				  }
				  
				  //alert('You selected ' + message);
				  
				  if (message == '') {
					message = '';
					$scope.getAPIEndpointStatus("");
				  }
				  else {
					  $scope.getAPIEndpointStatus(message);
				  }
			}	        
	      }		
	}
	
	$scope.gotoDashboard = function(typ){
		$localStorage.menuTab = typ;
		$timeout(function(){
			location.href="catalog";
		}, 100)
	}
	
	
	$scope.setDefaultData = function() {
		$scope.getBarChartData();
		$scope.getAPIEndpointStatus("");		
	}
	
	$scope.setDefaultData();
	
	
	/*DATE RANGE PICKER*/
	
	var start = moment().subtract(6, 'days');
	var start1 = moment().subtract(6, 'days');
	var end = moment();

	function initialDate(start,end){
		
		if(start==0){
			start=start1;
		}
		
		$scope.isDateFound = false;
		
		$("#reportrange .dateElm").html('');
		
		if(start == 0 || '_i' in start && typeof start._i === 'string' || start._i instanceof String){

			$("#reportrange .dateElm").append("<span style='color:#aaa'>Date Range</span>");
			
			if ($scope.$root.$$phase != '$apply' && $scope.$root.$$phase != '$digest') {
			    $scope.$apply(function(){
					$scope.fromDate = "";
					$scope.toDate = "";
					resetDateFilter();
		        });
			}	
		}else{
			
			$('#reportrange .dateElm').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
			
				$scope.fromDate = start.format('YYYY-MM-DD');
				$scope.toDate = end.format('YYYY-MM-DD');
				$scope.getAPIEndpointStatus("");
		}
	}
	
	function resetDateFilter(){
		if($scope.loadeer){
			
		}
		else {
			$scope.fromDate = "";
			$scope.toDate = "";
			$scope.getAPIEndpointStatus("");
		}
	}

	
	
jQuery('#reportrange').daterangepicker({

	startDate: start,
	endDate: end,
	ranges: {
	   'Reset':[moment().subtract(1, 'day').format('MM/DD/YYYY HH:MM:SS'), moment()],
	   'Today': [moment(), moment()],
	   'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	   'Last 7 Days': [moment().subtract(6, 'days'), moment()],
	   'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	   'This Month': [moment().startOf('month'), moment().endOf('month')],
	   'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	}
	
}, initialDate);

initialDate(start, end);
	
	
	
	jQuery('#topMenu').css("display", "block");
	
});