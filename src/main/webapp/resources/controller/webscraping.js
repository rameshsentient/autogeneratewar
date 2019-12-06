
app.controller('webscraping',function($window,$scope,$rootScope, $localStorage, $http){
	$scope.uAccess=$localStorage.uAccess;
	$scope.loadr=false;
	$scope.findType='find';
	$scope.queryList=[];
	$scope.webData={};
	
	var OWNER_API_KEY = "";
	
	  $http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;	      
	      //alert(OWNER_API_KEY);
	  });
	  
	  
	$scope.addQueryList=function (){
		
		if($scope.title!=undefined && $scope.title !=''){
			
			if($scope.tag!=undefined && $scope.tag !='' || $scope.idorclass!=undefined && $scope.idorclass){
				var data={
						title:$scope.title,
						findType:$scope.findType,
						tag:$scope.tag,
						atribute:$scope.atribute,
						idorclass:$scope.idorclass
					 }
			
			
			if($scope.tag !=undefined || $scope.tag !=''){
				data.tag=$scope.tag
			}
			if($scope.idorclass !=undefined || $scope.idorclass !=''){
				if($scope.atribute=='id'){
					data["id"]=$scope.idorclass;
				}else{
					data["class"]=$scope.idorclass;
				}
			}
			
			$scope.queryList.push(data);
			$scope.title=$scope.tag=$scope.idorclass='';
			$scope.findType='find';
			$scope.atribute='';
			}else{
				$scope.popUpMsg='Please fill the tag or class';
				jQuery('#errorModal').modal();
			}
		
		}else{
			$scope.popUpMsg='Please fill the title';
			jQuery('#errorModal').modal();
			
		}
	
	}
	
	$scope.removeQueryList=function (index){
		$scope.queryList.splice(index,1);
	}
	
	$scope.cancelFor=function (){
		$scope.findType='find';
		$scope.url='';
		$scope.queryList=[];
		$scope.results=[];
	}
	
	
	$scope.createScraping=function(){
		
		if($scope.url !=undefined && $scope.url !='' && $scope.queryList.length>0){
			$scope.loadr=true;
			$scope.webData.url=$scope.url;
			$scope.webData.queryList=$scope.queryList;
			
			console.log($scope.webData);
			
			$http({
	   		 		url: WEB_SCRAPING,
		            method: 'POST',
		            headers:{'x-api-key':OWNER_API_KEY},
		            data:JSON.stringify($scope.webData),
		            processData: false,
					contentType: false,
					cache: false,
				   	}).success(function(response){
				   		console.log(response);
				   		$scope.resultStatus=response.status;
				   		if(response.status=='success'){
				   			$scope.results=response.results;
				   		}else{
				   			$scope.errMsg=response.message;
				   		}
				   		$scope.loadr=false;
				   	});
		}else{
			$scope.popUpMsg='Please enter the url and querylist';
			jQuery('#errorModal').modal();
		}
		
	}
	
	jQuery('#topMenu').css("display", "block");
});