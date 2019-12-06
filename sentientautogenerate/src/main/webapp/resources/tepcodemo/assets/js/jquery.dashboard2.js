	
	$('#view_by').append("CASE A");
	var startDate='2018-01-01';
	var endDate='2018-01-31';

	var fromValue=$('#fromValue').val();
	var toValue=$('#toValue').val();
	
	var minimum=1;
	var maximum=1000;
	var callCheck=true;

	$('#state').val(["神奈川県"]);

	$('.dropdown-menu a.dropdown-item').on('click', function(){
		$('#view_by').empty();
		$('#view_by').append($(this).text());
		view_by=$(this).text();
		if(view_by=='CASE B'){
			document.getElementById('map').innerHTML="";
			$('#r1').css('visibility', 'hidden');
			$('#t1').css('display', 'block');
			$('#t2').css('display', 'block');
			$('#t3').css('display', 'block');
			$('#t4').css('display', 'block');
		}else{
			getChartData();
			$('#r1').css('visibility', 'visible');
			$('#t1').css('display', 'none');
			$('#t2').css('display', 'none');
			$('#t3').css('display', 'none');
			$('#t4').css('display', 'none');
		}
		
	});
	
	
	   $(function() {
	   $('#datepicker').daterangepicker({
		   opens: 'left',
		   format: 'dd-mm-yyyy',
		   startDate:new Date(startDate),
		   endDate:new Date(endDate)

	   }, function(start, end, label) {
		   console.log("new date selection: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		   startDate=start.format('YYYY-MM-DD');
		   endDate=end.format('YYYY-MM-DD');
		   getChartData();
	   });
	   });
	  
		$("#state").change(function()  {
			
			var clickedOption = $(this).val();
			$('#d2').css('display', 'none');
			if($('#state').val().length>0){
				$('#d2').css('display', 'block');
				if(callCheck){
					setQuery(clickedOption,2,"#city");
					callCheck=false;
				}
			}else{
				$('#d2').css('display', 'none');
				$('#d3').css('display', 'none');
				$('#d4').css('display', 'none');
				$('#d5').css('display', 'none');
				$('#d6').css('display', 'none');
			}
		});  
		
		$("#city").change(function()  {
			var clickedOption = $(this).val();
			$('#d3').css('display', 'none');
			if($('#city').val().length>0){
				$('#d3').css('display', 'block');
				if(callCheck){
					setQuery(clickedOption,3,"#add1");
					callCheck=false;
				}
			}else{
				$('#city').val([]);
				$('#d3').css('display', 'none');
				$('#d4').css('display', 'none');
				$('#d5').css('display', 'none');
				$('#d6').css('display', 'none');
			}
			
		});

		$("#add1").change(function()  {
			var clickedOption = $(this).val();
			$('#d4').css('display', 'none');

			if($('#add1').val().length>0){
				$('#d4').css('display', 'block');
				if(callCheck){
					setQuery(clickedOption,4,"#add2");
					callCheck=false;
				}
			}else{
				$('#d4').css('display', 'none');
				$('#d5').css('display', 'none');
				$('#d6').css('display', 'none');
			}
			
		});      
		$("#add2").change(function()  {
			var clickedOption = $(this).val();
			$('#d5').css('display', 'none');

			if($('#add2').val().length>0){
				$('#d5').css('display', 'block');
				if(callCheck){
					setQuery(clickedOption,5,"#post");
					callCheck=false;
				}
			}else{
				$('#d5').css('display', 'none');
				$('#d6').css('display', 'none');
			}
			
		});      
		$("#post").change(function()  {
			var clickedOption = $(this).val();
			$('#d6').css('display', 'none');

			if($('#post').val().length>0){
				$('#d6').css('display', 'block');
				if(callCheck){
					setQuery(clickedOption,6,"#postpre");
					callCheck=false;
				}
			}else{
				$('#d6').css('display', 'none');
			}
			
		});      
	
	var addressArray=[];
	function getChartData(){
		var locationvalues=[]
		addressArray=[];
		$('#progress').css("display","block");
		$('#loader').css("display","block");
		var locationType=['ad_prefe_knj','ad_sikuc_knj','ad_oaza_knj','ad_azcho_knj','kj_ky_adres_gik_no','kj_ky_adres_eda_no'];
		

		for(i in locationType){
			var locType=locationType[i];

			if(locType=='ad_prefe_knj'){
				if($('#state').val().length>0){
					locationvalues.push({"locationtype":locType,"locationvalue":$('#state').val()});
				}
				
			}else if(locType=='ad_sikuc_knj'){
				if($('#city').val().length>0){
					locationvalues.push({"locationtype":locType,"locationvalue":$('#city').val()});
				}
			}else if(locType=='ad_oaza_knj'){
				if($('#add1').val().length>0){
					locationvalues.push({"locationtype":locType,"locationvalue":$('#add1').val()});
				}
			}else if(locType=='ad_azcho_knj'){
				if($('#add2').val().length>0){
					locationvalues.push({"locationtype":locType,"locationvalue":$('#add2').val()});
				}
			}else if(locType=='kj_ky_adres_gik_no'){
				if($('#post').val().length>0){
					locationvalues.push({"locationtype":locType,"locationvalue":$('#post').val()});
				}
			}else if(locType=='kj_ky_adres_eda_no'){
				if($('#postpre').val().length>0){
					locationvalues.push({"locationtype":locType,"locationvalue":$('#postpre').val()});
				}
			}
		}

		//var place="'足柄上郡  松田町','足柄上郡  中井町','足柄上郡  開成町','横浜市  瀬谷区'";
		console.log(locationvalues);
			
		var data={
				startdate:startDate,
				enddate:endDate,
				energythreshold:fromValue+"",
				//locationtype:locationType,
				locationvalues:locationvalues
				
			}
		console.log(data);
		var url='https://hr0kiybzd7.execute-api.ap-southeast-1.amazonaws.com/dev/tepco/geospatial';
		if(view_by=='CASE B'){
			url='https://hr0kiybzd7.execute-api.ap-southeast-1.amazonaws.com/dev/tepco/geospatialcompare';
			if(locationvalues.length<2){
				$('#loader').css("display","none");
				$('#mbodytxt').text('Please select minimum 2 filter');
				$('.bs-example-modal-sm').modal('show');
				return;
			}
		}
		
		$.ajax({
			url: url,
			method: "POST",
			dataType: 'json',
			contentType: 'application/json',
			data: JSON.stringify(data),
			success: function(result){
				$('#loader').css("display","none");
				$('#chartDiv').css("display","block");
				
				console.log(result);
				records=result.records;
				if(records.length>0){
					if(view_by=='CASE B'){
						var households=records.length.toString().replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						var minimum=result.minimum.toString().replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						var maximum=result.maximum.replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						var average=result.average.replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						$('#households').text(households);
						$('#minimum').text(minimum);
						$('#maximum').text(maximum);
						$('#average').text(average);

						for (i in records){
							
							addressArray.push({
								'households':households,
								'minimum':minimum,
								'maximum':maximum,
								'average':average,
								'dkyno':records[i].dkyno,
								'lat':records[i].lat,
								'lng':records[i].lon,
								'address':records[i].address,
								'unittotal':records[i].unittotal,
								'spike':records[i].spike,
							});
						}

					}else{
						for (i in records){
							addressArray.push({'days':records[i].days, 'dkyno':records[i].dkyno, 'lat':records[i].lat, 'lng':records[i].lon, 'address':records[i].address});
						}
					}
				}else{
					$('#mbodytxt').text('no data found');
					$('.bs-example-modal-sm').modal('show');
					
				}
				
					//console.log(addressArray);
					setGoogleMap(addressArray);
			},
			error: function(er){
				console.log(er);
				$('#loader').css("display","none");
				$('#chartDiv').css("display","block");
				$('#mbodytxt').text('Connection timeout try again');
				$('.bs-example-modal-sm').modal('show');
			}
		});
	}
	

var $range = $("#range_01"),
    from = 1,
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

	$("#range_01").ionRangeSlider({
        min: 1,
        max: 100,
		from: 15,
		to: 50,
		postfix:' kWh',
		onStart: function (data) {
			saveResult(data);
		},
		onChange: saveResult,
		onFinish: function (data){
			getChart(data);
		}
	});
});

		//GOOGLE MAP 
		var home={lat: 35.4424318, lng: 139.1176414};
		var latLang=[];
		var markers=[];
	
		function setGoogleMap(datas){
			latLang=datas;
			initMap();
		}
	
	  var oms="";	
      function initMap() {
		document.getElementById('map').innerHTML="";
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 10,
          center: home
        });
		var geocoder = new google.maps.Geocoder;
		var infowindow = new google.maps.InfoWindow;
		
		oms = new OverlappingMarkerSpiderfier(map, {
			  markersWontMove: true,
			  markersWontHide: true,
			  basicFormatEvents: true
			});
       
		geocodeLatLng(geocoder, map, infowindow);
      
      }

      function geocodeLatLng(geocoder, map, infowindow) {
     
        //var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
        geocoder.geocode({'location': home}, function(results, status) {
          if (status === 'OK') {
            if (results[0]) {
             // map.setZoom();
              markers=[];	
			  for(i in latLang){
					addMarker(map,infowindow,latLang[i],i);
			  }
			  
			  console.log(markers.length);
			  
			  
            
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });
		
      }
	  var colors=['#000cf9','#4048ed','#8186e8','#7e80a8','#ababb2'];
	  
	  
	  function addMarker(map,infowindow,latData,i){
		
		var marker = new google.maps.Marker({
			position: {lat:parseFloat(latData.lat),lng:parseFloat(latData.lng)},
			//map: map
		});

		var contentString="";
		var tableStr="";
		if(view_by=='CASE B'){
		
			contentString = '<div id="content">'+
							'<div id="siteNotice">'+
							'</div>'+
							'<h3 id="firstHeading" class="firstHeading">Details</h3>'+
							'<div id="bodyContent">'+
							
							'<p><b>Minimum :</b>'+ latData.minimum +'</p>'+
							'<p><b>Maximum :</b>'+ latData.maximum +'</p>'+
							'<p><b>Average :</b>'+ latData.average +'</p><br>'+
							'<p><b>Dkyno :</b>'+ latData.dkyno +'</p>'+
							'<p><b>Address :</b>'+ latData.address +'</p>'+
							'<p><b>Unittotal :</b>'+ latData.unittotal +'</p>'+
							'<p><b>Spike :</b>'+ latData.spike +' %</p>'+
							'</div>'+
							'</div>';
		}else{
			var days=latData.days;
			for (j in days){
				tableStr=tableStr+"<tr><td>"+days[j].date+"</td>"+"<td>"+days[j].unittotal+"</td>"+"<td>"+days[j].spike+" %</td></tr>";
			}

			contentString = '<div id="content">'+
							'<div id="siteNotice">'+
							'</div>'+
							'<h3 id="firstHeading" class="firstHeading">Details</h3>'+
							'<div id="bodyContent">'+
							'<p><b>Dkyno :</b>'+ latData.dkyno +'</p>'+
							'<p><b>Address :</b>'+ latData.address +'</p>'+
							'<p><b>Days :</b></p>'+
							'<table id="customers">'+
							'<tr><td>Date</td><td>Unittotal</td><td>Spike</td></tr>'+tableStr+
							'</table>'+
							
							'</div>'+
							'</div>';

		}
		
		google.maps.event.addListener(marker,'spider_click', function() {
			infowindow.setContent(contentString);
			infowindow.open(map, marker);
		  });
		oms.addMarker(marker);
	  }

	  function setDropdowns(coulmn,str,id){
		$.ajax({
			url: "https://script.google.com/a/peristera.net/macros/s/AKfycbwdpFPn6qSNna5BUsGRrZQJW4W5TgvV2QX4mpJolinFn2o0FunO/exec",
			method: "POST",
			data:{"column":coulmn,"str":str},
			dataType:"json",
			success: function(result){
				callCheck=true;
				console.log(result);
				var datas=result.datas;
				$(id).empty();
				for(i in datas){
					$(id).append('<option value="'+datas[i].value+'">'+datas[i].value+'</option>');
				}
				
				$(id).multipleSelect({});
			},
			timeout: 600000
			
		});

	  }

function setQuery(clickedOption,column,id){
	var queryStr="";
			var el = clickedOption.filter(function(el) {
				if(queryStr!=""){
					queryStr=queryStr+",";
				}
				queryStr=queryStr+el;
			});

			setDropdowns(column,queryStr,id);
}