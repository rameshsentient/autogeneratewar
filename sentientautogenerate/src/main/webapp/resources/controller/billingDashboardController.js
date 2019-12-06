app.controller('billingDashboardController',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
		
	$scope.isDay = true;
	$scope.loadeer = false;
	$scope.colorArray = ["#66b7dc","#6892cc","#626cb1","#6e65ab","#8869ab","#a36dac","#bc6eaa","#dc6967","#dc8c67","#784193","#bba8c3","#9f84aa","#b39dbb","#c9bac8","#e7c0cd","#1b5faa","#094b8a","#12395f","#10243a","#131328","#6f6f6f","#595958","#424242","#2e2e2f","#1b1c1b","#0b2a29","#0e3b39","#114d60","#106a88","#09aadc","#7eba27","#41ab34","#4c8b32","#386229","#273b1c","#a14795","#96398d","#881d6a","#5f194c","#390f2e","#784193","#72368c","#642482","#47235c","#2d173b"];
	
	$scope.columnTotalList = []
	
	$scope.stackChartData = []
	
	$scope.tableHeadder = []
	
	$scope.tableData = []
	
	$scope.pieChartData = []
	
	$scope.currentMonthTempTotal = 0;
	
	$scope.lastMonthTempTotal = 0;
	
	$scope.showCurrentMonthYear = "";
	
	$scope.downloadLink = "";
	
	$scope.downloadLinkDay = "";
	
	$scope.downloadLinkMonth = "";
	
	var OWNER_API_KEY = "";
	
	$scope.stackChartDataMonth = [];
    $scope.tableDataMonth = [];
    $scope.tableHeadderMonth = [];
    
    $scope.stackChartDataDay = []
    $scope.tableDataDay = [];
    $scope.tableHeadderDay = [];
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});	
	
	$scope.showData = function(viewData) {
		$scope.isDay = viewData =="day";
		
		if(viewData == "day") {
			$scope.columnTotalList = [];
			$scope.drawChart("day");			
			$scope.tableHeadder = $scope.tableHeadderDay;
			$scope.tableData = $scope.tableDataDay;
			console.log($scope.tableHeadderDay);
			console.log("day >>>>>>>>");
			$scope.downloadLink = $scope.downloadLinkDay;
		}
		else {
			$scope.columnTotalList = [];
			$scope.drawChart("month");
			$scope.tableHeadder = $scope.tableHeadderMonth;
			$scope.tableData = $scope.tableDataMonth;
			console.log($scope.tableHeadderMonth);
			$scope.downloadLink = $scope.downloadLinkMonth;
			console.log(">>>>> month");
		}
		
		
	}

	$scope.loadData = function() {
	
		$scope.loadeer = true;	
		$scope.barchartData = []
		$http({
	        url: BILLING_DASHBOARD,
	        method: "POST",
	        
	        data: {"orgId" : ORG_ID }
	    }).then(function(response) {
            //console.log(JSON.stringify(response));
            
            $scope.pieChartData = response.data.pieChartData;
            
            $scope.stackChartDataDay = response.data.stackChartData;            
            $scope.tableDataDay = response.data.tableData.tableData;
            $scope.tableHeadderDay = response.data.tableData.headder;
            
            $scope.tableData = $scope.tableDataDay;
            $scope.tableHeadder = $scope.tableHeadderDay;
            
            $scope.drawChart("day");
            $scope.drawDonutChart();
            
            $scope.stackChartDataMonth = response.data.monthChartData;
            $scope.tableDataMonth = response.data.monthTableData.tableData;
            $scope.tableHeadderMonth = response.data.monthTableData.headder;
            
            $scope.showCurrentMonthYear = response.data.barChartData["currentMonth"];
            $scope.lastMonthTempTotal = response.data.barChartData["lastMonthTotal"];
            $scope.barchartData = [
        	                       ['', ''],
        	                       ['Last Month \n('+response.data.barChartData["lastMonth"]+')', response.data.barChartData["lastMonthTotal"]],
        	                       ['This month \n('+response.data.barChartData["currentMonth"]+')', response.data.barChartData["currentMonthTotal"]]
        	                     ];
            $scope.drawBarChart();
            
            $scope.currentMonthTempTotal = response.data.barChartData["currentMonthTotal"];
            
            $scope.downloadLinkDay = response.data["csvURL"];
            $scope.downloadLinkMonth = response.data["csvMonthURL"];
            $scope.downloadLink = $scope.downloadLinkDay;
            $scope.loadeer = false;
	    });
	
		
	}
	
	
	$scope.drawChart = function(type) {
		
		google.charts.load("current", {packages:["corechart"]});
		
		google.charts.setOnLoadCallback(setChartData);
		
		function setChartData() {
			
			if(type == "day") {
				$scope.stackChartData = $scope.stackChartDataDay;				
			}
			else {
				$scope.stackChartData = $scope.stackChartDataMonth;
			}
		
			var data = google.visualization.arrayToDataTable($scope.stackChartData);
			
			
			var options = {
					title: '', isStacked:true,
					legend: { position: 'bottom', alignment: 'start' },
					colors: $scope.colorArray
					};  
	
	        // Instantiate and draw the chart.
	        var chart = new google.visualization.ColumnChart(document.getElementById('chart1'));
	        
	        chart.draw(data, options);
		}
	}
	
	$scope.drawDonutChart = function() {
		
	      google.charts.load("current", {packages:["corechart"]});
	      google.charts.setOnLoadCallback(drawChart);
	      function drawChart() {
	        var data = google.visualization.arrayToDataTable($scope.pieChartData);

	        var options = {
	          title: '',
	          pieHole: 0.4,
	          colors: $scope.colorArray
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	        chart.draw(data, options);
	      }
	}
	
	
	
	$scope.drawBarChart = function() {
		
		  google.charts.load('current', {'packages':['bar']});
	      google.charts.setOnLoadCallback(drawBarChart);
	      function drawBarChart() {
	        var data = google.visualization.arrayToDataTable($scope.barchartData);

	        var options = {
	        		legend: { position: 'none' },
	        		bar: { groupWidth: "50%" },
	        		colors: $scope.colorArray,
	        		type : "column"
	        };

	        var chart = new google.charts.Bar(document.getElementById('barchart'));
	        
	        var formatter = new google.visualization.NumberFormat(); //{ prefix: '$'}
	        formatter.format(data, 1);
	        // Convert the Classic options to Material options.
	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
	}
	
	$scope.loadData();
	
	$scope.getnCallTotal = function() {
		
		angular.forEach($scope.tableData, function(value, key) {
			  this.push(key + ': ' + value);
			}, log);
		
	}
	
	
	
	$scope.getTotalForRow = function(rowIndex, value) {
		if(rowIndex > 0) {
			var isAdded = false;
			angular.forEach($scope.columnTotalList, function(item) {
				
				if(item.rowKey == rowIndex) {
					item.value = item.value + value;
					isAdded = true;
				}			
			} );
			if(!isAdded) {
				$scope.columnTotalList.push({"rowKey": rowIndex, "value":value});
			}
		}
	}
	
	
	
	jQuery('#topMenu').css("display", "block");
	
});
