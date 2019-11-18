app.controller('pageProfiler',function($scope,$timeout,documetService, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	var OWNER_API_KEY = "";
	
	$scope.searchMain=true;
	$scope.searchResult=false;
	$scope.errorMessage = "";
	
	  $http.get('./app-config-prop.json').then(function (response) {
		  //console.log(response);
	      //console.log('ID is ', response.data.ID);
	      //console.log('API_KEY is ', response.data.API_KEY);
	      OWNER_API_KEY = response.data.API_KEY;
	      
	      //alert(OWNER_API_KEY);
	  });	
	
	  
	$scope.setPageProfile=function(){
		$scope.errorMessage = "";
		$scope.outputData = [];
		$scope.ngramsData={};
		if($scope.searchKey != undefined && $scope.searchKey != ""){
			if($scope.searchKey.startsWith("http://") || $scope.searchKey.startsWith("https://")) {			
				$scope.loader=true;
				$scope.searchMain=false;
				$scope.searchResult=true;
				
				var data={
						articleUrl:$scope.searchKey
				}
				
				$http({
		    		 url: URL_INDEXING_URL,
			            method: 'POST',
			            data:JSON.stringify(data),
			            dataType : 'json',
			            contentType : "application/json",
			            headers:{'x-api-key':OWNER_API_KEY}	,
			            timeout: 600000
		    	}).success(function(res){
					console.log(">>>>>>>>>");
					console.log(res);
					$scope.loader = false;
					
					if(res == null || res == "null") {
						$scope.errorMessage = Connection_timeout;
					}
					var data = res;
					data = data.results;
					
					if(res.status=='failure'){
						$scope.errorMessage = res.message;
					}else{
						try {
							if(data.articleContentProfile.categories == undefined || data.articleContentProfile.categories.length==0 )
							{
								$scope.errorMessage = Node_Weight_not_fount;
							}
							else
							{
								$scope.outputData = data.articleContentProfile.categories;
								console.log(data.articleContentProfile.lang);
								$scope.ngramsData = data.articleContentProfile["n-grams"];
								
								//console.log($scope.ngramsData);
							}
							
						} catch (e) {
							$scope.errorMessage = Node_Weight_not_fount;
						}
					}
					
					$scope.loader = false;
					
	//				console.log($scope.outputData.length);
				}).error(function(res){
				//	console.log(res);
					
					if(res == null || res == "null") {
						$scope.errorMessage = Connection_timeout;
					}else {
						$scope.errorMessage = JSON.stringify(res);
					}
					$scope.loader = false;
				});
			}else {
				$scope.errorMessage = valid_URL;
			}
		}
	}
	
	jQuery('#topMenu').css("display", "block");
});

app.filter('orderObjectBy', function(){
	 return function(input, attribute) {
	    if (!angular.isObject(input)) return input;

	    var array = [];
	    for(var objectKey in input) {
	        array.push(input[objectKey]);
	    }

	    array.sort(function(a, b){
	        a = parseFloat(a[attribute]);
	        b = parseFloat(b[attribute]);
	        return b-a;
	    });
	    return array;
	 }
	});
