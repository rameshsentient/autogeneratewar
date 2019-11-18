		
	$('#view_by').append("Month");
	
	//var month=new Date().getMonth();
	var month=01;
	if (month < 10) { month = '0' + month; }
	$('#month').val(month);
	var year=$('#year').val();
	
	var startDate='';
	var endDate='';
	
	var view_by="Month";
	var xAxesLabel="Date";
	
	var fromValue=$('#fromValue').val();
	var toValue=$('#toValue').val();
	
	var minimum=0;
	var maximum=1000;
	
	var labelArray=[];
	var dataArray=[];
	
	$('.dropdown-menu a.dropdown-item').on('click', function(){
		$('#view_by').empty();
		$('#view_by').append($(this).text());
		view_by=$(this).text();
		
		if(view_by=='Year'){
			xAxesLabel="Month";
			$('#range2').css("display","block");
			$('#range1').css("display","none");
			fromValue=0;
			toValue=1000;
		}else if(view_by=='Month'){
			$('#range1').css("display","block");
			$('#range2').css("display","none");
			fromValue=0;
			toValue=50;
		}
		else{
			xAxesLabel="Date";
		}
		setProperties(view_by);
	});
	
	
	   $(function() {
	   $('#datepicker').daterangepicker({
		   opens: 'left',
		   format: 'DD/MMM/YYYY',
	   }, function(start, end, label) {
		   console.log("new date selection: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		   startDate=start.format('DD-MM-YYYY');
		   endDate=end.format('DD-MM-YYYY');
		   initChart(0);
	   });
	   });
	
	function setProperties(view_by){
		if(view_by=='Month'){
			$('#month').css("display","block");
			$('#year').css("display","none");
			$('#daterange').css("display","none");
			$('#year1').css("display","block");
			getChartData();
		}else if(view_by=='Year'){
			$('#year').css("display","block");
			$('#month').css("display","none");
			$('#daterange').css("display","none");
			$('#year1').css("display","none");
		
			getChartData();
			
		}else{
			$('#daterange').css("display","block");
			$('#year').css("display","none");
			$('#month').css("display","none");
		}
	}

function checkSession(){
	$.ajax({
	    method: 'GET',
	    url: 'checkSession',
	    success: function(res){
	    	if(res=='N'){
	    		location.href="logout";
	    	}
	    },
	    error:function(err){
	    	console.log(err);
	    	
	    }
		
	});
}	

	var years_month= ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	
	function getChartData(){
		$('#chartDiv').empty();
		$('#households').text(0);
		$('#minimum').text(0);
		$('#maximum').text(0);
		$('#average').text(0);
		$('#loader').css("display","block");
		$('#nodata').css("display","none");
			checkSession();
		
			labelArray=[];
			dataArray=[];
		var data={
			  month: month,
			  year: year,
			  viewby: view_by.toLowerCase(),
			  rangefrom:fromValue.toString(),
			  rangeto:toValue.toString()
			}
		console.log(data);
		$.ajax({
			url: 'https://hr0kiybzd7.execute-api.ap-southeast-1.amazonaws.com/dev/tepco',
			method: "POST",
			dataType: 'json',
			contentType: 'application/json',
			data: JSON.stringify(data),
			success: function(result){
				console.log(result);
				$('#loader').css("display","none");
				
				result=result.results;
				maximum=result.households;
				if(result.records.length>0){
					$('#households').text(result.households.toString().replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$('#minimum').text(result.minimum.toString().replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$('#maximum').text(result.maximum.replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$('#average').text(result.average.replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					var records=result.records;
						for (i in records){
							if(result.viewby=='year'){
								var tempDate=records[i].date.split("-");
								labelArray.push(years_month[parseInt(tempDate[0]-1)]);
							}else{
								labelArray.push(records[i].date);
							}
							
							dataArray.push(parseInt(records[i].usercount));
						}
						
						initChart();
				}else{
					$('#nodata').css("display","block");
				}
				
				
			},
			error: function(er){
				$('#loader').css("display","none");
				console.log(er);                     
			}
		});
	}
	
	
	
	$('#month').on('change', function(){
		month=$(this).val();
		getChartData();
	});
	
	$('#year').on('change', function(){
		year=$(this).val();
		$('#year1').val(year);
		// YEARS DATE DATA
		getChartData();
	
	});
	$('#year1').on('change', function(){
		year=$(this).val();
		$('#year').val(year);
		// YEARS DATE DATA
		getChartData();
	
	});
	
	
	function initChart(){
		
	
	$('#chartDiv').append("<canvas id='high-performing-product'></canvas>");
	var myChart;
		! function(o) {
			"use strict";	
			
			var a = function() {	
				this.$body = o("body"), this.charts = []
			};
			a.prototype.respChart = function(a, r, e, t) {
				var n = Chart.controllers.line.prototype.draw;
				Chart.controllers.line.prototype.draw = function() {
					n.apply(this, arguments);
					var o = this.chart.chart.ctx,
						a = o.stroke;
					o.stroke = function() {
						o.save(), o.shadowColor = "#65708a", o.shadowBlur = 10, o.shadowOffsetX = 0, o.shadowOffsetY = 4, a.apply(this, arguments), o.restore()
					}
				}, Chart.defaults.global.defaultFontColor = "rgba(255,255,255,0.5)";
				var i = a.get(0).getContext("2d"),
					s = o(a).parent();
				
							new Chart(i, {
								type: "bar",
								data: e,
								options: t
							});
						
				
			}, a.prototype.initCharts = function() {
				var a = [],
					r = document.getElementById("sales-chart").getContext("2d").createLinearGradient(500, 0, 300, 0);
				r.addColorStop(0, "#0acf97"), r.addColorStop(1, "#02a8b5");
				a.push(this.respChart(o("#high-performing-product"), "Bar", {
					labels: labelArray,
					datasets: [{
						label: "Number of Households",
						backgroundColor: "#fa5c7c",
						borderColor: "#fa5c7c",
						borderWidth: 1,
						hoverBackgroundColor: "#fa5c7c",
						hoverBorderColor: "#fa5c7c",
						data: dataArray
					}]
				}, {
					maintainAspectRatio: !1,
					legend: {
						display: !1
					},
					scales: {
						yAxes: [{
							scaleLabel: {
							display: true,
							labelString: 'Households'
							},
							gridLines: {
								display: !1,
								
							},
							ticks: {
								max: parseInt(maximum),
								min: 0,
								stepSize: parseInt(maximum)/8
							}
						}],
						xAxes: [{
							barPercentage: .2,
							scaleLabel: {
							display: true,
							labelString: xAxesLabel
							},
							gridLines: {
								color: "rgba(0,0,0,0.03)"
							}
						}]
					}
				}));
				
			
				
			}, a.prototype.init = function() {
				var a = this;
				a.charts = this.initCharts()
			}, o.Dashboard = new a, o.Dashboard.Constructor = a
		}(window.jQuery),
		function(o) {
			"use strict";
			window.jQuery.Dashboard.init()
		}();
	}

var $range = $("#range_03"),
    from = 0,
    to = 39;
var count=0;
var saveResult = function (data) {
    from = data.from;
    to = data.to;
	fromValue=from;
	toValue=to;
	$('#fromValue').val(from);
    $('#toValue').val(to);
	if(count==0){
		getChartData();
	}
	count++;
};

var getChart = function (data) {
    from = data.from;
    to = data.to;
	fromValue=from;
	toValue=to;
	$('#fromValue').val(from);
    $('#toValue').val(to);
	getChartData();
	
};


$(document).ready(function() {
$("#range_03").ionRangeSlider({
        type: "double",
        grid: !0,
        min: 0,
        max: 100,
        from: 0,
        to: 50,
		postfix:' kWh',
		onStart: function (data) {
        saveResult(data);
    },
    onChange: saveResult,
    onFinish: function (data){
		getChart(data);
	}
    }),
	$("#range_04").ionRangeSlider({
        type: "double",
        grid: !0,
        min: 0,
        max: 2000,
        from: 0,
        to: 1000,
		postfix:' kWh',
		onStart: function (data) {
        saveResult(data);
    },
    onChange: saveResult,
    onFinish: function (data){
		getChart(data);
	}
    })
});
